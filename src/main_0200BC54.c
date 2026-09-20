#include "main_0200BC54.h"

extern bool8 HandleFades(struct screen_fade *fstruct);
extern void UpdateFadeStatus(struct screen_fade *fstruct, s32 a, s32 b);
extern void sub_0200B928(struct screen_fade *fstruct, s32 a);

bool8 HandleFadesVeneer(struct screen_fade *fstruct)
{
    HandleFades(fstruct);
}

void sub_0200BC60(struct screen_fade *fstruct, s32 a, s32 b, u8 *c)
{
    u8 *dst;
    u32 n;

    fstruct->field_0x0 = a;
    dst = fstruct->field_0x16;
    n = 4;
    do {
        *dst++ = *c++;
    } while (--n != 0);

    if (a == 3 || a == 5 || a == 7 || a == 9 || a == 11) {
        UpdateFadeStatus(fstruct, 2, b);
    } else {
        sub_0200B928(fstruct, b);
    }
}

void sub_0200BCB0(struct screen_fade *fstruct, s32 a, s32 b, u8 *c)
{
    u8 *dst;
    u32 n;

    fstruct->field_0x0 = a;
    dst = fstruct->field_0x16;
    n = 4;
    do {
        *dst++ = *c++;
    } while (--n != 0);

    if (a == 1) {
        UpdateFadeStatus(fstruct, 1, b);
    } else if (a == 3 || a == 5 || a == 7 || a == 9 || a == 11) {
        sub_0200B928(fstruct, b);
    } else {
        UpdateFadeStatus(fstruct, 2, b);
    }
}

bool8 sub_0200BD14(struct screen_fade *fstruct)
{
    return fstruct->status != 0;
}
