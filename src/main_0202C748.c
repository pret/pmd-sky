#include "main_0202C748.h"
#include "main_0202AAA8.h"
#include "main_02032558.h"

s32 GetWindowIdSelectedMenuItemIdx(s32 window_id)
{
    return GetSelectedMenuItemIdx(GetWindowContents(window_id) + 4);
}
