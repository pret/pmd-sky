#include "main_02028284.h"
#include "window.h"

void GetWindowRectangle(s32 window_id, struct unk_02028284* out)
{
    WindowTemplate *tmpl = &WINDOW_LIST[window_id].template;
    s32 top = tmpl->y << 3;
    s32 left;

    out->field_0x0 = top;
    out->field_0x4 = top + (tmpl->height << 3);
    left = tmpl->x << 3;
    out->field_0x8 = left;
    out->field_0xC = left + (tmpl->width << 3);
}
