#include "overlay_29_02340CAC.h"
#include "dungeon.h"

bool8 PosIsOutOfBounds(s32 x, s32 y)
{
    if (x < 0)
        return TRUE;
    if (y < 0)
        return TRUE;
    if (DUNGEON_MAX_SIZE_X <= x)
        return TRUE;
    if (DUNGEON_MAX_SIZE_Y <= y)
        return TRUE;
    return FALSE;
}
