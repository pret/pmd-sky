#include "main_02028284.h"
#include "window.h"

void sub_0202825C(s32 index, u16 value)
{
    _022A7A74[index] = value;
}

u16 sub_02028270(s32 index)
{
    return _022A7A74[index];
}

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

void sub_020282C8(s32 window_id, Point* out)
{
    WindowTemplate *tmpl = &WINDOW_LIST[window_id].template;

    out->y = tmpl->height << 3;
    out->x = tmpl->width << 3;
}
