#include "dungeon_pokemon_attributes.h"
#include "dungeon_util_static.h"
#include "overlay_29_02301A60.h"

bool8 NoGastroAcidStatus(struct entity *entity, enum ability_id ability)
{
    if (!IsMonster__02301A60(entity))
        return FALSE;

    if (GetEntInfo(entity)->curse_class_status.curse == STATUS_CURSE_GASTRO_ACID)
        return FALSE;

    return TRUE;
}

bool8 AbilityIsActive(struct entity *pokemon, enum ability_id ability)
{
    if (!IsMonster__02301A60(pokemon))
        return FALSE;

    struct monster *pokemon_info = GetEntInfo(pokemon);
    if (ability == ABILITY_UNKNOWN)
        return FALSE;

    if (pokemon_info->abilities[0] == ability)
        return NoGastroAcidStatus(pokemon, ability);

    if (pokemon_info->abilities[1] == ability)
        return NoGastroAcidStatus(pokemon, ability);

    return FALSE;
}
