#include "overlay_29_0232E734.h"
#include "move_orb_effects.h"

bool8 DoMoveRockPolish(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    BoostSpeedOneStage(attacker, defender, 0, 0);
    BoostSpeedOneStage(attacker, defender, 0, 1);

    return TRUE;
}

extern const struct StatIndex ATK_STAT_IDX;

extern const struct StatIndex SPATK_STAT_IDX;

bool8 DoMoveNastyPlot(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    BoostOffensiveStat(attacker, defender, SPATK_STAT_IDX, 2);

    return TRUE;
}

extern void TryInflictTerrifiedStatus(struct entity *user, struct entity *target);

bool8 DoMoveTag0x1AB(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    TryInflictTerrifiedStatus(attacker, defender);

    return TRUE;
}
