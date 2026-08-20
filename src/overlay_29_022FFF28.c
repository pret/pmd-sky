#include "overlay_29_022FFF28.h"

extern s32 CalcSpeedStage(struct entity *entity, s32 a);
#include "dungeon_util_static.h"
#include "exclusive_item.h"

bool8 ExclusiveItemEffectIsActive__022FFF28(struct entity *entity, enum exclusive_item_effect_id effect_id)
{
    struct monster *monster = GetEntInfo(entity);
    if (!monster->is_not_team_member)
        return ExclusiveItemEffectFlagTest(monster->exclusive_item_effect_flags, effect_id);

    return FALSE;
}

s32 CalcSpeedStageWrapper(struct entity *entity)
{
    return CalcSpeedStage(entity, TRUE);
}
