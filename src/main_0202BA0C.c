#include "main_0202BA0C.h"
#include "main_0202AAA8.h"
#include "main_02001188.h"

void SetSimpleMenuField0x1AC(s32 window_id, s32 value)
{
    struct unk_0202AAA8 *w = GetWindowContents(window_id);

    w->field_0x1AC = value;
}
