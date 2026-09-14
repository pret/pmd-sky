#ifndef PMDSKY_OVERLAY_11_02307334_H
#define PMDSKY_OVERLAY_11_02307334_H

#include "common.h"

struct unk_02309DAC {
    s32 field_0x0;
    s16 field_0x4;
};

struct unk_02308F4C {
    s32 field_0x0;
    s16 field_0x4;
    u8 field_0x6[2];
    s16 field_0x8;
    u8 field_0xa;
    u8 field_0xb;
    u32 *field_0xc;
    s16 *field_0x10;
};

s32 ov11_02307334(void);
void ov11_02308D1C(void);
void ov11_02308D48(void);
char* ov11_02308DD8(struct unk_02308F4C *a);
void ov11_02308EB4(char *str, const char *format, ...);
void ov11_02308EDC(void);
void ov11_02308F14(void);
void ov11_02308F4C(struct unk_02308F4C *dst, const struct unk_02309DAC *src);
void ov11_02308FD0(struct unk_02308F4C *a);
void ov11_02308FEC(struct unk_02308F4C *a);
s32 ov11_0230901C(struct unk_02308F4C *a);
int ov11_02309040(s32 param_1);
int ov11_02309084(s16 param_1);
int ov11_023090DC(void);
void ov11_02309DAC(struct unk_02309DAC *out);
void ov11_02309DF8(void);
s16 ov11_02309E24(void);
int ov11_02309E48(s16 param_1);

#endif
