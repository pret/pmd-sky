#include "main_02030A40.h"
#include "main_0202AAA8.h"

s32 GetAdvancedTextBoxFlags2(s32 window_id)
{
    struct unk_0202AAA8 *w = GetWindowContents(window_id);

    return w->field_0x1B0;
}
