#include "overlay_01_0233755C.h"

extern s8 ov01_0233C1D4[];

extern struct struct_1 ov01_0233BCDC;

extern void ov01_0232F3F4(void);

extern struct struct_1 ov01_0233BCCC;

extern s8 ov01_0233C1B8[];

extern s32 ov01_0233C1B0;

extern u32 InitMenu(struct struct_1 *dst);

extern struct struct_1 ov01_0233BCBC;

extern s32 ov01_0233CA78;

extern void ov01_023310B8(s32 a);

void ov01_0233755C(void)
{
    if (ov01_0233CA78 == 0) {
        ov01_023310B8(8);
    } else {
        ov01_023310B8(0);
    }
}

u32 ov01_0233758C(void)
{
    return InitMenu(&ov01_0233BCBC);
}

s32 ov01_023375A0(void)
{
    return ov01_0233C1B0;
}

void ov01_023375B0(s32 a)
{
    ov01_0233C1B0 = a;
}

s8 ov01_023375C0(s32 i)
{
    return ov01_0233C1B8[i];
}

void ov01_023375D0(s32 i, s8 v)
{
    ov01_0233C1B8[i] = v;
}

u32 ov01_023375E0(void)
{
    return InitMenu(&ov01_0233BCCC);
}

void ov01_023375F4(void)
{
    if (InitMenu(&ov01_0233BCDC)) {
        ov01_0232F3F4();
    }
}

s8 ov01_02337614(s32 i)
{
    return ov01_0233C1D4[i];
}

void ov01_02337624(s32 i, s8 v)
{
    ov01_0233C1D4[i] = v;
}
