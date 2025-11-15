#include "dungeon_util_2.h"
#include "dungeon_pokemon_attributes_1.h"
#include "dungeon_range.h"

bool8 CanTargetPosition(struct entity *monster, struct position *position)
{
    return IsPositionInSight(&monster->pos, position, HasDropeyeStatus(monster));
}
