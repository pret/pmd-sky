#include "main_02028080.h"
#include "main_02001188.h"
#include "main_02027AF0.h"
#include "window.h"

void sub_02028080(s32 window_id, s32 value)
{
    Window *w = &WINDOW_LIST[window_id];

    w->template.unk09 = value;
    UpdateWindow(w->id);
    _020AFD4C.field_0x8 |= 1 << w->template.bg_id;
}

s32 sub_020280C0(s32 window_id, s32 flag)
{
    s32 result;

    result = sub_02027E30(window_id, 1);
    if (flag == 0) {
        return result;
    }
    _020AFD4C.field_0x8 |= 1 << WINDOW_LIST[window_id].template.bg_id;
    return result;
}

s32 sub_0202810C(s32 window_id)
{
    return sub_020280C0(window_id, 1);
}

s32 sub_0202811C(s32 window_id)
{
    return sub_02027E30(window_id, 1);
}

s32 sub_0202812C(s32 window_id)
{
    s32 result;

    if (WINDOW_LIST[window_id].is_active == 3) {
        return 1;
    }
    result = sub_02027E30(window_id, 0);
    sub_0202836C(window_id);
    _020AFD4C.field_0x8 |= 1 << WINDOW_LIST[window_id].template.bg_id;
    return result;
}

void DeleteWindow(s32 window_id)
{
    Window *w = &WINDOW_LIST[window_id];
    s32 i;
    s32 top;
    Window *p;
    u8 bg;

    sub_0202812C(window_id);
    bg = w->template.bg_id;
    top = 1;
    p = WINDOW_LIST;
    for (i = 0; i < 20; i++, p++) {
        if (p != w && p->is_active != 0 && bg == p->template.bg_id) {
            s32 end = p->template.width * p->template.height + p->base_tile;
            if (top < end) {
                top = end;
            }
        }
    }
    _022A7A74[bg] = top;
    MemFree(w->pixel_buffer);
    sub_02027974(w->id);
    w->is_active = 0;
}

void sub_0202822C(s32 window_id)
{
    Window *w = &WINDOW_LIST[window_id];

    MemFree(w->pixel_buffer);
    sub_02027974(w->id);
    w->is_active = 0;
}
