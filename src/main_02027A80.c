#include "main_02027A80.h"

extern u8 _020AFD98[2];

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
