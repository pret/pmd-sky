#include "main_020275F8.h"
#include "window.h"

struct Window* GetWindow(s32 window_id)
{
    return &WINDOW_LIST[window_id];
}
