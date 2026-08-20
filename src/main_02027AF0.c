#include "main_02027AF0.h"
#include "window.h"

extern void* memset(void *s, s32 c, u32 n);

void UpdateWindow(s32 window_id)
{
    Window *w = &WINDOW_LIST[window_id];

    w->active_transfer_src = w->pixel_buffer;
    w->active_vram_dest = w->vram_base;
    w->active_transfer_len = w->transfer_length;
}

void sub_02027B1C(s32 window_id)
{
    memset(WINDOW_LIST[window_id].pixel_buffer, 0,
           WINDOW_LIST[window_id].transfer_length);
    UpdateWindow(window_id);
}

void ClearWindow(s32 window_id)
{
    memset(WINDOW_LIST[window_id].pixel_buffer, 0,
           WINDOW_LIST[window_id].transfer_length);
}
