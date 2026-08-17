#include "main_0202BCBC.h"
#include "main_0202AAA8.h"
#include "main_02001188.h"

u32 IsAdvancedMenuActive2(s32 window_id)
{
    struct unk_0202AAA8 *w = GetWindowContents(window_id);

    s32 state = w->field_0x19C;

    return state != 7 && state != 8;
}
