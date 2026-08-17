#ifndef PMDSKY_MAIN_02028284_H
#define PMDSKY_MAIN_02028284_H

#include "util.h"

struct unk_02028284 {
    s32 field_0x0;
    s32 field_0x4;
    s32 field_0x8;
    s32 field_0xC;
};


void GetWindowRectangle(s32 window_id, struct unk_02028284* out);

#endif
