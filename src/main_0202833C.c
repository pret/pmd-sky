#include "main_0202833C.h"
#include "window.h"

void* GetWindowContents(s32 window_id)
{
    struct Window *w = &WINDOW_LIST[window_id];

    return w->field_0xC;
}
