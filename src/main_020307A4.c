#include "main_020307A4.h"

extern void sub_02032984(void *p);
#include "main_0202AAA8.h"
#include "main_02001188.h"

void SetAdvancedTextBoxField0x1C4(s32 window_id, u8 value)
{
    struct unk_0202AAA8 *w = GetWindowContents(window_id);

    w->field_0x1C4 = value;
}

void sub_020307B8(s32 window_id)
{
    struct unk_0202AAA8 *w;

    w = GetWindowContents(window_id);
    w->field_0x1BC = 1;
    w->field_0x1C0[0] = 0;
    w->field_0x1C0[1] = 0;
    w->field_0x104 &= ~0x800000;
    sub_02032984((u8 *) w + 4);
}

void sub_020307EC(s32 window_id)
{
    struct unk_0202AAA8 *w;
    bool8 f;

    w = GetWindowContents(window_id);
    f = ((struct unk_0202AAA8 *) GetWindowContents(window_id))->field_0x1BC == 7;

    if (f) {
        sub_020307B8(window_id);
        return;
    }

    if (w->field_0x1BC == 6) {
        w->field_0x1BC = 0;
    }
}
