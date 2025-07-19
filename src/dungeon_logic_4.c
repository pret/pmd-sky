#include "dungeon_logic_4.h"
#include "dungeon_util_static.h"
#include "overlay_29_022F7364.h"

bool8 HasLowHealth(struct entity *entity)
{
    if (!EntityIsValid__022F7364(entity))
        return FALSE;

    if (entity->type != ENTITY_MONSTER)
        return FALSE;

    struct monster *pokemon_info = GetEntInfo(entity);
    s32 max_hp = pokemon_info->max_hp_stat + pokemon_info->max_hp_boost;
    if (max_hp > 999)
        max_hp = 999;

    return pokemon_info->hp < max_hp / 4;
}
