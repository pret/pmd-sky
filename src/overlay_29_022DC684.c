#include "overlay_29_022DC684.h"

extern struct unk_02353518 *ov29_02353518;

extern void FreeMapAndTeam(void);

extern void ov10_022C159C(void);

extern void ov10_022C14D0(s32 a);

extern void FreeTeamStats(void);

extern void ov10_022C096C(void);

extern void ov10_022C0F6C(s32 a, s32 b, s32 c, s32 d, s32 e, s32 f, s32 g, s32 h, s32 i, s32 j);

extern void ov10_022C11D8(void);

extern void UpdateTeamStats(void);

extern void ov10_022C22A0(struct unk_022DC694 *p);

extern void ov10_022C0814(struct unk_022DC694 *p, s32 a);

extern void DrawTeamStats(s32 a, s32 b, s32 c);

extern void ov10_022C0998(s32 a, s32 b);

void ov29_022DC684(s32 a)
{
    ov10_022C0998(a, 1);
}

void ov29_022DC694(s32 a, s32 b)
{
    struct unk_022DC694 s;

    ov10_022C22A0(&s);
    ov10_022C0814(&s, b);
    DrawTeamStats(a, 0, 1);
}

void ov29_022DC6D0(void)
{
    UpdateTeamStats();
}

void ov29_022DC6DC(void)
{
    ov10_022C11D8();
}

void ov29_022DC6E8(s32 a, s32 b, s32 c, s32 d, u8 e, s16 f, s16 g, s16 h, s16 i, u8 j)
{
    ov10_022C0F6C(a, b, c, d, e, f, g, h, i, j);
}

void ov29_022DC728(void)
{
    FreeTeamStats();
    ov10_022C096C();
}

void ov29_022DC738(s32 a, s32 b)
{
    struct unk_022DC694 s;

    ov10_022C22A0(&s);
    ov10_022C0814(&s, b);
    ov10_022C14D0(a);
}

void ov29_022DC76C(void)
{
    ov10_022C159C();
}

void ov29_022DC778(void)
{

}

void ov29_022DC77C(void)
{
    FreeMapAndTeam();
    ov10_022C096C();
}

u8 * ov29_022DC78C(s32 id)
{
    s32 i;
    u8 *base;
    s32 off;

    base = (u8 *) ov29_02353518;

    for (i = 0; i < 22; i++) {
        off = i * 0x50;

        if (base[off + 4] != 0 && *(s32 *) &base[off + 8] == id) {
            return base + 4 + off;
        }
    }

    return NULL;
}
