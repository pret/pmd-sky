#include "dungeon_pokemon_attributes_1.h"
#include "dungeon_util_static.h"

bool8 IsTacticSet(struct entity *pokemon, enum tactic_id tactic_id)
{
    struct monster *pokemon_info = GetEntInfo(pokemon);
    if (pokemon_info->is_team_leader)
        return tactic_id == TACTIC_YOU_GO_THE_OTHER_WAY;

    return pokemon_info->tactic == tactic_id;
}
