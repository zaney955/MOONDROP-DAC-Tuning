#include <CoreFoundation/CoreFoundation.h>
#include <IOKit/hid/IOHIDManager.h>
#include <mach/message.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>

/* Read requests only; protocol from FreeDSP-Studio dsp.rs at
 * 1b42f63db24f7dc8e94f6897575c1c403f4d4882. No EQ write or flash command. */
static int query(IOHIDDeviceRef d, uint8_t cmd, int arg) {
    uint8_t out[62] = {1,0,13,0,cmd,1,0,0x23,0x2d,0xb3};
    int at=cmd==0xbe ? 14 : 10;
    out[at]=arg&255; out[at+1]=(arg>>8)&255;
    IOReturn s=IOHIDDeviceSetReport(d,kIOHIDReportTypeOutput,1,out,sizeof out);
    if(s) { fprintf(stderr,"SetReport: 0x%08x\n",s); return s==MACH_SEND_INVALID_DEST?5:1; }
    usleep(20000);
    uint8_t in[62]; CFIndex len=sizeof in;
    IOReturn r=kIOReturnNotReady;
    int reads=0;
    /* Retry GET_REPORT only. Do not resend the request or mask other errors.
     * 20 attempts, 50 ms apart; exit 4 lets the caller distinguish exhaustion. */
    for(int attempt=0;attempt<20;attempt++) {
        memset(in,0,sizeof in);in[0]=1;len=sizeof in;
        reads++;
        r=IOHIDDeviceGetReport(d,kIOHIDReportTypeInput,1,in,&len);
        if(r!=kIOReturnNotReady) break;
        if(attempt<19) usleep(50000);
    }
    if(r) {
        fprintf(stderr,"GetReport cmd=0x%02x arg=%d: 0x%08x%s\n",cmd,arg,r,
                r==kIOReturnNotReady?" (NotReady retry limit reached)":"");
        /* A dead Mach destination cannot recover on this handle. Exit 5 tells
         * the caller to create a new manager/device and repeat only reads. */
        return r==kIOReturnNotReady?4:r==MACH_SEND_INVALID_DEST?5:1;
    }
    if(reads>1)fprintf(stderr,"GetReport cmd=0x%02x arg=%d recovered after %d reads\n",cmd,arg,reads);
    int16_t words=(int16_t)((unsigned)in[2]|((unsigned)in[3]<<8));
    if(len!=62 || words<0 || words>13 || in[0]!=1 || in[4]!=cmd || in[5]!=0x81 ||
       memcmp(in+7,out+7,3)!=0 ||
       ((cmd==0xdd || cmd==0xbe) && (in[14]!=arg || in[15] || in[16] || in[17]))) {
        fprintf(stderr,"Unexpected reply; stopping without further requests\n"); return 1;
    }
    printf("{\"command\":%u,\"argument\":%d,\"length\":%ld,\"hex\":\"",cmd,arg,len);
    for(CFIndex i=0;i<len;i++) printf("%02x",in[i]);
    printf("\"}\n"); fflush(stdout);
    return 0;
}
int main(int argc, char **argv) {
    int coeff=argc==2 && strcmp(argv[1],"--coefficients")==0;
    if(argc>1 && !coeff) {fprintf(stderr,"Usage: echo_probe [--coefficients]\n");return 2;}
    IOHIDManagerRef m=IOHIDManagerCreate(kCFAllocatorDefault,kIOHIDOptionsTypeNone);
    int v=0x35d8,p=0x149b;
    CFNumberRef vn=CFNumberCreate(NULL,kCFNumberIntType,&v), pn=CFNumberCreate(NULL,kCFNumberIntType,&p);
    const void *keys[]={CFSTR(kIOHIDVendorIDKey),CFSTR(kIOHIDProductIDKey)};
    const void *vals[]={vn,pn};
    CFDictionaryRef match=CFDictionaryCreate(NULL,keys,vals,2,&kCFTypeDictionaryKeyCallBacks,&kCFTypeDictionaryValueCallBacks);
    IOHIDManagerSetDeviceMatching(m,match);
    CFSetRef set=IOHIDManagerCopyDevices(m);
    if(!set || CFSetGetCount(set)!=1){
        CFIndex count=set?CFSetGetCount(set):0;
        fprintf(stderr,"Expected one ECHO-B; found %ld\n",count);
        return count==0?6:2; /* 6: absent during re-enumeration; 2: ambiguous. */
    }
    IOHIDDeviceRef d; CFSetGetValues(set,(const void**)&d);
    IOReturn r=IOHIDDeviceOpen(d,kIOHIDOptionsTypeNone);
    if(r){fprintf(stderr,"Open: 0x%08x\n",r);return r==MACH_SEND_INVALID_DEST?5:3;}
    int err=query(d,0x5a,0x5a);
    for(int n=1;n<=9&&!err;n++) err=query(d,coeff?0xbe:0xdd,n);
    IOHIDDeviceClose(d,kIOHIDOptionsTypeNone);
    CFRelease(set);CFRelease(match);CFRelease(vn);CFRelease(pn);CFRelease(m);
    return err;
}
