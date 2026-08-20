#include "overlay_11_022E9A78.h"

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
