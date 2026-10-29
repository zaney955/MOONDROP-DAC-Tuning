/* Narrow, reversible test of official app command CTRL/0x00be.
 * Never sends mode selection, flash save, firmware or reset commands.
 * Only works when band 9 is the already-backed-up identity filter.
 * Saves the exact original reply to a new file and fsyncs BEFORE writing.
 */
#include <CoreFoundation/CoreFoundation.h>
#include <IOKit/hid/IOHIDManager.h>
#include <fcntl.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>

static void frame(uint8_t *b,int read) {
    memset(b,0,62);
    const uint8_t h[]={1,0,13,0,0xbe,0,0,0x23,0x2d,0xb3};
    memcpy(b,h,sizeof h); b[5]=read?1:0; b[14]=9;
}
static void dump(const char *phase,const uint8_t *b) {
    printf("{\"phase\":\"%s\",\"hex\":\"",phase);
    for(int i=0;i<62;i++)printf("%02x",b[i]);
    puts("\"}"); fflush(stdout);
}
static int exchange(IOHIDDeviceRef d,const uint8_t *out,uint8_t *in,const char *phase) {
    IOReturn r=IOHIDDeviceSetReport(d,kIOHIDReportTypeOutput,1,out,62);
    if(r){fprintf(stderr,"%s SetReport 0x%08x\n",phase,r);return 1;}
    usleep(20000); memset(in,0,62);in[0]=1;CFIndex len=62;
    r=IOHIDDeviceGetReport(d,kIOHIDReportTypeInput,1,in,&len);
    if(r){fprintf(stderr,"%s GetReport 0x%08x\n",phase,r);return 1;}
    dump(phase,in);
    int16_t words=(int16_t)((unsigned)in[2]|((unsigned)in[3]<<8));
    return len!=62 || in[0]!=1 || in[4]!=0xbe || in[5]!=(out[5]|0x80) ||
        memcmp(in+6,out+6,4)!=0 || words<0 || words>13;
}
int main(int argc,char **argv) {
    if(argc!=2){fprintf(stderr,"Usage: echo_runtime_test NEW_ORIGINAL_REPLY_FILE\n");return 2;}
    IOHIDManagerRef m=IOHIDManagerCreate(NULL,0);int vid=0x35d8,pid=0x149b;
    CFNumberRef v=CFNumberCreate(NULL,kCFNumberIntType,&vid),p=CFNumberCreate(NULL,kCFNumberIntType,&pid);
    const void *ks[]={CFSTR(kIOHIDVendorIDKey),CFSTR(kIOHIDProductIDKey)},*vs[]={v,p};
    CFDictionaryRef match=CFDictionaryCreate(NULL,ks,vs,2,&kCFTypeDictionaryKeyCallBacks,&kCFTypeDictionaryValueCallBacks);
    IOHIDManagerSetDeviceMatching(m,match);CFSetRef ds=IOHIDManagerCopyDevices(m);
    if(!ds || CFSetGetCount(ds)!=1){fprintf(stderr,"Expected exactly one ECHO-B\n");return 3;}
    IOHIDDeviceRef d;CFSetGetValues(ds,(const void**)&d);
    IOReturn opened=IOHIDDeviceOpen(d,0);
    if(opened){fprintf(stderr,"Open 0x%08x\n",opened);return 4;}
    uint8_t request[62],original[62],changed[62],restored[62],ack[62],writeframe[62];
    frame(request,1);
    int error=exchange(d,request,original,"before");
    const uint8_t identity[32]={0,0,0,0,9,0,0,0,3,0,0,0,0,0,0x40,0};
    if(error || original[2]!=8 || memcmp(original+10,identity,32)) {
        fprintf(stderr,"Unexpected initial filter; NO WRITE performed\n");return 5;
    }
    int fd=open(argv[1],O_WRONLY|O_CREAT|O_EXCL,0600);
    if(fd<0 || write(fd,original,62)!=62 || fsync(fd)) {
        perror("Cannot persist original; NO WRITE performed");return 6;
    }
    close(fd);
    frame(writeframe,0);memcpy(writeframe+10,original+10,32);
    uint32_t b0=3738177; memcpy(writeframe+22,&b0,4);
    error=exchange(d,writeframe,ack,"temporary_write_ack");
    int read_error=exchange(d,request,changed,"temporary_readback");
    int changed_ok=!read_error && changed[2]==8 && !memcmp(changed+10,writeframe+10,32);
    /* Restore even after an uncertain write acknowledgement. */
    frame(writeframe,0);memcpy(writeframe+10,original+10,32);
    int restore_error=exchange(d,writeframe,ack,"restore_ack");
    int final_error=exchange(d,request,restored,"restored_readback");
    int restored_ok=!final_error && !memcmp(original,restored,62);
    printf("{\"temporary_change_verified\":%s,\"original_reply_exactly_restored\":%s,\"flash_save_sent\":false}\n",changed_ok?"true":"false",restored_ok?"true":"false");
    IOHIDDeviceClose(d,0);CFRelease(ds);CFRelease(match);CFRelease(v);CFRelease(p);CFRelease(m);
    return error || !changed_ok || restore_error || !restored_ok;
}
