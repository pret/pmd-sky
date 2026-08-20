#include "overlay_06_0233CA80.h"
#include "main_0200330C.h"

extern struct unk_0233EEE0 ov06_0233EEE0;

void ov06_0233CA80(void)
{
    MemZero((u8 *) &ov06_0233EEE0, 0xC);
}

void ov06_0233CA98(s32 a)
{
    ov06_0233EEE0.field_0x0 = a;
}

s32 ov06_0233CAA8(void)
{
    return ov06_0233EEE0.field_0x0;
}
