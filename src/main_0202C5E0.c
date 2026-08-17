#include "main_0202C5E0.h"

void SetCollectionMenuField0x1BC(s32 window_id, s32 value)
{
    struct unk_0202C5E0 *w = GetWindowContents(window_id);

    w->field_0x1BC = value;
}
