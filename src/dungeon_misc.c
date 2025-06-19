#include "dungeon_misc.h"
#include "dungeon_util.h"
#include "dungeon_util_static.h"

void UpdateAiTargetPos(struct entity *monster)
{
    struct monster *pokemon_info = GetEntInfo(monster);
    pokemon_info->target_pos.x = monster->pos.x + DIRECTIONS_XY[pokemon_info->action.direction].x;
    pokemon_info->target_pos.y = monster->pos.y + DIRECTIONS_XY[pokemon_info->action.direction].y;
}
