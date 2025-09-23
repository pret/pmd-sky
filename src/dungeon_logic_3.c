#include "dungeon_logic_3.h"
#include "dungeon_pokemon_attributes.h"
#include "dungeon_util_static.h"
#include "overlay_29_02338390.h"

bool8 LevitateIsActive(struct entity* entity)
{
    if (GravityIsActive())
        return FALSE;

    if (AbilityIsActive(entity, ABILITY_LEVITATE))
        return TRUE;

    return FALSE;
}

bool8 MonsterIsType(struct entity *entity, enum type_id type_id)
{
    struct monster *pokemon_info = pokemon_info = GetEntInfo(entity);
    if (type_id == TYPE_NONE)
        return FALSE;

    if (pokemon_info->types[0] == type_id)
        return TRUE;

    if (pokemon_info->types[1] == type_id)
        return TRUE;

    return FALSE;
}
