#include "overlay_29_0232B7C0.h"

extern void TryInflictDecoyStatus(struct entity *user, struct entity *target, s32 a, s32 b, s32 c);
#include "move_orb_effects.h"

extern struct StatIndex ATK_STAT_IDX;

extern struct StatIndex SPATK_STAT_IDX;

extern void TryInflictMagicCoatStatus(struct entity *user, struct entity *target);
extern void TryInflictProtectStatus(struct entity *user, struct entity *target);

bool8 DoMoveMagicCoat(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    TryInflictMagicCoatStatus(attacker, defender);

    return TRUE;
}

bool8 DoMoveProtect(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    TryInflictProtectStatus(attacker, defender);

    return TRUE;
}

bool8 DoMoveDefenseCurl(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    BoostDefensiveStat(attacker, defender, ATK_STAT_IDX, 1);

    return TRUE;
}

bool8 DoMoveDecoy(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    TryInflictDecoyStatus(attacker, defender, 1, 1, 0);

    return TRUE;
}
