#include "main_0202C748.h"
#include "main_0202C5E0.h"
#include "main_0202AAA8.h"
#include "main_02032558.h"

s32 GetWindowIdSelectedMenuItemIdx(s32 window_id)
{
    return GetSelectedMenuItemIdx(GetWindowContents(window_id) + 4);
}

s32 sub_0202C75C(s32 window_id)
{
    struct unk_0202C5E0 *w = GetWindowContents(window_id);

    if (w->field_0x1B0 != 0) {
        if (w->field_0x1B1 != 0) {
            return -1;
        }

        return GetSelectedMenuItemIdx((void *) w + 4);
    }

    return -1;
}
