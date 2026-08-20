#include "overlay_11_022E9A78.h"

extern void sub_0200BC60(struct unk_023890A0 *p, s32 a, s32 b, s32 c);

extern struct unk_023890A0 ov11_02389018;

extern struct unk_023890A0 ov11_02389128;

extern s32 sub_02002878(s32 a);

extern void sub_0200BBF8(struct unk_023890A0 *p, s32 a, s32 b, s32 c);

extern void sub_0200BB74(struct unk_023890A0 *p, s32 a, s32 b);

extern struct unk_023890A0 ov11_0238905C;

extern void sub_0200BB60(struct unk_023890A0 *p, s32 a);

extern struct unk_02388FC0 ov11_02388FC0;

extern void sub_0200B918(struct unk_023890A0 *p, s32 a);

extern struct unk_023890A0 ov11_023890A0;

extern struct unk_023890A0 ov11_023890E4;

extern void sub_0200B908(struct unk_023890A0 *p, s32 a);

void ov11_022E9A78(s32 a)
{
    sub_0200B908(&ov11_023890E4, a);
}

void ov11_022E9A90(s32 a)
{
    sub_0200B908(&ov11_023890A0, a);
}

void ov11_022E9AA8(s32 a)
{
    sub_0200B918(&ov11_023890E4, a);
}

void ov11_022E9AC0(s32 a)
{
    sub_0200B918(&ov11_023890A0, a);
}

void ov11_022E9AD8(s32 a)
{
    ov11_02388FC0.field_0x0 = TRUE;
    ov11_02388FC0.field_0xC = a;
}

void ov11_022E9AF0(s32 a, u8 b)
{
    ov11_02388FC0.field_0x2 = TRUE;
    ov11_02388FC0.field_0x3 = b;
    ov11_02388FC0.field_0xC = a;
}

void ov11_022E9B0C(s32 a)
{
    sub_0200BB60(&ov11_0238905C, a);
}

void ov11_022E9B24(s32 a)
{
    sub_0200BB74(&ov11_0238905C, 1, a);
}

void ov11_022E9B40(s32 a)
{
    sub_0200BB74(&ov11_0238905C, 2, a);
}

void ov11_022E9B5C(s32 a, s32 b, s32 c)
{
    sub_0200BBF8(&ov11_0238905C, a, b, c);
}

void ov11_022E9B84(s32 a)
{
    if (sub_02002878(2) != 0) {
        sub_0200BB60(&ov11_02389128, a);
        ov11_02388FC0.field_0x1 = 1;
        return;
    }

    ov11_02388FC0.field_0x8 = 1;
    ov11_02388FC0.field_0x4 = a;
    ov11_02388FC0.field_0x1 = 1;
}

void ov11_022E9BD0(s32 a)
{
    if (sub_02002878(2) != 0) {
        sub_0200BB74(&ov11_02389128, 1, a);
        ov11_02388FC0.field_0x1 = 1;
        return;
    }

    ov11_02388FC0.field_0x8 = 2;
    ov11_02388FC0.field_0x4 = a;
    ov11_02388FC0.field_0x1 = 1;
}

void ov11_022E9C20(s32 a)
{
    if (sub_02002878(2) != 0) {
        sub_0200BB74(&ov11_02389128, 2, a);
        ov11_02388FC0.field_0x1 = 1;
        return;
    }

    ov11_02388FC0.field_0x8 = 3;
    ov11_02388FC0.field_0x4 = a;
    ov11_02388FC0.field_0x1 = 1;
}

void ov11_022E9C70(s32 a, s32 b, s32 c)
{
    sub_0200BBF8(&ov11_02389128, a, b, c);
}

void ov11_022E9C98(s32 a)
{
    sub_0200BB60(&ov11_02389018, a);
}

void ov11_022E9CB0(s32 a)
{
    sub_0200BB74(&ov11_02389018, 1, a);
}

void ov11_022E9CCC(s32 a)
{
    sub_0200BB74(&ov11_02389018, 2, a);
}

void ov11_022E9CE8(s32 a, s32 b, s32 c)
{
    sub_0200BBF8(&ov11_02389018, a, b, c);
}

void ov11_022E9D10(s32 a)
{
    if (ov11_02389018.field_0x14 > 0) {
        sub_0200BB74(&ov11_02389018, 2, a);
    } else {
        sub_0200BB74(&ov11_02389018, 1, a);
    }
}

void ov11_022E9D44(s32 a, s32 b, s32 c)
{
    sub_0200BC60(&ov11_023890E4, a, b, c);
}
