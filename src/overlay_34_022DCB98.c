#include "overlay_34_022DCB98.h"
#include "debug.h"

extern void sub_02008F3C(s32, s32);

void ov34_022DCB64(s32 arg0)
{
    if (Debug_GetDebugFlag(DEBUG_FLAG_NO_SCREEN_FADE) != 0) {
        sub_02008F3C(0, 0);
        return;
    }
    sub_02008F3C(0, arg0);
}

void ov34_022DCB98(s32 arg0)
{
    if (Debug_GetDebugFlag(DEBUG_FLAG_NO_SCREEN_FADE) != 0) {
        sub_02008F3C(1, 0);
        return;
    }
    sub_02008F3C(1, arg0);
}
