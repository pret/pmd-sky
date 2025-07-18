#include "overlay_29_023197A8.h"
#include "dg_random.h"
#include "dungeon_parameters_1.h"
#include "dungeon_util_static.h"
#include "exclusive_item.h"
#include "move_effects.h"
#include "overlay_29_02318E4C.h"

u8 MirrorMoveIsActive(struct entity *entity)
{
    if (EntityIsValid__02318E4C(entity))
    {
        if (GetEntInfo(entity)->reflect_class_status.reflect == STATUS_REFLECT_MIRROR_MOVE)
            return EFFECT_ACTIVE_FROM_STATUS;

        if (ExclusiveItemEffectIsActive__023197A8(entity, EXCLUSIVE_EFF_MAY_BOUNCE_MOVES) && DungeonRandOutcome__022EAB20(CHATOT_SCARF_BOUNCE_CHANCE))
            return EFFECT_ACTIVE_FROM_EXCLUSIVE_ITEM;
    }

    return EFFECT_INACTIVE;
}

bool8 ExclusiveItemEffectIsActive__023197A8(struct entity *entity, enum exclusive_item_effect_id effect_id)
{
    struct monster *monster = GetEntInfo(entity);
    if (!monster->is_not_team_member)
        return ExclusiveItemEffectFlagTest(monster->exclusive_item_effect_flags, effect_id);

    return FALSE;
}
