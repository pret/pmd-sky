#include "main_020512B0.h"
#include "dungeon.h"

extern struct dungeon_restriction DUNGEON_RESTRICTIONS[256];

s32 GetTurnLimit(enum dungeon_id dungeon_id)
{
    return DUNGEON_RESTRICTIONS[dungeon_id].turn_limit_per_floor;
}
