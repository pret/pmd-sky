#include "overlay_10_022BCC60.h"
#include "main_0202AAA8.h"
#include "main_02001188.h"
#include "main_02028080.h"
#include "main_020282F4.h"

extern void sub_020333FC(void *p);

extern s32 sub_02033064(void *p);

extern void sub_020331AC(void*, u32);
extern void* GetWindowContents(s32 window_id);

void ov10_022BCC60(u32 unused, u32 r1)
{
    sub_020331AC(GetWindowContents(unused) + 4, r1);
}

void ov10_022BCC7C(s32 window_id)
{
    struct unk_0202AAA8 *w = GetWindowContents(window_id);

    w->field_0x19C = 1;
    w->field_0x1A0 = 0;
    w->field_0x1A1 = 0;
    w->field_0xF8 &= ~0x800000;
    sub_020333FC((void *) w + 4);
}

void ov10_022BCCB0(s32 window_id)
{
    struct unk_0202AAA8 *w = GetWindowContents(window_id);

    if (w->field_0x19C == 3) {
        w->field_0x19C = 2;
    }
}

void SetInventoryMenuState0(s32 window_id)
{
    struct unk_0202AAA8 *w = GetWindowContents(window_id);

    w->field_0x19C = 0;
}

void SetInventoryMenuState6(s32 window_id)
{
    struct unk_0202AAA8 *w = GetWindowContents(window_id);

    w->field_0x19C = 6;
}

void CloseInventoryMenu(s32 window_id)
{
    MemFree(GetWindowContents(window_id));
    DeleteWindow(window_id);
}

bool8 ov10_022BCD10(s32 window_id)
{
    struct unk_0202AAA8 *w = GetWindowContents(window_id);
    s32 state;

    state = w->field_0x19C;
    if (state == 6) {
        return TRUE;
    }

    if (state != 3 && state != 8) {
        return FALSE;
    }

    w->field_0x1A0 = 1;
    w->field_0x1A1 = 1;
    sub_0202830C(window_id, -5);
    w->field_0x19C = 6;

    return TRUE;
}

s32 IsInventoryMenuActive(s32 window_id)
{
    struct unk_0202AAA8 *w = GetWindowContents(window_id);
    s32 state;

    state = w->field_0x19C;

    return state != 7 && state != 8;
}

bool8 CheckInventoryMenuField0x1A0(s32 window_id)
{
    struct unk_0202AAA8 *w = GetWindowContents(window_id);

    return w->field_0x1A0 == 0;
}

void ov10_022BCDA8(s32 window_id)
{
    struct unk_0202AAA8 *w = GetWindowContents(window_id);

    sub_02033064((void *) w + 4);
}

s32 ov10_022BCDBC(s32 window_id)
{
    struct unk_0202AAA8 *w = GetWindowContents(window_id);

    if (w->field_0x1A0 != 0) {
        if (w->field_0x1A1 != 0) {
            return -1;
        }

        return sub_02033064((void *) w + 4);
    }

    return -1;
}
