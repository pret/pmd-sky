#include "overlay_29_02318A4C.h"
#include "dungeon_util_static.h"
#include "overlay_29_02315118.h"
#include "overlay_29_02338390.h"

bool8 IsFloating(struct entity *entity)
{
    if (!EntityIsValid__02315118(entity))
        return FALSE;

    if (GravityIsActive())
        return FALSE;

    if (GetEntInfo(entity)->magnet_rise == 1)
        return TRUE;

    return FALSE;
}
