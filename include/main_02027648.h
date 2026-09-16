#ifndef PMDSKY_MAIN_02027648_H
#define PMDSKY_MAIN_02027648_H

#include "util.h"
#include "window.h"
#include "main_02029A50.h"

struct unk_022A7B1C {
    u8 field_0x0;
    unkStruct_02029A50 field_0x4;
#ifndef JAPAN
    s8 field_0x2c;
#endif
};

extern struct unk_022A7B1C _022A7B1C[20];

void InitRender3dElement64(WindowBlock *elem);
void InitWindowTrailer(CursorParams *params);

u32 sub_02027624(s32 window_id);
s32 NewWindowScreenCheck(s32 a, s32 b);
s32 NewWindow(s32 a, s32 b);

#endif
