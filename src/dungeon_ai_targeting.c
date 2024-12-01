#include "dungeon_ai_targeting.h"
#include "dungeon_pokemon_attributes.h"
#include "dungeon_util.h"
#include "overlay_29_023000E4.h"

extern bool8 IsTacticSet(struct entity *entity, enum tactic_id tactic);

bool8 ShouldMonsterRunAway(struct entity *pokemon)
{
    if (!EntityIsValid__023000E4(pokemon))
        return FALSE;

    struct monster *pokemon_info = GetEntInfo(pokemon);

    if (pokemon_info->terrified != 0 && pokemon_info->terrified_turns != 0)
        return TRUE;

    if (!pokemon_info->is_team_leader)
    {
        if (AbilityIsActive(pokemon, ABILITY_RUN_AWAY))
        {
            s32 max_hp = pokemon_info->max_hp_stat + pokemon_info->max_hp_boost;
            if (max_hp > 999)
                max_hp = 999;

            bool8 run_away_active = pokemon_info->hp < max_hp / 2;
            if (run_away_active)
                return TRUE;
        }

        if (IsTacticSet(pokemon, TACTIC_GET_AWAY_FROM_HERE))
            return TRUE;

        if (IsTacticSet(pokemon, TACTIC_AVOID_TROUBLE))
        {
            s32 max_hp = pokemon_info->max_hp_stat + pokemon_info->max_hp_boost;
            if (max_hp > 999)
                max_hp = 999;

            if (pokemon_info->hp <= max_hp / 2)
                return TRUE;
        }
    }
    return FALSE;
}
