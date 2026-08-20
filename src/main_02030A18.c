#include "main_02030A18.h"
#include "main_02001188.h"
#include "main_0202AAA8.h"
#include "main_02032558.h"

s32 GetWindowIdPageStart(s32 window_id)
{
    return GetPageStart(GetWindowContents(window_id) + 4);
}

void SetWindowTitle(s32 window_id, u16 title)
{
    struct unk_0202AAA8 *w = GetWindowContents(window_id);

    w->field_0x20 = title;
}
