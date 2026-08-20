#include "main_020282F4.h"
#include "window.h"

s32 sub_020282F4(s32 window_id)
{
    return WINDOW_LIST[window_id].unkB8;
}

void sub_0202830C(s32 window_id, s32 value)
{
    WINDOW_LIST[window_id].unkB8 = value;
}

u8 sub_02028324(s32 window_id)
{
    return WINDOW_LIST[window_id].template.bg_id;
}
