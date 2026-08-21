#include "main_02030A40.h"
#include "main_0202AAA8.h"

extern void sub_02031C74(void *p, u32 flags);

#include "main_0202AAA8.h"

s32 GetAdvancedTextBoxFlags2(s32 window_id)
{
    struct unk_0202AAA8 *w = GetWindowContents(window_id);

    return w->field_0x1B0;
}

void sub_02030A50(s32 window_id, s32 value)
{
    struct unk_02030A50 *w = GetWindowContents(window_id);

    w->field_0xC0 = value;
}

s32 sub_02030A64(s32 window_id)
{
    struct unk_02030A50 *w = GetWindowContents(window_id);

    return w->field_0xC0;
}

void sub_02030A74(s32 window_id, u32 flags)
{
    struct unk_02030A50 *w = GetWindowContents(window_id);

    sub_02031C74((void *) w + 4, flags);
}
