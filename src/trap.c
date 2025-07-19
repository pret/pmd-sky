#include "trap.h"
#include "dungeon.h"
#include "dungeon_map_access.h"

// https://decomp.me/scratch/EcuBP
#ifdef NONMATCHING
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

    if ((tile->terrain_flags & (TERRAIN_TYPE_NORMAL | TERRAIN_TYPE_SECONDARY)) != TERRAIN_TYPE_NORMAL)
        return FALSE;

    if (tile->object != NULL)
        return tile->object->type == ENTITY_TRAP;

    return TRUE;
}
#endif
