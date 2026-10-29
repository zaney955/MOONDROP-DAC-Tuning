/* Applies only a prevalidated ECHO-B custom-EQ save sequence. No firmware ops. */
#include <CoreFoundation/CoreFoundation.h>
#include <IOKit/hid/IOHIDManager.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>

static uint32_t word(const uint8_t*b,int n){uint32_t v;memcpy(&v,b+10+4*n,4);return v;}
/* Poll only the acknowledgement; never resend a possibly effective write. */
static int read_ack(IOHIDDeviceRef d,const uint8_t*request,uint8_t*b){
    for(int attempt=0;attempt<100;attempt++){
        usleep(10000);memset(b,0,62);b[0]=1;CFIndex len=62;
        IOReturn r=IOHIDDeviceGetReport(d,kIOHIDReportTypeInput,1,b,&len);
        if(r==kIOReturnNotReady)continue;
        if(r){fprintf(stderr,"GetReport ACK 0x%08x; STOP\n",r);return 0;}
        if(len==62&&b[0]==1&&b[4]==request[4]&&b[5]==0x80&&!memcmp(b+6,request+6,4)){
            int16_t count;memcpy(&count,b+2,2);
            if(attempt>0&&count>=0&&count<=13)fprintf(stderr,"ACK recovered after %d reads; write was not resent\n",attempt+1);
            return count>=0&&count<=13;
        }
    }
    fprintf(stderr,"ACK read retry limit reached; write will NOT be resent\n");
    return 0;
}
int main(int argc,char**argv){
    if(argc!=2){fprintf(stderr,"Usage: echo_apply_plan PLAN.bin\n");return 2;}
    uint8_t frames[56][62];FILE*f=fopen(argv[1],"rb");
    if(!f||fread(frames,1,sizeof frames,f)!=sizeof frames||fgetc(f)!=EOF){fprintf(stderr,"Invalid plan size\n");return 2;}fclose(f);
    const uint8_t head[10]={1,0,13,0,0xdc,0,0,0x23,0x2d,0xb3};
    for(int i=0;i<56;i++){
        uint8_t*b=frames[i];int ok=0;
        if(i==0){uint8_t h[10];memcpy(h,head,10);h[4]=0x5a;ok=!memcmp(b,h,10)&&word(b,0)==0x5a&&word(b,1)==0;}
        else if(i<=9)ok=!memcmp(b,head,10)&&word(b,0)==0&&word(b,1)==(unsigned)i;
        else if(i<55)ok=!memcmp(b,head,10)&&word(b,0)==(unsigned)(4+(i-10)%5)&&word(b,1)==(unsigned)(1+(i-10)/5)&&word(b,2)==3;
        else ok=!memcmp(b,head,10)&&word(b,0)==255;
        if(!ok){fprintf(stderr,"Rejected unexpected operation %d\n",i);return 2;}
    }
    IOHIDManagerRef m=IOHIDManagerCreate(NULL,0);int vid=0x35d8,pid=0x149b;
    CFNumberRef v=CFNumberCreate(NULL,kCFNumberIntType,&vid),p=CFNumberCreate(NULL,kCFNumberIntType,&pid);
    const void*ks[]={CFSTR(kIOHIDVendorIDKey),CFSTR(kIOHIDProductIDKey)},*vs[]={v,p};
    CFDictionaryRef match=CFDictionaryCreate(NULL,ks,vs,2,&kCFTypeDictionaryKeyCallBacks,&kCFTypeDictionaryValueCallBacks);
    IOHIDManagerSetDeviceMatching(m,match);CFSetRef ds=IOHIDManagerCopyDevices(m);
    if(!ds||CFSetGetCount(ds)!=1){fprintf(stderr,"Expected one ECHO-B\n");return 3;}
    IOHIDDeviceRef d;CFSetGetValues(ds,(const void**)&d);IOReturn r=IOHIDDeviceOpen(d,0);
    if(r){fprintf(stderr,"Open 0x%08x\n",r);return 3;}
    int result=0;
    for(int i=0;i<56;i++){
        r=IOHIDDeviceSetReport(d,kIOHIDReportTypeOutput,1,frames[i],62);
        if(r){fprintf(stderr,"SetReport %d 0x%08x; STOP\n",i,r);result=4;break;}
        uint8_t b[62];int ok=read_ack(d,frames[i],b);
        printf("{\"operation\":%d,\"ack\":%s,\"reply\":\"",i,ok?"true":"false");
        for(int j=0;j<62;j++)printf("%02x",b[j]);puts("\"}");fflush(stdout);
        if(!ok){fprintf(stderr,"No valid acknowledgement; STOP before any next operation\n");result=5;break;}
        usleep(i==55?500000:20000);
    }
    IOHIDDeviceClose(d,0);CFRelease(ds);CFRelease(match);CFRelease(v);CFRelease(p);CFRelease(m);return result;
}
