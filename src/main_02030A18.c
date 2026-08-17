#include "main_02030A18.h"
#include "main_0202AAA8.h"
#include "main_02032558.h"

s32 GetWindowIdPageStart(s32 window_id)
{
    return GetPageStart(GetWindowContents(window_id) + 4);
}
