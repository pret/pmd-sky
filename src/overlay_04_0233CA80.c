#include "overlay_04_0233CA80.h"
#include "main_0200330C.h"

extern struct unk_0233F660 ov04_0233F660;

void ov04_0233CA80(void)
{
    MemZero((u8 *) &ov04_0233F660, 0x10);
}

void ov04_0233CA98(s32 a)
{
    ov04_0233F660.field_0x0 = a;
}

s32 ov04_0233CAA8(void)
{
    return ov04_0233F660.field_0x0;
}

void ov04_0233CAB8(s32 a)
{
    ov04_0233F660.field_0x4 = a;
}

s32 ov04_0233CAC8(void)
{
    return ov04_0233F660.field_0x4;
}

void ov04_0233CAD8(u8 a)
{
    ov04_0233F660.field_0xC = a;
}

u8 ov04_0233CAE8(void)
{
    return ov04_0233F660.field_0xC;
}
