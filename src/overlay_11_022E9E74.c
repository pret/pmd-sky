#include "overlay_11_022E9E74.h"
#include "overlay_11_022E9A78.h"

extern s32 GetFadeStatus(struct unk_023890A0 *p);

extern struct unk_023890A0 ov11_02389018;

extern struct unk_023890A0 ov11_023890A0;

extern struct unk_023890A0 ov11_02389128;

extern bool8 sub_02002878(s32 v);

extern struct unk_02388FC0 ov11_02388FC0;

extern struct unk_023890A0 ov11_0238905C;

extern struct unk_023890A0 ov11_023890E4;

extern s32 sub_0200BD14(struct unk_023890A0 *p);

extern void sub_0200BBF8(struct unk_023890A0 *p, s32 a, s32 b, s32 c);

extern struct unk_0238916C ov11_0238916C[];

extern u16 ov11_02388FD4[];

extern void sub_0200BB74(struct unk_023890A0 *p, s32 a, s32 b);

extern void sub_0200BB88(struct unk_0238916C *p, s32 a);

void ov11_022E9E74(s32 idx, u16 a, s32 b)
{
    ov11_02388FD4[idx] = a;
    sub_0200BB74((struct unk_023890A0 *) &ov11_0238916C[idx], 1, 0);
    sub_0200BB88(&ov11_0238916C[idx], b);
}

void ov11_022E9EBC(s32 idx, u16 a, s32 b)
{
    ov11_02388FD4[idx] = a;
    sub_0200BBF8((struct unk_023890A0 *) &ov11_0238916C[idx], 0,
                 (s16) (b - 0x100), (s16) (b - 0x100));
}

s32 ov11_022E9EFC(void)
{
    if (ov11_02388FC0.field_0x0 != 0 || ov11_02388FC0.field_0x2 != 0) {
        return 1;
    }

    if (sub_0200BD14(&ov11_023890E4)) {
        return 1;
    }

    return sub_0200BD14(&ov11_0238905C);
}

s32 ov11_022E9F48(void)
{
    if (sub_02002878(2) == 0) {
        return ov11_02388FC0.field_0x1;
    }

    return sub_0200BD14(&ov11_02389128);
}

s32 IsScreenFadeInProgress(void)
{
    if (sub_0200BD14(&ov11_023890A0)) {
        return 1;
    }

    return sub_0200BD14(&ov11_02389018);
}

bool8 ov11_022E9FA4(s32 idx)
{
    return ov11_02388FD4[idx] != 0;
}

s32 ov11_022E9FC8(s32 a)
{
    if (a == 0) {
        return GetFadeStatus(&ov11_02389128);
    }

    return GetFadeStatus(&ov11_02389018);
}

s16 ov11_022E9FF4(void)
{
    return ov11_0238905C.field_0x14;
}

s16 ov11_022EA004(void)
{
    return ov11_02389128.field_0x14;
}

s16 ov11_022EA014(void)
{
    return ov11_02389018.field_0x14;
}
