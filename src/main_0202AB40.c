#include "main_0202AB40.h"
#include "main_0202AAA8.h"

u32 IsParentMenuActive(s32 window_id)
{
    struct unk_0202AAA8 *menu = GetWindowContents(window_id);
    s32 state = menu->field_0x19C;

    return state != 8 && state != 9;
}

bool8 CheckParentMenuField0x1A0(s32 window_id)
{
    struct unk_0202AAA8 *menu = GetWindowContents(window_id);

    return menu->field_0x1A0 == 0;
}
