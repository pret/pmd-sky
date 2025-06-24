#include "overlay_29_022FFF28.h"
#include "dungeon_util_static.h"

extern bool8 ExclusiveItemEffectFlagTest(u32 *effect_flags, enum exclusive_item_effect_id effect_id);

bool8 ExclusiveItemEffectIsActive__022FFF28(struct entity *entity, enum exclusive_item_effect_id effect_id)
{
    struct monster *monster = GetEntInfo(entity);
    if (!monster->is_not_team_member)
        return ExclusiveItemEffectFlagTest(monster->exclusive_item_effect_flags, effect_id);

    return FALSE;
}
