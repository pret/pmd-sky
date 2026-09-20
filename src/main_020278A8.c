#include "main_020278A8.h"
#include "window.h"

extern u8 *_020AFC70;

u16* GetPaletteBaseAddress__020278A8(s32 a, s32 b)
{
    return &(*(u16 **)(_020AFC70 + 0xE0))[(a << 8) + b];
}

void sub_020278C4(s32 window_id)
{
    s8 cur;
    s8 prev;
    s8 prio;
    s8 head;

    prev = -2;
#ifdef JAPAN
    head = (s8)_022A7A6C.field_0x0[1];
#else
    head = (s8)_022A7A6C.field_0x0[3];
#endif
    prio = (s8)WINDOW_LIST[window_id].unkB4;
    cur = head;

    if (head == -2) {
#ifdef JAPAN
        _022A7A6C.field_0x0[1] = window_id;
#else
        _022A7A6C.field_0x0[3] = window_id;
#endif
        WINDOW_LIST[window_id].next_window_id = head;
        return;
    }

    while (cur != -2) {
        if ((s8)WINDOW_LIST[cur].unkB4 < prio) {
            break;
        }
        prev = cur;
        cur = WINDOW_LIST[cur].next_window_id;
    }

    if (prev == -2) {
#ifdef JAPAN
        WINDOW_LIST[window_id].next_window_id = (s8)_022A7A6C.field_0x0[1];
        _022A7A6C.field_0x0[1] = window_id;
#else
        WINDOW_LIST[window_id].next_window_id = (s8)_022A7A6C.field_0x0[3];
        _022A7A6C.field_0x0[3] = window_id;
#endif
        return;
    }

    cur = WINDOW_LIST[prev].next_window_id;
    WINDOW_LIST[prev].next_window_id = window_id;
    WINDOW_LIST[window_id].next_window_id = cur;
}

void sub_02027974(s32 window_id)
{
    s8 cur;
    s8 prev;

    prev = -2;
#ifdef JAPAN
    cur = (s8)_022A7A6C.field_0x0[1];
#else
    cur = (s8)_022A7A6C.field_0x0[3];
#endif

    while (cur != -2) {
        if (window_id == WINDOW_LIST[cur].id) {
            break;
        }
        prev = cur;
        cur = WINDOW_LIST[cur].next_window_id;
    }

    if (prev == -2) {
#ifdef JAPAN
        _022A7A6C.field_0x0[1] = WINDOW_LIST[window_id].next_window_id;
#else
        _022A7A6C.field_0x0[3] = WINDOW_LIST[window_id].next_window_id;
#endif
        WINDOW_LIST[window_id].next_window_id = -2;
    }
    else {
        WINDOW_LIST[prev].next_window_id = WINDOW_LIST[cur].next_window_id;
        WINDOW_LIST[cur].next_window_id = -2;
    }
}
