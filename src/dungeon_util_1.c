#include "dungeon_util_1.h"
#include "dungeon_map_access.h"

struct tile* GetTileAtEntity(struct entity *entity)
{
    return GetTileSafe(entity->pos.x, entity->pos.y);
}
