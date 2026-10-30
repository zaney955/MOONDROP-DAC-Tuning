/* Fault-inject the actual volatile probe; no real USB. */
#include <CoreFoundation/CoreFoundation.h>
#include <IOKit/hid/IOHIDManager.h>
#include <assert.h>
#include <signal.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
static uint8_t state[2][62],initial[2][62],sent[62];
static int scenario,writes,test_writes,read_number,restore_failed;
static void request_restore(int sig);
static IOReturn gain_fake_set(IOHIDDeviceRef d,IOHIDReportType type,CFIndex id,const uint8_t *b,CFIndex n) {
    (void)d;(void)type;assert(id==1&&n==62&&b[4]==0xbe&&(b[14]==8||b[14]==9));
    memcpy(sent,b,62);
    if(!b[5]) {
        writes++;
        if(b[14]==9) {
            if(scenario==6&&test_writes==9) {restore_failed=1;return kIOReturnNotPermitted;}
            test_writes++;
        }
        memcpy(state[b[14]-8]+10,b+10,32);
    }
    return kIOReturnSuccess;
}
static IOReturn gain_fake_get(IOHIDDeviceRef d,IOHIDReportType type,CFIndex id,uint8_t *b,CFIndex *n) {
    (void)d;(void)type;(void)id;assert(*n==62);
    if(sent[5]) {
        read_number++;
        if(scenario==1)return kIOReturnNotPermitted;
        memcpy(b,state[sent[14]-8],62);
        if((scenario==4&&test_writes==1&&sent[14]==9)||(scenario==7&&read_number==3))b[22]^=1;
    } else {
        if(scenario==3&&test_writes==1)return kIOReturnNotPermitted;
        memcpy(b,sent,62);b[2]=0;b[3]=0;b[5]=0x80;
        if(scenario==5&&test_writes==1&&sent[14]==9)request_restore(SIGINT);
    }
    return kIOReturnSuccess;
}
static int gain_fake_sleep(useconds_t delay){(void)delay;return 0;}
#define main unused_gain_main
#define IOHIDDeviceSetReport gain_fake_set
#define IOHIDDeviceGetReport gain_fake_get
#define usleep gain_fake_sleep
#include "echo_gain_probe.c"
#undef main
#undef IOHIDDeviceSetReport
#undef IOHIDDeviceGetReport
#undef usleep

static void initialize(void) {
    writes=test_writes=read_number=restore_failed=0;interrupted=0;
    for(int i=0;i<2;i++) {
        gain_frame(state[i],1,i+8);state[i][2]=8;state[i][5]=0x81;state[i][18]=3;
        uint32_t b0=i?664752:4194304;memcpy(state[i]+22,&b0,4);
    }
    memcpy(initial,state,sizeof initial);
}
int main(void) {
    assert(freopen("/dev/null","w",stdout));
    char directory[]="/tmp/echo-gain-test-XXXXXX";assert(mkdtemp(directory));
    char file[1024];snprintf(file,sizeof file,"%s/original.bin",directory);
    for(scenario=0;scenario<=7;scenario++) {
        initialize();
        if(scenario==2){FILE*f=fopen(file,"wb");assert(f);fclose(f);}
        int result=gain_probe(NULL,file);
        if(scenario==0){assert(result==0);assert(test_writes==10);}
        else assert(result!=0);
        if(scenario==1||scenario==2)assert(writes==0);
        if(scenario==5)assert(test_writes==2); /* One case, then band 9 restore. */
        if(scenario==6) {
            assert(restore_failed);assert(gain_word(state[0],22)==0);
            int old=scenario;scenario=0;
            assert(restore_file(NULL,file)==0);scenario=old;
        }
        assert(!memcmp(state,initial,sizeof initial));
        unlink(file);
    }
    rmdir(directory);
    fprintf(stderr,"Gain probe fault tests passed (8 scenarios, no device access).\n");
    return 0;
}
