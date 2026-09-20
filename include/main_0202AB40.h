#ifndef PMDSKY_MAIN_0202AB40_H
#define PMDSKY_MAIN_0202AB40_H

#include "util.h"
#include "window.h"

u32 IsParentMenuActive(s32 window_id);
bool8 CheckParentMenuField0x1A0(s32 window_id);
s32 GetWindowIdSelectedItemOnPage(s32 window_id);
void sub_0202AB94(s32 window_id, s32 a);
s32 GetSimpleMenuResult__0202AEA4(s32 window_id);
void UpdateParentMenu(struct Window *w);
void sub_0202AF78(struct Window *w);
void sub_0202B030(s32 window_id);

#endif
