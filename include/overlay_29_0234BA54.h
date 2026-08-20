#ifndef PMDSKY_OVERLAY_29_0234BA54_H
#define PMDSKY_OVERLAY_29_0234BA54_H

#include "util.h"

struct unk_0234BAC0 {
    s16 field_0x0;
    u8 field_0x2;
    u8 field_0x3;
    s32 field_0x4;
    s32 field_0x8;
    u8 field_0xC;
    u8 field_0xD;
    u8 field_0xE;
};

struct unk_023537CC {
    bool8 field_0x0;
    u8 field_0x1;
    u8 field_0x2;
    u8 field_0x3;
    u8 *field_0x4;
};

void WaitUntilAlertBoxPauseIsOver(u32 a);
void InitPortraitDungeon(struct unk_0234BAC0 *p, s16 a, u8 b);
void ov29_0234BB10(void);
void ov29_0234BB20(s32 a);
void ov29_0234BB2C(s32 a);
void ov29_0234BB38(s32 a);
void ov29_0234BB44(s32 a);
void ov29_0234BB50(s32 a);
s32 OpenMessageLog(s32 a, s32 b);
void ov29_0234BBDC(s32 a);

#endif
