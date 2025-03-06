#include "overlay_29_0232E250.h"

extern s32 ATK_STAT_IDX;
extern s32 SPATK_STAT_IDX;

extern void BoostDefensiveStat(struct entity* user, struct entity* target, s32 stat_idx, s16 n_stages);

bool8 EntityIsValidMoveEffects__0232E250(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return entity->type != ENTITY_NOTHING;
}

bool8 DoMoveDefendOrder(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    BoostDefensiveStat(attacker, defender, ATK_STAT_IDX, 1);
    BoostDefensiveStat(attacker, defender, SPATK_STAT_IDX, 1);

    return TRUE;
}
