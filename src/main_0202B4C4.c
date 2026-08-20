#include "main_0202B4C4.h"
#include "main_0202AAA8.h"
#include "main_02001188.h"

void CloseSimpleMenu(s32 window_id)
{
    struct unk_0202AAA8 *menu = GetWindowContents(window_id);

    MemFree(menu->field_0x198);
    MemFree(menu);
    DeleteWindow(window_id);
}

u32 IsSimpleMenuActive(s32 window_id)
{
    struct unk_0202AAA8 *menu = GetWindowContents(window_id);
    s32 state = menu->field_0x19C;

    return state != 7 && state != 8;
}

bool8 CheckSimpleMenuField0x1A0(s32 window_id)
{
    struct unk_0202AAA8 *menu = GetWindowContents(window_id);

    return menu->field_0x1A0 == 0;
}
