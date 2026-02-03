#include "overlay_29_022FBBEC.h"
#include "dungeon.h"
#include "dungeon_util_static.h"
#include "overlay_29_022F7364.h"

struct entity* FindMonsterWithBehavior(enum monster_behavior monster_behavior)
{
    for (s32 i = 0; i < DUNGEON_MAX_POKEMON; i++)
    {
        struct entity *entity = DUNGEON_PTR[0]->active_monster_ptrs[i];
        if (EntityIsValid__022F7364(entity) && monster_behavior == GetEntInfo(entity)->monster_behavior)
            return entity;
    }
    return NULL;
}
