#include "overlay_29_0230F810.h"
#include "dungeon.h"
#include "dungeon_ai_items_1.h"
#include "overlay_29_0230F8AC.h"

extern struct dungeon *DUNGEON_PTR[];
#include "dungeon_items.h"
#include "dungeon_pokemon_attributes.h"

bool8 ItemIsActive__0230F810(struct entity *entity, enum item_id item_id)
{
    if (AbilityIsActiveVeneer(entity, ABILITY_KLUTZ))
        return FALSE;

    return HasHeldItem(entity, item_id);
}

bool8 TeamMemberHasExclusiveItemEffectActive(enum exclusive_item_effect_id effect_id)
{
    s16 i;

    for (i = 0; i < 4; i++) {
        struct entity *member = DUNGEON_PTR[0]->monster_slot_ptrs[i];

        if (EntityIsValid__0230F008(member)
            && ExclusiveItemEffectIsActive__0230F8AC(member, effect_id)) {
            return TRUE;
        }
    }

    return FALSE;
}
