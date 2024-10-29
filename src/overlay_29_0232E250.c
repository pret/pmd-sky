#include "overlay_29_0232E250.h"

extern u32 *ATK_STAT_IDX;
extern u32 *SPATK_STAT_IDX;

extern void BoostDefensiveStat(s32 param_1, s32 param_2, s32 *param_3, BOOL param_4);

u8 EntityIsValidMoveEffects__0232E250(struct entity *entity)
{
    if (entity == NULL)
    {
        return FALSE;
    }
    return entity->type != ENTITY_NOTHING;
}

BOOL DoMoveDefendOrder(s32 param_1, s32 param_2, s32 param_3, s32 param_4)
{
    BoostDefensiveStat(param_1, param_2, ATK_STAT_IDX, TRUE);
    BoostDefensiveStat(param_1, param_2, SPATK_STAT_IDX, TRUE);

    return TRUE;
}
