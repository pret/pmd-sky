#include "overlay_29_0232B8D4.h"
#include "move_orb_effects.h"

extern const struct StatIndex SPATK_STAT_IDX;

extern void TryInflictMirrorCoatStatus(struct entity *user, struct entity *target);

bool8 DoMoveMirrorCoat(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    TryInflictMirrorCoatStatus(attacker, defender);

    return TRUE;
}

bool8 DoMoveCalmMind(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    BoostOffensiveStat(attacker, defender, SPATK_STAT_IDX, 1);
    BoostDefensiveStat(attacker, defender, SPATK_STAT_IDX, 1);

    return TRUE;
}
