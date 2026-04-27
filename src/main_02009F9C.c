#include "main_02009F9C.h"

extern s32 _02092A04[];
extern u8 _022A37EC[];
extern u8 _022A37ED[];
extern u8 _022A37EE[];
extern u8 _022A37EF[];
extern u8 _022A37F0[];
extern u8 _022A37F1[];
extern u8 _022A37F2[];

extern void sub_02009B98(s32, u8);
extern void sub_02009BC0(s32, u8);
extern void sub_02009BE8(s32, u8);
extern void sub_02009C10(s32, u8);
extern void sub_02009CA8(s32, u8);
extern void sub_02009CD0(s32, u8);
extern void sub_02009CF8(s32, u8);
extern void sub_02009D20(s32, u8);

void sub_02009F9C(s32 arg0)
{
    s32 offset;
    s32 var_r2;
    s32 var_r3;
    s32 var_r5;
    s32 var_r6;
    u8 var_ip;

    offset = arg0 * 0x1B;
    var_r2 = 0;
    if (_022A37EC[offset] != 0) {
        var_r2 |= 1;
    }
    var_ip = var_r6 = var_r5 = var_r3 = 0;
    if (_022A37ED[offset] != 0) {
        var_r2 |= 2;
    }
    if (_022A37EE[offset] != 0) {
        var_r2 |= 4;
    }
    do {
        if (_022A37EC[offset + var_ip + 7] != 0) var_r3 |= _02092A04[var_ip];
        if (_022A37EC[offset + var_ip + 12] != 0) var_r3 |= _02092A04[var_ip];
        if (_022A37EC[offset + var_ip + 22] != 0) var_r6 |= _02092A04[var_ip];
        if (_022A37EC[offset + var_ip + 17] != 0) var_r5 |= _02092A04[var_ip];
        var_ip++;
    } while (var_ip < 5U);

    if (arg0 == 0) {
        *(s32*)0x04000000 = (*(s32*)0x04000000 & ~0xE000) | (var_r2 << 0xD);
        sub_02009B98(var_r3, _022A37EF[offset]);
        sub_02009BC0(0, _022A37F0[offset]);
        sub_02009BE8(var_r5, _022A37F1[offset]);
        sub_02009C10(var_r6, _022A37F2[offset]);
        return;
    }
    *(s32*)0x04001000 = (*(s32*)0x04001000 & ~0xE000) | (var_r2 << 0xD);
    sub_02009CA8(var_r3, _022A37EF[offset]);
    sub_02009CD0(0, _022A37F0[offset]);
    sub_02009CF8(var_r5, _022A37F1[offset]);
    sub_02009D20(var_r6, _022A37F2[offset]);
}
