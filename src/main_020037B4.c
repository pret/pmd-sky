#include "main_020037B4.h"

float GetTime(void)
{
    s32 frames;
    s32 vcount;

    DisableAllInterrupts();
    if (_020AEF7C.field_0x1c == 0) {
        EnableAllInterrupts();
        return 0.0f;
    }

    frames = _020AEF7C.field_0x1c;
    vcount = reg_GX_VCOUNT;
    EnableAllInterrupts();
    return (float)frames + (1.0f / 263.0f) * (float)vcount;
}

u16 DisableAllInterrupts(void)
{
    u16 old;

    old = reg_OS_IME;
    reg_OS_IME = 0;
    return old;
}
