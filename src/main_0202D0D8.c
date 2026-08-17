#include "main_0202D0D8.h"
#include "main_0202C5E0.h"

void SetCollectionMenuField0x1B2(s32 window_id, u8 value)
{
    struct unk_0202C5E0 *w = GetWindowContents(window_id);

    w->field_0x1B2 = value;
}
