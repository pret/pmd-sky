#ifndef PMDSKY_MAIN_0200238C_H
#define PMDSKY_MAIN_0200238C_H

struct unk_0229B004 {
    OSThread *field_0x0;
    s32 field_0x4;
    s32 field_0x8;
    s32 field_0xC;
    s32 field_0x10;
    s32 field_0x14;
};

struct unk_0229AFC0 {
    s32 field_0x0;
    s32 field_0x4;
    s32 field_0x8;
};

s8 sub_0200238C(s8 c);
void sub_020023A8(s8 *dst, s8 *src, s32 n);
s32 sub_020023F8(s8 *a, s8 *b, s32 n);
void WaitForever(void);
void sub_02002448(u32 a);
s32 sub_020024A0(void);
void sub_020024B0(void);
void sub_020024C0(void);
s32 sub_020024D4(void);

#endif
