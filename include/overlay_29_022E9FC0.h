#ifndef PMDSKY_OVERLAY_29_022E9FC0_H
#define PMDSKY_OVERLAY_29_022E9FC0_H

#include "dungeon_mode.h"

u8 ov29_022E9FC0(void);
void ov29_022E9FD0(u8 value);
void AdvanceFrame(u32 param_1);
void ov29_022EA008(void);
void ov29_022EA2A4(u32 param_1);
void ov29_022EA324(u32 param_1);
void ov29_022EA370(s32 a, s32 b);
void ov29_022EA3B4(s32 param_1);
void ov29_022EA3F8(void);
s32 ov29_022EA408(void);
void ov29_022EA418(u8 param_1);
void UnkMapRelatedFunc(s32 switch_case, u32 param_2);
void ov29_022EA62C(void);
void AnimateWaterShadows(void);
void DisplayAnimatedNumbers(s32 amount, struct entity *entity, bool8 display_sign, s32 number_color);
void ov29_022EA80C(void);

#endif
