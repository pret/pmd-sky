#include "main_020307A4.h"
#include "main_0202AAA8.h"
#include "main_02001188.h"

void SetAdvancedTextBoxField0x1C4(s32 window_id, u8 value)
{
    struct unk_0202AAA8 *w = GetWindowContents(window_id);

    w->field_0x1C4 = value;
}
