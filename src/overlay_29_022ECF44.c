#include "overlay_29_022ECF44.h"
#include "dungeon.h"

extern struct dungeon *DUNGEON_PTR;

bool8 IsDungeonEndReasonFailure(void)
{
    return (s16) DUNGEON_PTR->fainted_monster_dungeon_end_reason.other < DAMAGE_SOURCE_ESCAPE;
}
