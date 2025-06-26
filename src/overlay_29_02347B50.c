#include "overlay_29_02347B50.h"
#include "dungeon_items.h"
#include "dungeon_pokemon_attributes.h"
#include "dungeon_util_static.h"
#include "exclusive_item.h"

bool8 ItemIsActive__02347B50(struct entity *entity, enum item_id item_id)
{
    if (AbilityIsActiveVeneer(entity, ABILITY_KLUTZ))
        return FALSE;

    return HasHeldItem(entity, item_id);
}

bool8 ExclusiveItemEffectIsActive__02347B80(struct entity *entity, enum exclusive_item_effect_id effect_id)
{
    struct monster *monster = GetEntInfo(entity);
    if (!monster->is_not_team_member)
        return ExclusiveItemEffectFlagTest(monster->exclusive_item_effect_flags, effect_id);

    return FALSE;
}
