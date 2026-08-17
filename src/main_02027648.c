#include "main_02027648.h"
#include "window.h"

s32 NewWindowScreenCheck(s32 a, s32 b)
{
    s8 i;
    Window *w;
    s32 main_count;
    s32 sub_count;

    sub_count = 0;
    main_count = 0;
    w = WINDOW_LIST;

    for (i = 0; i < 20; i++, w++) {
        if (w->is_active != 0) {
            if (w->template.bg_id == 0) {
                main_count++;
            } else {
                sub_count++;
            }
        }
    }
    if (main_count == 0) {
        _022A7A6C.field_0x8 = 1;
    }
    if (sub_count == 0) {
        _022A7A6C.field_0xA = 1;
    }
    return NewWindow(a, b);
}
