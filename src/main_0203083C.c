#include "main_0203083C.h"

extern void sub_020288DC(s32 window_id);
#include "main_0202AAA8.h"
#include "main_02001188.h"

void SetAdvancedTextBoxField0x1C2(s32 window_id)
{
    struct unk_0202AAA8 *w = GetWindowContents(window_id);

    w->field_0x1C2 = 1;
}

void CloseAdvancedTextBox2(s32 window_id)
{
    void *contents;

    sub_0202836C(window_id);
    sub_020288DC(window_id);
    sub_0202812C(window_id);
    contents = GetWindowContents(window_id);
    DeleteWindow(window_id);
    MemFree(contents);
}
