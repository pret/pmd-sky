#include "overlay_29_022F7364.h"
#include "dungeon.h"
#include "main_02051760.h"

bool8 EntityIsValid__022F7364(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return entity->type != ENTITY_NOTHING;
}

extern struct dungeon *DUNGEON_PTR[];
s16 DungeonGetSpriteIndex(s16 monster_id) {
    return DUNGEON_PTR[0]->sprite_indexes[monster_id];   
}

u32 JoinedAtRangeCheck2Veneer(u8 joined_at) {
    return JoinedAtRangeCheck2(joined_at);
}
