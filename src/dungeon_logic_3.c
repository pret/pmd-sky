#include "dungeon_logic_3.h"
#include "dungeon_pokemon_attributes.h"
#include "dungeon_util_static.h"
#include "overlay_29_0233836C.h"

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

bool8 IsTypeAffectedByGravity(struct entity *entity, enum type_id type)
{
    if ((type == TYPE_FLYING) && (GravityIsActive())) {
        return FALSE;
    }
    return TRUE;
}

bool8 HasTypeAffectedByGravity(struct entity* entity, enum type_id type)
{
    struct monster* info;

    info = GetEntInfo(entity);
    if (type == TYPE_NONE)
        return FALSE;
    if (info->types[0] == type)
        return IsTypeAffectedByGravity(entity, type);
    if (info->types[1] != type)
        return FALSE;
    else
        return IsTypeAffectedByGravity(entity, type);
}
