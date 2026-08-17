#include "main_0202BC44.h"
#include "main_0202AAA8.h"
#include "main_02001188.h"

void CloseAdvancedMenu(s32 window_id)
{
    MemFree(GetWindowContents(window_id));
    DeleteWindow(window_id);
}
