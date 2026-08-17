#include "main_0202C794.h"
#include "main_0202C5E0.h"

void SetCollectionMenuField0x1C8(s32 window_id, u8 value)
{
    struct unk_0202C5E0 *w = GetWindowContents(window_id);

    w->field_0x1C8 = value;
}

void SetCollectionMenuField0x1A0(s32 window_id, s32 value)
{
    struct unk_0202C5E0 *w = GetWindowContents(window_id);

    w->field_0x1A0 = value;
}

void SetCollectionMenuField0x1A4(s32 window_id, s32 value)
{
    struct unk_0202C5E0 *w = GetWindowContents(window_id);

    w->field_0x1A4 = value;
}

void SetCollectionMenuVoidFn(s32 window_id, void* fn)
{
    struct unk_0202C5E0 *w = GetWindowContents(window_id);

    w->field_0x1A8 = fn;
}
