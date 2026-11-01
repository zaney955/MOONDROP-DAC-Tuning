#define main echo_a_program_main
#include "echo_a_hid.c"
#undef main
#include <assert.h>

int main(void) {
    uint8_t t[9][63]={{0}};
    for(int i=0;i<8;i++) {
        t[i][0]=1;t[i][1]=9;t[i][2]=0x18;t[i][4]=i;
        t[i][27]=0xe8;t[i][28]=3;t[i][29]=192;t[i][33]=2;
    }
    t[8][0]=1;t[8][1]=3;t[8][2]=2;t[8][4]=236;
    assert(valid_target(t,0));
    t[0][1]=0xff;assert(!valid_target(t,0));t[0][1]=9;
    t[0][35]=1;assert(!valid_target(t,0));t[0][35]=0;
    t[7][4]=6;assert(!valid_target(t,0));t[7][4]=7;
    t[8][4]=1;assert(!valid_target(t,0));t[8][4]=236;
    t[0][62]=1;assert(!valid_target(t,0));t[0][62]=0;
    t[0][33]=3;assert(!valid_target(t,0));
    puts("ECHO-A frame validation passed");return 0;
}
