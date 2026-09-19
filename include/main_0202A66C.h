#ifndef PMDSKY_MAIN_0202A66C_H
#define PMDSKY_MAIN_0202A66C_H

struct unk_0202A5CC {
    u16 field_0x0;
    u8 field_0x2[2];
    s32 field_0x4;
};

struct unk_0202A75C {
    u8 field_0x0[0x100];
    s32 field_0x100;
};

#include "util.h"

u8 CreateParentMenuFromStringIds(void *a, u32 b, void *c, struct unk_0202A5CC *items);
bool8 IsEmptyString(u8* str);

#endif
