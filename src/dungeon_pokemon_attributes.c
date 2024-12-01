#include "dungeon_pokemon_attributes.h"
#include "dungeon_util.h"

extern bool8 IsMonster__02301A60(struct entity *pokemon);
extern bool8 NoGastroAcidStatus(struct entity *pokemon, enum ability_id ability);

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
