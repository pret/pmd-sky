#ifndef PMDSKY_MAIN_0203C910_H
#define PMDSKY_MAIN_0203C910_H

#include "util.h"

struct unk_020AFE70 {
    u8 field_0x0[4];
    s16 field_0x4;
    s16 field_0x6;
    u16 field_0x8;
    u8 field_0xA[2];
    s32 field_0xC;
};

struct unk_0209C7F4 {
    void (*field_0x0[11])(void);
};

bool8 sub_0203C910(void);
s32 sub_0203C940(void);
void sub_0203C984(void);
s32 sub_0203C9A0(s16 a);
void sub_0203C9C4(void);
void sub_0203C9E4(void);
void sub_0203CA40(void);
void sub_0203CA6C(void);
void sub_0203CA90(void);
void sub_0203CACC(void);

#endif
