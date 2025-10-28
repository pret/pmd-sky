#include "dungeon_logic_8.h"
#include "dungeon_mobility.h"
#include "dungeon_util_static.h"
#include "overlay_29_022FF898.h"

bool8 CanMoveThroughWalls(struct entity *monster)
{
    struct monster *pokemon_info = GetEntInfo(monster);
    if (pokemon_info->invisible_class_status.status == STATUS_INVISIBLE_MOBILE)
        return TRUE;

    if (ItemIsActive__022FF898(monster, ITEM_MOBILE_SCARF))
        return TRUE;

    if (GetMobilityTypeCheckSlipAndFloating(monster, pokemon_info->id) == MOBILITY_INTANGIBLE)
        return TRUE;

    return FALSE;
}
