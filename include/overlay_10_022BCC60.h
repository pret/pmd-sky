#ifndef PMDSKY_OVERLAY_10_022BCC60_H
#define PMDSKY_OVERLAY_10_022BCC60_H

#include "util.h"

void ov10_022BCC60(u32 unused, u32 r1);
void ov10_022BCC7C(s32 window_id);
void ov10_022BCCB0(s32 window_id);
void SetInventoryMenuState0(s32 window_id);
void SetInventoryMenuState6(s32 window_id);
void CloseInventoryMenu(s32 window_id);
bool8 ov10_022BCD10(s32 window_id);
s32 IsInventoryMenuActive(s32 window_id);
bool8 CheckInventoryMenuField0x1A0(s32 window_id);
void ov10_022BCDA8(s32 window_id);
s32 ov10_022BCDBC(s32 window_id);

#endif //PMDSKY_OVERLAY_10_022BCC60_H
