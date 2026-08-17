#ifndef PMDSKY_MAIN_0202AAA8_H
#define PMDSKY_MAIN_0202AAA8_H

#include "util.h"

struct unk_0202AAA8 {
    u8 field_0x0[0x198];
    void *field_0x198;
    s32 field_0x19C;
    u8 field_0x1A0;
    s32 field_0x1A4;
};

void *GetWindowContents(s32 window_id);
void DeleteWindow(s32 window_id);
s32 GetSelectedItemOnPage(void *p);

void SetParentMenuState7(s32 window_id);
void CloseParentMenu(s32 window_id);

#endif
