#include "type_effectiveness.h"
#include "dungeon_util_static.h"
#include "overlay_29_0230A994.h"
#include "overlay_29_02318A4C.h"
#include "overlay_29_02338390.h"
#include "type_matchup_table.h"

s16 GetTypeMatchup(struct entity *attacker, struct entity *defender, s16 target_type_idx, enum type_id attack_type)
{
    struct monster *defender_monster = GetEntInfo(defender);
    if ((defender_monster->miracle_eye == 1 || ExclusiveItemEffectIsActive__0230A9B8(attacker, EXCLUSIVE_EFF_MIRACLE_EYE)) && attack_type == TYPE_PSYCHIC && defender_monster->types[target_type_idx] == TYPE_DARK)
        return MATCHUP_NEUTRAL;

    if (attack_type == TYPE_GROUND)
    {
        if (GravityIsActive())
        {
            if (defender_monster->types[target_type_idx] == TYPE_FLYING)
                return MATCHUP_NEUTRAL;
        }
        else if (IsFloating(defender))
            return MATCHUP_IMMUNE;
    }

    return TYPE_MATCHUP_TABLE.matchups[attack_type][defender_monster->types[target_type_idx]];
}
