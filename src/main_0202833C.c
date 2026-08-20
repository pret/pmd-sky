#include "main_0202833C.h"
#include "window.h"

void* GetWindowContents(s32 window_id)
{
    WindowTemplate *tmpl = &WINDOW_LIST[window_id].template;

    return (void *)tmpl->unk0C;
}
