#include "main_0202B558.h"
#include "main_0202AAA8.h"
#include "main_0202A66C.h"
#include "main_0203258C.h"

s32 GetSimpleMenuField0x1A4(s32 window_id)
{
    struct unk_0202AAA8 *menu = GetWindowContents(window_id);

    return menu->field_0x1A4;
}

s32 sub_0202B568(s32 window_id)
{
    return GetMaxItemsOnPage(GetWindowContents(window_id) + 4);
}

s32 GetSimpleMenuResult__0202B870(s32 window_id)
{
    struct unk_0202AAA8 *menu = GetWindowContents(window_id);
    struct unk_0202A75C *items = menu->field_0x198;
    s32 idx;

    if (menu->field_0x1A0 != 0) {
        if (menu->field_0x1A1 != 0) {
            idx = GetTotalNumMenuItems((void *)menu + 4);
        } else {
            idx = GetSelectedMenuItemIdx((void *)menu + 4);
        }
        return items[idx].field_0x100;
    }
    return 0;
}
