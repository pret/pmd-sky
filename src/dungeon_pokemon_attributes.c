#include "dungeon_pokemon_attributes.h"
#include "dungeon_util_static.h"
#include "overlay_29_02301A60.h"

bool8 NoGastroAcidStatus(struct entity *entity, enum ability_id ability_id)
{
    if (!IsMonster__02301A60(entity))
        return FALSE;

    if (GetEntInfo(entity)->curse_class_status.curse == STATUS_CURSE_GASTRO_ACID)
        return FALSE;

    return TRUE;
}

bool8 AbilityIsActive(struct entity *entity, enum ability_id ability_id)
{
    if (!IsMonster__02301A60(entity))
        return FALSE;

    struct monster *pokemon_info = GetEntInfo(entity);
    if (ability_id == ABILITY_UNKNOWN)
        return FALSE;

    if (pokemon_info->abilities[0] == ability_id)
        return NoGastroAcidStatus(entity, ability_id);

    if (pokemon_info->abilities[1] == ability_id)
        return NoGastroAcidStatus(entity, ability_id);

    return FALSE;
}

bool8 AbilityIsActiveVeneer(struct entity *entity, enum ability_id ability_id)
{
    return AbilityIsActive(entity, ability_id);
}
