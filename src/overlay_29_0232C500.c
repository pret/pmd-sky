#include "overlay_29_0232C500.h"

extern void TrySwitchPlace(struct entity *user, struct entity *target, s32 a);

extern void SetReflectStatus(struct entity *user, struct entity *target, s32 status);
#include "dungeon_util_static.h"

bool8 EntityIsValidMoveEffects__0232C500(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return GetEntityType(entity) != ENTITY_NOTHING;
}

bool8 DoMoveRebound(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    SetReflectStatus(attacker, defender, 10);

    return TRUE;
}

bool8 DoMoveSwitchPositions(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    struct monster *info = GetEntInfo(attacker);

    if (info->exp_yield < 1) {
        info->exp_yield = 1;
    }

    TrySwitchPlace(attacker, defender, TRUE);

    return TRUE;
}
