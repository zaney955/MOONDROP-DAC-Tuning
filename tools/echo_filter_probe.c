/* Volatile filter-coefficient acceptance probe. Band 8 silences output while
 * band 9 receives prevalidated Q22 vectors. No metadata/flash/mode writes.
 * Reuse the established exact-backup and restoration transport.
 */
#define main unused_output_gain_main
#include "echo_gain_probe.c"
#undef main

static int filter_vector_valid(const int32_t *cf) {
    for(int i=0;i<5;i++)if(cf[i]<-8388608||cf[i]>8388607)return 0;
    /* Strict Jury conditions for denominator 1-p*z^-1-q*z^-2. */
    int64_t p=cf[3],q=cf[4],scale=4194304;
    return q>-scale&&q<scale&&scale-p-q>0&&scale+p-q>0;
}
static int load_filter_vectors(const char *path,int32_t cases[256][5],uint32_t *count) {
    FILE*f=fopen(path,"rb");if(!f)return 1;
    uint32_t n=0;int error=fread(&n,4,1,f)!=1||n<1||n>256;
    if(!error)error=fread(cases,20,n,f)!=n||fgetc(f)!=EOF;
    fclose(f);
    for(uint32_t i=0;!error&&i<n;i++)if(!filter_vector_valid(cases[i]))error=1;
    if(error){fprintf(stderr,"Invalid/out-of-range/unstable vector file; no device write.\n");return 1;}
    *count=n;return 0;
}
static int filter_probe(IOHIDDeviceRef d,const char *backup,const int32_t cases[][5],uint32_t count) {
    if(count<1||count>256)return 1;
    for(uint32_t i=0;i<count;i++)if(!filter_vector_valid(cases[i]))return 1;
    uint8_t saved[2][62],muted[62],test[62],actual[62];
    if(gain_read(d,8,saved[0],"before_band8")||gain_read(d,9,saved[1],"before_band9"))return 1;
    const uint32_t identity[5]={4194304,0,0,0,0},zero_tail[4]={0,0,0,0};
    if(memcmp(saved[0]+22,identity,20)||!gain_word(saved[1],22)||
       gain_word(saved[1],22)>4194304||memcmp(saved[1]+26,zero_tail,16)) {
        fprintf(stderr,"Requires identity band 8 and pure nonpositive gain band 9; no write.\n");return 1;
    }
    int fd=open(backup,O_WRONLY|O_CREAT|O_EXCL,0600);
    if(fd<0){perror("backup (no write)");return 1;}
    ssize_t written=write(fd,saved,sizeof saved);int flushed=fsync(fd);int closed=close(fd);
    if(written!=(ssize_t)sizeof saved||flushed||closed){fprintf(stderr,"Backup incomplete; no write.\n");return 1;}
    if(interrupted)return 1;
    memcpy(muted,saved[0],62);memset(muted+22,0,20);
    int error=gain_write(d,muted,"silence_band8_ack");
    int read_error=gain_read(d,8,actual,"silence_band8_read");
    if(read_error||memcmp(muted,actual,62))error=1;
    for(uint32_t i=0;!error&&!interrupted&&i<count;i++) {
        memcpy(test,saved[1],62);
        for(int j=0;j<5;j++) {
            uint32_t word=(uint32_t)cases[i][j]&0xffffff;
            memcpy(test+22+4*j,&word,4);
        }
        error=gain_write(d,test,"filter_test_ack");
        read_error=gain_read(d,9,actual,"filter_test_read");
        int exact=!read_error&&!memcmp(actual,test,62);
        printf("{\"case_index\":%u,\"ack_ok\":%s,\"exact_readback\":%s}\n",i,error?"false":"true",exact?"true":"false");fflush(stdout);
        if(!exact)error=1;
    }
    int restored=gain_restore(d,saved);
    return error||restored||interrupted;
}
int filter_probe_cli(int argc,char **argv) {
    if(argc!=3){fprintf(stderr,"Usage: echo_filter_probe NEW_BACKUP_FILE CASES.bin\n");return 2;}
    int32_t cases[256][5];uint32_t count;
    if(load_filter_vectors(argv[2],cases,&count))return 2;
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
    int result=filter_probe(d,argv[1],cases,count);
    IOHIDDeviceClose(d,0);CFRelease(devices);CFRelease(match);CFRelease(v);CFRelease(p);CFRelease(m);
    return result;
}
#ifndef ECHO_FILTER_PROBE_TEST
int main(int argc,char **argv){return filter_probe_cli(argc,argv);}
#endif
