#include "overlay_29_023329E8.h"
#include "dungeon_util_static.h"
#include "exclusive_item.h"

bool8 ExclusiveItemEffectIsActive__023329E8(struct entity *entity, enum exclusive_item_effect_id effect_id)
{
    struct monster *monster = GetEntInfo(entity);
    if (!monster->is_not_team_member)
        return ExclusiveItemEffectFlagTest(monster->exclusive_item_effect_flags, effect_id);

    return FALSE;
}
