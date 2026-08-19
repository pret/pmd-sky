#include "overlay_29_02326E80.h"

extern struct StatIndex ATK_STAT_IDX;

extern struct StatIndex SPATK_STAT_IDX;
#include "move_orb_effects.h"

bool8 DoMoveBoostDefense1(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    BoostDefensiveStat(attacker, defender, ATK_STAT_IDX, 1);

    return TRUE;
}

bool8 DoMoveParalyze__02326E80(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    TryInflictParalysisStatus(attacker, defender, TRUE, FALSE);

    return TRUE;
}

bool8 DoMoveBoostAttack1(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    BoostOffensiveStat(attacker, defender, ATK_STAT_IDX, 1);

    return TRUE;
}
