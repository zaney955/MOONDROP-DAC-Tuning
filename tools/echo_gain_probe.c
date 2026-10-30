/* ECHO-B volatile gain-register probe. No flash, mode, reset or firmware writes.
 * Silence identity band 8 before touching band 9; restore 9 before unmuting 8.
 * An exclusive, fsynced backup is mandatory. SIGINT/SIGTERM request restoration.
 * This checks register acceptance, not analog output amplitude or persistence.
 */
#include <CoreFoundation/CoreFoundation.h>
#include <IOKit/hid/IOHIDManager.h>
#include <errno.h>
#include <fcntl.h>
#include <signal.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>

static volatile sig_atomic_t interrupted;
static void request_restore(int sig) {(void)sig;interrupted=1;}
static uint32_t gain_word(const uint8_t *b,int offset) {
    uint32_t value;memcpy(&value,b+offset,4);return value;
}
static void gain_frame(uint8_t *b,int read,int band) {
    const uint8_t header[]={1,0,13,0,0xbe,0,0,0x23,0x2d,0xb3};
    memset(b,0,62);memcpy(b,header,10);b[5]=read?1:0;b[14]=(uint8_t)band;
}
static int valid_snapshot(const uint8_t *b,int band) {
    const uint8_t header[]={1,0,8,0,0xbe,0x81,0,0x23,0x2d,0xb3};
    return !memcmp(b,header,10)&&gain_word(b,10)==0&&gain_word(b,14)==(uint32_t)band&&gain_word(b,18)==3;
}
static int gain_exchange(IOHIDDeviceRef d,const uint8_t *out,uint8_t *in,const char *phase) {
    IOReturn r=IOHIDDeviceSetReport(d,kIOHIDReportTypeOutput,1,out,62);
    if(r){fprintf(stderr,"%s SetReport 0x%08x\n",phase,r);return 1;}
    for(int attempt=0;attempt<100;attempt++) {
        usleep(10000);memset(in,0,62);in[0]=1;CFIndex length=62;
        r=IOHIDDeviceGetReport(d,kIOHIDReportTypeInput,1,in,&length);
        if(r==kIOReturnNotReady)continue;
        if(r){fprintf(stderr,"%s GetReport 0x%08x\n",phase,r);return 1;}
        int16_t count;memcpy(&count,in+2,2);
        if(length!=62||in[0]!=1||in[4]!=0xbe||in[5]!=(out[5]|0x80)||
           memcmp(in+6,out+6,4)||count<0||count>13) {
            fprintf(stderr,"%s invalid reply\n",phase);return 1;
        }
        printf("{\"phase\":\"%s\",\"hex\":\"",phase);
        for(int i=0;i<62;i++)printf("%02x",in[i]);
        puts("\"}");fflush(stdout);
        return out[5]&&!valid_snapshot(in,out[14]);
    }
    fprintf(stderr,"%s read exhausted; request not resent\n",phase);return 1;
}
static int gain_read(IOHIDDeviceRef d,int band,uint8_t *reply,const char *phase) {
    uint8_t out[62];gain_frame(out,1,band);return gain_exchange(d,out,reply,phase);
}
static int gain_write(IOHIDDeviceRef d,const uint8_t *snapshot,const char *phase) {
    uint8_t out[62],reply[62];gain_frame(out,0,snapshot[14]);
    memcpy(out+10,snapshot+10,32);return gain_exchange(d,out,reply,phase);
}
static int gain_restore(IOHIDDeviceRef d,uint8_t saved[2][62]) {
    uint8_t actual[62];
    int ack9=gain_write(d,saved[1],"restore_band9_ack");
    int read9=gain_read(d,9,actual,"restore_band9_read");
    if(read9||memcmp(actual,saved[1],62)) {
        fprintf(stderr,"Band 9 restoration unverified; band 8 remains silent. Run restore with the backup.\n");
        return 1;
    }
    int ack8=gain_write(d,saved[0],"restore_band8_ack");
    int read8=gain_read(d,8,actual,"restore_band8_read");
    int exact=!read8&&!memcmp(actual,saved[0],62);
    printf("{\"original_band9_exactly_restored\":true,\"original_band8_exactly_restored\":%s,\"restore_acks_ok\":%s,\"flash_save_sent\":false}\n",
           exact?"true":"false",(!ack9&&!ack8)?"true":"false");fflush(stdout);
    return !exact||ack9||ack8;
}
static int gain_probe(IOHIDDeviceRef d,const char *backup) {
    uint8_t saved[2][62],muted[62],actual[62],test[62];
    if(gain_read(d,8,saved[0],"before_band8")||gain_read(d,9,saved[1],"before_band9"))return 1;
    const uint32_t identity[5]={4194304,0,0,0,0};
    const uint32_t zero_tail[4]={0,0,0,0};
    if(memcmp(saved[0]+22,identity,20)||gain_word(saved[1],22)>4194304||
       !gain_word(saved[1],22)||memcmp(saved[1]+26,zero_tail,16)) {
        fprintf(stderr,"Requires identity band 8 and pure nonpositive gain on band 9; no write.\n");return 1;
    }
    int fd=open(backup,O_WRONLY|O_CREAT|O_EXCL,0600);
    if(fd<0){perror("backup (no write)");return 1;}
    ssize_t written=write(fd,saved,sizeof saved);int flushed=fsync(fd);int closed=close(fd);
    if(written!=(ssize_t)sizeof saved||flushed||closed) {
        fprintf(stderr,"Backup incomplete; no device write.\n");return 1;
    }
    if(interrupted)return 1;
    memcpy(muted,saved[0],62);memset(muted+22,0,20);
    int error=gain_write(d,muted,"silence_band8_ack");
    int read_error=gain_read(d,8,actual,"silence_band8_read");
    if(read_error||memcmp(muted,actual,62))error=1;
    const uint32_t cases[]={0,1,4194,664752,4194304,4706081,5924678,8368737,8388607};
    for(unsigned i=0;!error&&!interrupted&&i<sizeof cases/sizeof cases[0];i++) {
        memcpy(test,saved[1],62);memset(test+22,0,20);memcpy(test+22,&cases[i],4);
        error=gain_write(d,test,"gain_test_ack");
        read_error=gain_read(d,9,actual,"gain_test_read");
        int exact=!read_error&&!memcmp(test,actual,62);
        printf("{\"b0_q22\":%u,\"ack_ok\":%s,\"exact_readback\":%s}\n",cases[i],error?"false":"true",exact?"true":"false");fflush(stdout);
        if(!exact)error=1;
    }
    int restored=gain_restore(d,saved);
    return error||restored||interrupted;
}
static int restore_file(IOHIDDeviceRef d,const char *path) {
    uint8_t saved[2][62],muted[62],actual[62];
    FILE *f=fopen(path,"rb");if(!f)return 1;
    size_t n=fread(saved,1,sizeof saved,f);int extra=fgetc(f);fclose(f);
    if(n!=sizeof saved||extra!=EOF||!valid_snapshot(saved[0],8)||!valid_snapshot(saved[1],9))return 1;
    /* Recovery also silences band 8 first; never unmute with unknown band 9. */
    memcpy(muted,saved[0],62);memset(muted+22,0,20);
    int ack=gain_write(d,muted,"recovery_silence_ack");
    if(gain_read(d,8,actual,"recovery_silence_read")||memcmp(muted,actual,62))return 1;
    int result=gain_restore(d,saved);return ack||result;
}
int main(int argc,char **argv) {
    if(argc!=3||(strcmp(argv[1],"probe")&&strcmp(argv[1],"restore"))) {
        fprintf(stderr,"Usage: echo_gain_probe probe|restore BACKUP_FILE\n");return 2;
    }
    signal(SIGINT,request_restore);signal(SIGTERM,request_restore);
    IOHIDManagerRef m=IOHIDManagerCreate(NULL,0);int vid=0x35d8,pid=0x149b;
    CFNumberRef v=CFNumberCreate(NULL,kCFNumberIntType,&vid),p=CFNumberCreate(NULL,kCFNumberIntType,&pid);
    const void *keys[]={CFSTR(kIOHIDVendorIDKey),CFSTR(kIOHIDProductIDKey)},*values[]={v,p};
    CFDictionaryRef match=CFDictionaryCreate(NULL,keys,values,2,&kCFTypeDictionaryKeyCallBacks,&kCFTypeDictionaryValueCallBacks);
    IOHIDManagerSetDeviceMatching(m,match);CFSetRef devices=IOHIDManagerCopyDevices(m);
    if(!devices||CFSetGetCount(devices)!=1){fprintf(stderr,"Expected exactly one ECHO-B\n");return 3;}
    IOHIDDeviceRef d;CFSetGetValues(devices,(const void**)&d);
    IOReturn opened=IOHIDDeviceOpen(d,0);
    if(opened){fprintf(stderr,"Open 0x%08x\n",opened);return 4;}
    int result=!strcmp(argv[1],"probe")?gain_probe(d,argv[2]):restore_file(d,argv[2]);
    IOHIDDeviceClose(d,0);CFRelease(devices);CFRelease(match);CFRelease(v);CFRelease(p);CFRelease(m);
    return result;
}
