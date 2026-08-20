#include "main_0202BC44.h"
#include "main_020282F4.h"
#include "main_02028080.h"
#include "main_0202AAA8.h"
#include "main_02001188.h"

void CloseAdvancedMenu(s32 window_id)
{
    MemFree(GetWindowContents(window_id));
    DeleteWindow(window_id);
}

bool8 sub_0202BC60(s32 window_id)
{
    struct unk_0202AAA8 *w = GetWindowContents(window_id);

    if (w->field_0x19C != 3 && w->field_0x19C != 4 && w->field_0x19C != 10 && w->field_0x19C != 8) {
        return FALSE;
    }

    w->field_0x1A0 = TRUE;
    w->field_0x1A1 = TRUE;
    w->field_0x1A4 = 0;
    sub_0202830C(window_id, -5);
    w->field_0x19C = 6;

    return TRUE;
}
