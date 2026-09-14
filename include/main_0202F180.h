#ifndef PMDSKY_MAIN_0202F180_H
#define PMDSKY_MAIN_0202F180_H

#include "util.h"
#include "window.h"
#include "main_0200C4FC.h"
#include "main_0202613C.h"

struct unk_0202F190 {
    u8 field_0x0[4];
    s32 field_0x4;
    u8 field_0x8;
    u8 field_0x9;
    u8 field_0xA;
    u8 field_0xB;
    struct unk_02026130 field_0xC;
    char field_0x128[0x400];
};

struct unk_0202F5AC {
    s8 field_0x0;
    u8 field_0x1[3];
    s32 field_0x4;
    portrait_params field_0x8;
    portrait_params field_0x18;
    u8 field_0x28;
    u8 field_0x29;
    u8 field_0x2A;
    u8 field_0x2B;
    s32 field_0x2C;
    u8 field_0x30[0x30];
    u8 field_0x60[0x320];
};

bool8 IsDialogueBoxActive(s32 window_id);
void sub_0202F190(s32 window_id, s32 a, s32 b);
void ShowStringIdInDialogueBox(s32 window_id, u32 flags, s32 string_id, struct preprocessor_args *args);
void ShowStringInDialogueBox(s32 window_id, u32 flags, const char *string, struct preprocessor_args *args);
void sub_0202F2C4(s32 window_id);
void sub_0202F334(s32 window_id);
void ShowDialogueBox(s32 window_id);
void sub_0202F3F8(s32 window_id);
void ReadStringFromDialogueBox(s32 window_id, char *dest, s32 n);
void sub_0202F474(s32 window_id, s32 a);
void UpdateDialogueBox(struct Window *w);
s8 CreatePortraitBox(s32 bg_id, s32 a, s32 b);
void ClosePortraitBox(s32 window_id);
bool8 PortraitBoxNeedsUpdate(s32 window_id);
void ShowPortraitInPortraitBox(s32 window_id, portrait_params *p);
void HidePortraitBox(s32 window_id);
void UpdatePortraitBox(struct Window *w);

#endif
