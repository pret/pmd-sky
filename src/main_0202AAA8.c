#include "main_0202AAA8.h"
#include "main_020282F4.h"
#include "main_02028080.h"
#include "main_02001188.h"

void SetParentMenuState7(s32 window_id)
{
    struct unk_0202AAA8 *menu = GetWindowContents(window_id);

    menu->field_0x19C = 7;
}

void CloseParentMenu(s32 window_id)
{
    struct unk_0202AAA8 *menu = GetWindowContents(window_id);

    MemFree(menu->field_0x198);
    MemFree(menu);
    DeleteWindow(window_id);
}

bool8 sub_0202AAE8(s32 window_id)
{
    struct unk_0202AAA8 *w = GetWindowContents(window_id);

    if (w->field_0x19C != 4 && w->field_0x19C != 5 && w->field_0x19C != 9) {
        return FALSE;
    }

    w->field_0x1A0 = TRUE;
    w->field_0x1A1 = TRUE;
    w->field_0x1A4 = 0;
    sub_0202830C(window_id, -5);
    w->field_0x19C = 7;

    return TRUE;
}
