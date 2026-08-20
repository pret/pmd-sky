#ifndef PMDSKY_MAIN_02028284_H
#define PMDSKY_MAIN_02028284_H

#include "window.h"

void sub_0202825C(s32 index, u16 value);
u16 sub_02028270(s32 index);
struct unk_02028284 {
    s32 field_0x0;
    s32 field_0x4;
    s32 field_0x8;
    s32 field_0xC;
};


void GetWindowRectangle(s32 window_id, struct unk_02028284* out);
void sub_020282C8(s32 window_id, Point* out);

#endif
