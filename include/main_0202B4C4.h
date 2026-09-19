#ifndef PMDSKY_MAIN_0202B4C4_H
#define PMDSKY_MAIN_0202B4C4_H

#include "util.h"
#include "window.h"
#include "main_0202A66C.h"

void sub_0202B0A4(s32 window_id, s32 a);
s32 CreateSimpleMenuFromStringIds(WindowTemplate *params, u32 flags, struct struct_2 *cfg, struct unk_0202A5CC *items, s32 n);
s32 CreateSimpleMenu(WindowTemplate *params, u32 flags, struct struct_2 *cfg, struct unk_0202A75C *items, s32 n);
s32 CreateSimpleMenuInternal(WindowTemplate *params, u32 flags, struct struct_2 *cfg, struct unk_0202A75C *items, s32 n);
void ResumeSimpleMenu(s32 window_id);
void CloseSimpleMenu(s32 window_id);
u32 IsSimpleMenuActive(s32 window_id);
bool8 CheckSimpleMenuField0x1A0(s32 window_id);
s32 sub_0202B530(s32 window_id);
s32 sub_0202B544(s32 window_id);

#endif
