#include "overlay_29_0230A994.h"
#include "dungeon_util_static.h"
#include "exclusive_item.h"

bool8 IsMonster__0230A994(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return GetEntityType(entity) == ENTITY_MONSTER;
}

bool8 ExclusiveItemEffectIsActive__0230A9B8(struct entity *entity, enum exclusive_item_effect_id effect_id)
{
    struct monster *monster = GetEntInfo(entity);
    if (!monster->is_not_team_member)
        return ExclusiveItemEffectFlagTest(monster->exclusive_item_effect_flags, effect_id);

    return FALSE;
}
