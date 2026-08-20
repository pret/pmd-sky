#include "overlay_29_0234BA54.h"

extern void ov29_022E0B60(s32 a);

extern void UnkMapRelatedFunc(u32 a, u32 b);

extern void ov29_0233A248(s32 a);

extern void sub_0204833C(void);

extern s32 sub_02048360(void);

extern void sub_02048240(s32 a);

extern void sub_02048150(s32 a);

extern void sub_02048134(s32 a);

extern void sub_020480CC(s32 a);

extern void sub_0204804C(s32 a);

extern void sub_02047FFC(s32 a);

extern void InitPortraitParams(struct unk_0234BAC0 *p);

extern void AllowPortraitDefault(struct unk_0234BAC0 *p, s32 a);

extern struct unk_023537CC MESSAGE_LOG_INFO;

extern u16 DUNGEON_BUTTON_INPUT[8];

extern void WaitUntilAlertBoxTextIsLoaded(u32 a);

extern void AdvanceFrame(u32 a);

void WaitUntilAlertBoxPauseIsOver(u32 a)
{
    u8 *p;
    s32 i;

    p = MESSAGE_LOG_INFO.field_0x4;
    WaitUntilAlertBoxTextIsLoaded(a);
    p += 0xC00;

    for (i = 0; i < 0xF0; i++) {
        if (*(s16 *) &p[0x90] < 0xB4) {
            return;
        }

        if ((DUNGEON_BUTTON_INPUT[0] & 3) == 3) {
            return;
        }

        if (DUNGEON_BUTTON_INPUT[1] & 0xF0) {
            return;
        }

        AdvanceFrame(a);
    }
}

void InitPortraitDungeon(struct unk_0234BAC0 *p, s16 a, u8 b)
{
    InitPortraitParams(p);
    p->field_0x0 = a;
    p->field_0x2 = b;
    p->field_0x3 = 0;
    p->field_0x4 = 2;
    p->field_0x8 = 9;
    p->field_0xC = 0;
    p->field_0xD = 0;
    p->field_0xE = 0;
    AllowPortraitDefault(p, 1);
}

void ov29_0234BB10(void)
{
    sub_02047FFC(0);
}

void ov29_0234BB20(s32 a)
{
    sub_0204804C(a);
}

void ov29_0234BB2C(s32 a)
{
    sub_020480CC(a);
}

void ov29_0234BB38(s32 a)
{
    sub_02048134(a);
}

void ov29_0234BB44(s32 a)
{
    sub_02048150(a);
}

void ov29_0234BB50(s32 a)
{
    sub_02048240(a);
}

s32 OpenMessageLog(s32 a, s32 b)
{
    s32 r;

    UnkMapRelatedFunc(6, 0);

    if (a == 0) {
        ov29_0233A248(0);
    }

    AdvanceFrame(0x62);
    AdvanceFrame(0x62);
    sub_0204833C();

    do {
        AdvanceFrame(0x62);
        r = sub_02048360();
    } while (r == 0);

    AdvanceFrame(0x62);

    if (b != 0) {
        UnkMapRelatedFunc(0, 0);
    }

    return r == 1;
}

void ov29_0234BBDC(s32 a)
{
    ov29_022E0B60(a);
}
