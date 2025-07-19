#include "trap.h"
#include "dungeon.h"
#include "dungeon_map_access.h"
#include "dungeon_util_static.h"

bool8 CanLayTrap(struct position *pos)
{
    struct tile *tile = GetTileSafe(pos->x, pos->y);
    if (tile->terrain_flags & TERRAIN_TYPE_STAIRS)
        return FALSE;

    if (tile->room == CORRIDOR_ROOM)
        return FALSE;

    if (tile->terrain_flags & TERRAIN_TYPE_NATURAL_JUNCTION)
        return FALSE;

    if (tile->terrain_flags & TERRAIN_TYPE_SHOP)
        return FALSE;

    if (GetTerrainType(tile) != TERRAIN_TYPE_NORMAL)
        return FALSE;

    if (tile->object != NULL)
        return GetEntityType(tile->object) == ENTITY_TRAP;

    return TRUE;
}
