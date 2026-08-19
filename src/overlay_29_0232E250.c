#include "overlay_29_0232E250.h"
#include "dungeon_util_static.h"
#include "move_orb_effects.h"

extern struct StatIndex ATK_STAT_IDX;
extern struct StatIndex SPATK_STAT_IDX;

bool8 EntityIsValidMoveEffects__0232E250(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return GetEntityType(entity) != ENTITY_NOTHING;
}

bool8 DoMoveDefendOrder(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    BoostDefensiveStat(attacker, defender, ATK_STAT_IDX, 1);
    BoostDefensiveStat(attacker, defender, SPATK_STAT_IDX, 1);

    return TRUE;
}
