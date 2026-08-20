#include "main_02027A80.h"
#include "window.h"

extern u8 _020AFD94[];

extern u16 _020AFD9C;

extern u8 _020AFD98[2];

void sub_02027A08(s32 window_id, s32 value)
{
    u8 bg;

    sub_02027974(window_id);
    WINDOW_LIST[window_id].unkB4 = value;
    sub_020278C4(window_id);
    bg = WINDOW_LIST[window_id].template.bg_id;
    _020AFD4C.field_0x8 |= 1 << bg;
    if (bg == 1) {
        sub_02027B88();
    }
}

void SetScreenWindowsColor(s32 color, s32 screen)
{
    if (screen == 2) {
        screen = 1;
    }
    _020AFD98[screen] = color;
}


void SetBothScreensWindowsColor(s32 color)
{
    SetScreenWindowsColor(color, 0);
    SetScreenWindowsColor(color, 1);
}

void sub_02027AA0(s32 a)
{
    if (a == 1) {
#ifdef JAPAN
        _020AFD4C.field_0x0[3] = 1;
#else
        _020AFD4C.field_0x0[0] = 1;
#endif
        return;
    }

    if (a == 2) {
#ifdef JAPAN
        _020AFD4C.field_0x0[0] = 1;
#else
        _020AFD4C.field_0x0[3] = 1;
#endif
        return;
    }

    _020AFD94[_020AFD9C ^ 1] = 1;
}
