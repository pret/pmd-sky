#include "main_02027A80.h"

void SetScreenWindowsColor(s32 color, s32 screen);

void SetBothScreensWindowsColor(s32 color)
{
    SetScreenWindowsColor(color, 0);
    SetScreenWindowsColor(color, 1);
}
