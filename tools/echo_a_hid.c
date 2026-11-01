#include <CoreFoundation/CoreFoundation.h>
#include <IOKit/hid/IOHIDManager.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>

/* ECHO-A only. WalkPlay report 0x4b. Read mode never sends OP=1.
 * Protocol: Chronosauros/contour research/protocol/PROTOCOL.md. */
static uint8_t reply[63];
static uint8_t state[11][63];
static int received, wanted, band;
static void input(void *ctx, IOReturn status, void *sender,
                  IOHIDReportType type, uint32_t rid, uint8_t *buf, CFIndex len) {
    (void)ctx; (void)sender; (void)type;
    if (status || rid != 0x4b) return;
    if (len == 64 && buf[0] == 0x4b) { buf++; len--; }
    if (len != 63 || buf[0] != 0x80 || buf[1] != wanted) return;
    if (wanted == 9 && band >= 0 && buf[4] != band) return;
    memcpy(reply, buf, 63); received=1;
}
static int send_frame(IOHIDDeviceRef d, const uint8_t *p) {
    uint8_t wire[64]={0x4b}; memcpy(wire+1,p,63);
    IOReturn r=IOHIDDeviceSetReport(d,kIOHIDReportTypeOutput,0x4b,wire,64);
    if(r) {fprintf(stderr,"SetReport failed: 0x%08x\n",r);return 1;}
    return 0;
}
static int query(IOHIDDeviceRef d, int cmd, int idx) {
    /* Drain old input before correlating this request. */
    CFRunLoopRunInMode(kCFRunLoopDefaultMode,0.02,false);
    received=0; wanted=cmd; band=idx;
    uint8_t p[63]={0x80,(uint8_t)cmd,0,0,idx<0?0:(uint8_t)idx};
    if(send_frame(d,p)) return 1;
    double end=CFAbsoluteTimeGetCurrent()+2;
    while(!received && CFAbsoluteTimeGetCurrent()<end)
        CFRunLoopRunInMode(kCFRunLoopDefaultMode,0.01,false);
    if(!received){fprintf(stderr,"Timeout cmd=%02x band=%d\n",cmd,idx);return 1;}
    printf("{\"command\":%d,\"band\":%d,\"hex\":\"",cmd,idx);
    for(int i=0;i<63;i++)printf("%02x",reply[i]);
    puts("\"}"); fflush(stdout); usleep(50000); return 0;
}
static int read_state(IOHIDDeviceRef d) {
    if(query(d,12,-1))return 1;memcpy(state[0],reply,63);
    if(query(d,9,-1))return 1;memcpy(state[1],reply,63);
    for(int i=0;i<8;i++){if(query(d,9,i))return 1;memcpy(state[i+2],reply,63);}
    if(query(d,3,-1))return 1;memcpy(state[10],reply,63);
    return 0;
}
static int valid_target(const uint8_t target[9][63],int slot) {
    for(int i=0;i<8;i++) {
        const uint8_t *p=target[i];
        unsigned f=p[27]|p[28]<<8,q=p[29]|p[30]<<8;
        int g=(int16_t)(p[31]|p[32]<<8);
        if(p[0]!=1 || p[1]!=9 || p[2]!=0x18 || p[3] || p[4]!=i || p[5] || p[6] ||
           f<20 || f>20000 || q<26 || q>2560 || g < -2560 || g>2560 ||
           (p[33]!=1 && p[33]!=2) || p[34] || p[35]!=slot) return 0;
        for(int j=36;j<63;j++)if(p[j])return 0;
    }
    const uint8_t *g=target[8];
    if(g[0]!=1 || g[1]!=3 || g[2]!=2 || g[3] || (int8_t)g[4]>0 || (int8_t)g[4]<-30)return 0;
    for(int j=5;j<63;j++)if(g[j])return 0;
    return 1;
}
static int apply(IOHIDDeviceRef d,const uint8_t before[11][63],const uint8_t target[9][63]) {
    if(read_state(d))return 1;
    if(memcmp(state,before,sizeof state) || memcmp(state[0]+3,"0.1",3) ||
       !valid_target(target,state[1][35])) {
        fprintf(stderr,"Preflight mismatch; no setting written\n");return 5;
    }
    /* Lower the level first. Do not resend any write on failure. */
    fprintf(stderr,"Writing preamp and 8 bands once, then flash commit\n");
    if(send_frame(d,target[8]))return 6;usleep(50000);
    for(int i=0;i<8;i++){if(send_frame(d,target[i]))return 6;usleep(20000);}
    usleep(100000);
    if(send_frame(d,target[8]))return 6;usleep(50000);
    const uint8_t commit[4][63]={{1,5,0},{1,0x17,0},{1,0x0a,4,0,0,255,255,0},{1,1,1,0}};
    const int delay[4]={20000,20000,50000,250000};
    for(int i=0;i<4;i++){if(send_frame(d,commit[i]))return 6;usleep(delay[i]);}
    if(read_state(d)){fprintf(stderr,"Written, readback incomplete; READ ONLY to recover\n");return 7;}
    for(int i=0;i<8;i++)if(memcmp(state[i+2]+4,target[i]+4,32)){
        fprintf(stderr,"Written, band %d mismatch; do not resend\n",i);return 7;
    }
    if(state[10][4]!=target[8][4]){fprintf(stderr,"Written, preamp mismatch\n");return 7;}
    fprintf(stderr,"Verified all 8 bands (coefficients and metadata), slot, and preamp\n");return 0;
}
int main(int argc,char **argv) {
    int writing=argc==3 && !strcmp(argv[1],"apply");
    uint8_t before[11][63],target[9][63];
    if(!writing && (argc!=2 || strcmp(argv[1],"read"))){
        fprintf(stderr,"Usage: echo_a_hid read | apply PLAN.bin\n");return 2;
    }
    if(writing) {
        FILE *f=fopen(argv[2],"rb");char magic[4];
        if(!f){perror("plan");return 2;}
        int ok=fread(magic,1,4,f)==4 && !memcmp(magic,"EQA1",4) &&
            fread(before,1,sizeof before,f)==sizeof before &&
            fread(target,1,sizeof target,f)==sizeof target && fgetc(f)==EOF;
        fclose(f);
        if(!ok || !valid_target(target,before[1][35])){fprintf(stderr,"Invalid plan\n");return 2;}
    }
    IOHIDManagerRef m=IOHIDManagerCreate(NULL,kIOHIDOptionsTypeNone);
    int vid=0x3302,pid=0x12c5;
    CFNumberRef v=CFNumberCreate(NULL,kCFNumberIntType,&vid),p=CFNumberCreate(NULL,kCFNumberIntType,&pid);
    const void *ks[]={CFSTR(kIOHIDVendorIDKey),CFSTR(kIOHIDProductIDKey)};
    const void *vs[]={v,p};
    CFDictionaryRef match=CFDictionaryCreate(NULL,ks,vs,2,&kCFTypeDictionaryKeyCallBacks,&kCFTypeDictionaryValueCallBacks);
    IOHIDManagerSetDeviceMatching(m,match);
    CFSetRef set=IOHIDManagerCopyDevices(m);
    if(!set || CFSetGetCount(set)!=1){fprintf(stderr,"Expected exactly one ECHO-A HID device; found %ld\n",set?CFSetGetCount(set):0L);return 3;}
    IOHIDDeviceRef d;CFSetGetValues(set,(const void **)&d);
    CFStringRef name=IOHIDDeviceGetProperty(d,CFSTR(kIOHIDProductKey));
    if(!name || CFGetTypeID(name)!=CFStringGetTypeID() || !CFEqual(name,CFSTR("ECHO-A"))){fprintf(stderr,"Unexpected product name\n");return 3;}
    CFDataRef desc=IOHIDDeviceGetProperty(d,CFSTR(kIOHIDReportDescriptorKey));
    if(!desc || CFGetTypeID(desc)!=CFDataGetTypeID()){fprintf(stderr,"Missing descriptor\n");return 3;}
    fprintf(stderr,"ECHO-A descriptor: ");
    const uint8_t *b=CFDataGetBytePtr(desc);int has=0;
    for(CFIndex i=0;i<CFDataGetLength(desc);i++){fprintf(stderr,"%02x",b[i]);if(i && b[i-1]==0x85 && b[i]==0x4b)has=1;}
    fprintf(stderr,"\n");if(!has)return 3;
    IOReturn r=IOHIDDeviceOpen(d,kIOHIDOptionsTypeNone);
    if(r){fprintf(stderr,"Open failed: 0x%08x\n",r);return 4;}
    uint8_t buffer[128];
    IOHIDDeviceRegisterInputReportCallback(d,buffer,sizeof buffer,input,NULL);
    IOHIDDeviceScheduleWithRunLoop(d,CFRunLoopGetCurrent(),kCFRunLoopDefaultMode);
    int err=writing?apply(d,before,target):read_state(d);
    IOHIDDeviceUnscheduleFromRunLoop(d,CFRunLoopGetCurrent(),kCFRunLoopDefaultMode);
    IOHIDDeviceClose(d,kIOHIDOptionsTypeNone);
    CFRelease(set);CFRelease(match);CFRelease(v);CFRelease(p);CFRelease(m);
    return err;
}
