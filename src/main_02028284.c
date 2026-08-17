#include "main_02028284.h"
#include "window.h"

void GetWindowRectangle(s32 window_id, struct unk_02028284* out)
{
    struct Window *w = &WINDOW_LIST[window_id];
    s32 top = w->field_0x5 << 3;
    s32 left;

    out->field_0x0 = top;
    out->field_0x4 = top + (w->field_0x7 << 3);
    left = w->field_0x4 << 3;
    out->field_0x8 = left;
    out->field_0xC = left + (w->width << 3);
}
