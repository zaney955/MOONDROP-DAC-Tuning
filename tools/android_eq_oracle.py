"""Execute the official APK's ARM64 EQ converter in isolated Unicorn memory.

Analysis dependencies: unicorn, pyelftools. No USB or Android app launch.
Native libm imports are bridged to host libm through Python math; last-bit
identity with a physical Android device is therefore not asserted.
"""
import struct
import math
import collections
from elftools.elf.elffile import ELFFile
from unicorn import Uc, UC_ARCH_ARM64, UC_MODE_ARM, UC_HOOK_CODE
import unicorn.arm64_const as reg

class OfficialOracle:
    BASE=0x1000000
    STACK=0x2000000
    STUBS=0x3000000
    DATA=0x4000000
    TLS=0x5000000
    RETURN=0x300ff00
    SYMBOL='_Z29CxAudioConvertEqParams2CoeffsjP17EQ_BAND_PARAM_TAGP23_CX207xx_BAND_EQ_COEFFSi'
    def __init__(self,path):
        self.uc=Uc(UC_ARCH_ARM64,UC_MODE_ARM)
        u=self.uc
        for addr,size in [(self.BASE,0x20000),(self.STACK,0x100000),(self.STUBS,0x10000),(self.DATA,0x10000),(self.TLS,0x1000)]:u.mem_map(addr,size)
        self.stubs={};self.calls=collections.Counter()
        with open(path,'rb') as f:
            elf=ELFFile(f)
            for seg in elf.iter_segments():
                if seg['p_type']=='PT_LOAD':u.mem_write(self.BASE+seg['p_vaddr'],seg.data())
            syms=elf.get_section_by_name('.dynsym')
            symbols={s.name:s for s in syms.iter_symbols()}
            self.entry=self.BASE+symbols[self.SYMBOL]['st_value']
            for section in elf.iter_sections():
                if section['sh_type']!='SHT_RELA':continue
                for reloc in section.iter_relocations():
                    typ=reloc['r_info_type'];s=syms.get_symbol(reloc['r_info_sym']);name=s.name
                    if typ==1027:value=self.BASE+reloc['r_addend']
                    elif typ in (1025,1026,257):
                        if s['st_shndx']!='SHN_UNDEF':value=self.BASE+s['st_value']+reloc['r_addend']
                        else:
                            addr=self.STUBS+len(self.stubs)*16
                            self.stubs[addr]=name;u.mem_write(addr,bytes.fromhex('c0035fd6'));value=addr
                    else:raise ValueError(('unsupported relocation',typ))
                    u.mem_write(self.BASE+reloc['r_offset'],struct.pack('<Q',value))
        u.reg_write(reg.UC_ARM64_REG_CPACR_EL1,3<<20)
        u.reg_write(reg.UC_ARM64_REG_TPIDR_EL0,self.TLS)
        u.hook_add(UC_HOOK_CODE,self.hook,begin=self.STUBS,end=self.STUBS+0xfff)
    def fget(self,i=0,single=False):
        return struct.unpack('<f' if single else '<d',struct.pack('<I' if single else '<Q',self.uc.reg_read(getattr(reg,('UC_ARM64_REG_S' if single else 'UC_ARM64_REG_D')+str(i)))))[0]
    def fset(self,value,single=False):
        bits=struct.unpack('<I' if single else '<Q',struct.pack('<f' if single else '<d',value))[0]
        self.uc.reg_write(reg.UC_ARM64_REG_S0 if single else reg.UC_ARM64_REG_D0,bits)
    def hook(self,u,address,size,data):
        if address not in self.stubs:raise RuntimeError(('unknown import',hex(address)))
        name=self.stubs[address];self.calls[name]+=1
        if name in ('pow','sinh','log','log10','acos'):
            args=[self.fget()] + ([self.fget(1)] if name=='pow' else [])
            self.fset(getattr(math,name)(*args))
        elif name in ('atan2f','cosf','sinf','log10f'):
            args=[self.fget(single=True)] + ([self.fget(1,True)] if name=='atan2f' else [])
            self.fset(getattr(math,name[:-1])(*args),True)
        elif name in ('sincos','sincosf'):
            single=name.endswith('f');x=self.fget(single=single)
            for register,value in [(reg.UC_ARM64_REG_X0,math.sin(x)),(reg.UC_ARM64_REG_X1,math.cos(x))]:
                u.mem_write(u.reg_read(register),struct.pack('<f' if single else '<d',value))
        elif name=='memset':
            target=u.reg_read(reg.UC_ARM64_REG_X0);value=u.reg_read(reg.UC_ARM64_REG_W1)&255;n=u.reg_read(reg.UC_ARM64_REG_X2)
            u.mem_write(target,bytes([value])*n)
        elif name=='__cxa_finalize':u.reg_write(reg.UC_ARM64_REG_X0,0)
        else:raise RuntimeError(('unsupported import',name))
        u.reg_write(reg.UC_ARM64_REG_PC,u.reg_read(reg.UC_ARM64_REG_LR))
    def convert(self,kind,frequency,q,gain,fs,bits=24):
        u=self.uc
        flags={'peak':0,'low_shelf':1,'high_shelf':2}[kind]
        packed=struct.pack('<4H',flags,frequency,int(q*256)&65535,int(gain*256)&65535)
        u.mem_write(self.DATA,packed);u.mem_write(self.DATA+0x100,b'\x00'*64)
        u.reg_write(reg.UC_ARM64_REG_SP,self.STACK+0xf0000)
        u.reg_write(reg.UC_ARM64_REG_X0,fs);u.reg_write(reg.UC_ARM64_REG_X1,self.DATA)
        u.reg_write(reg.UC_ARM64_REG_X2,self.DATA+0x100);u.reg_write(reg.UC_ARM64_REG_X3,bits)
        u.reg_write(reg.UC_ARM64_REG_LR,self.RETURN)
        u.emu_start(self.entry,self.RETURN,timeout=5_000_000,count=1_000_000)
        if u.reg_read(reg.UC_ARM64_REG_PC)!=self.RETURN:raise RuntimeError('Emulation did not return')
        output=bytes(u.mem_read(self.DATA+0x100,24))
        return {'status':u.reg_read(reg.UC_ARM64_REG_W0),'coefficients':list(struct.unpack_from('<5i',output)), 'Gain':output[20], 'input_hex':packed.hex(),'output_hex':output.hex()}

