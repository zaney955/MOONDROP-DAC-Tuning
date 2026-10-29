/* Exercise the actual probe query with fake USB I/O. Never opens a device. */
#include <CoreFoundation/CoreFoundation.h>
#include <IOKit/hid/IOHIDManager.h>
#include <assert.h>
#include <stdint.h>
#include <string.h>
#include <unistd.h>

static int get_calls, sets, sleeps, scenario;
static uint8_t response_marker=0x81;
static uint8_t request[62];
static IOReturn fake_set(IOHIDDeviceRef d, IOHIDReportType type, CFIndex id,
                        const uint8_t *b, CFIndex n) {
    (void)d;(void)type;(void)id;assert(n==62);sets++;
    memcpy(request,b,62);return kIOReturnSuccess;
}
static IOReturn fake_get(IOHIDDeviceRef d, IOHIDReportType type, CFIndex id,
                        uint8_t *b, CFIndex *n) {
    (void)d;(void)type;(void)id;get_calls++;assert(*n==62);
    if(scenario==1 && get_calls<=3) {*n=0;return kIOReturnNotReady;}
    if(scenario==2) return kIOReturnNotReady;
    if(scenario==3) return kIOReturnNotPermitted;
    memcpy(b,request,62);b[5]=response_marker;
    if(scenario==4) b[5]^=1; /* Corrupt/stale reply must not be accepted. */
    if(scenario==5) b[2]=b[3]=0xff; /* Negative device reply. */
    return kIOReturnSuccess;
}
static int fake_sleep(useconds_t amount) {(void)amount;sleeps++;return 0;}

#define main unused_probe_main
#define IOHIDDeviceSetReport fake_set
#define IOHIDDeviceGetReport fake_get
#define usleep fake_sleep
#include "echo_probe.c"
#undef main
#undef IOHIDDeviceSetReport
#undef IOHIDDeviceGetReport
#undef usleep

#define main unused_writer_main
#define IOHIDDeviceSetReport fake_set
#define IOHIDDeviceGetReport fake_get
#define usleep fake_sleep
#include "echo_apply_plan.c"
#undef main
#undef IOHIDDeviceSetReport
#undef IOHIDDeviceGetReport
#undef usleep

int main(void) {
    for(scenario=0;scenario<=4;scenario++) {
        get_calls=sets=sleeps=0;
        int result=query(NULL,0x5a,0x5a);
        assert(sets==1); /* Retries must never resend the request. */
        if(scenario==0) {assert(result==0);assert(get_calls==1);}
        if(scenario==1) {assert(result==0);assert(get_calls==4);}
        if(scenario==2) {assert(result==4);assert(get_calls==20);assert(sleeps==20);}
        if(scenario==3 || scenario==4) {assert(result==1);assert(get_calls==1);}
    }
    response_marker=0x80;
    request[4]=0xdc;request[5]=0;
    for(scenario=0;scenario<=5;scenario++) {
        uint8_t reply[62];get_calls=sets=sleeps=0;
        int ok=read_ack(NULL,request,reply);
        assert(sets==0); /* Waiting for ACK cannot resend any write. */
        if(scenario==0) {assert(ok);assert(get_calls==1);}
        if(scenario==1) {assert(ok);assert(get_calls==4);}
        if(scenario==2 || scenario==4) {assert(!ok);assert(get_calls==100);}
        if(scenario==3 || scenario==5) {assert(!ok);assert(get_calls==1);}
    }
    puts("Probe and ACK retry fault tests passed (11 scenarios, no device access).");
    return 0;
}
