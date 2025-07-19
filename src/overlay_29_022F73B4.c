#include "overlay_29_022F73B4.h"
#include "dungeon.h"
#include "util.h"
#include "enums.h"

bool32 FloorNumberIsEven() {
    struct dungeon *dungeon = DUNGEON_PTR[0];
    if (dungeon->id == DUNGEON_LABYRINTH_CAVE && dungeon->floor == 10) return 0;
    return (dungeon->floor & 1) == 0;
}

s16 GetKecleonIdToSpawnByFloor()
{
  if (!FloorNumberIsEven()) return MONSTER_KECLEON;
  else return MONSTER_KECLEON_SECONDARY;
}
