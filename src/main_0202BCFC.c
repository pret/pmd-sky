#include "main_0202BCFC.h"
#include "main_0202AAA8.h"
#include "main_02032558.h"

s32 GetAdvancedMenuCurrentOption(s32 window_id)
{
    return GetSelectedMenuItemIdx(GetWindowContents(window_id) + 4);
}
