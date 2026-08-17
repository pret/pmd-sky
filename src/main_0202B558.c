#include "main_0202B558.h"
#include "main_0202AAA8.h"

s32 GetSimpleMenuField0x1A4(s32 window_id)
{
    struct unk_0202AAA8 *menu = GetWindowContents(window_id);

    return menu->field_0x1A4;
}
