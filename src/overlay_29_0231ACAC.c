#include "overlay_29_0231ACAC.h"
#include "dungeon_logic_3.h"
#include "item.h"
#include "main_02013C04.h"
#include "move_data.h"
#include "moves_2.h"

bool8 ExclusiveItemEffectIsActive__0231A87C(struct entity *entity, enum exclusive_item_effect_id effect_id);

u32 GetEntityMoveTargetAndRange(struct entity *entity, struct move *move, bool8 is_ai)
{
    if (move->id == MOVE_CURSE && !is_ai && !MonsterIsType(entity, TYPE_GHOST))
        return TARGET_USER | RANGE_USER;

    s16 move_target_and_range = GetMoveTargetAndRange(move, is_ai);

    if (IsMoveRangeStringUser(move) && ExclusiveItemEffectIsActive__0231A87C(entity, EXCLUSIVE_EFF_EXTEND_SELF_EFFECTS_TO_TEAM))
    {
        if (move_target_and_range == (TARGET_USER | RANGE_USER | AI_CONDITION_HP_25))
            move_target_and_range = TARGET_PARTY | RANGE_FLOOR | AI_CONDITION_HP_25;
        else if (move_target_and_range == (TARGET_USER | RANGE_USER))
            move_target_and_range = TARGET_PARTY | RANGE_FLOOR;
    }

    return move_target_and_range;
}
