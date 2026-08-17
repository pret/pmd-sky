#include "main_0203083C.h"
#include "main_0202AAA8.h"
#include "main_02001188.h"

void SetAdvancedTextBoxField0x1C2(s32 window_id)
{
    struct unk_0202AAA8 *w = GetWindowContents(window_id);

    w->field_0x1C2 = 1;
}
