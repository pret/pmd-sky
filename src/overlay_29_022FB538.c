#include "overlay_29_022FB538.h"
#include "dungeon.h"
#include "dungeon_util_static.h"
#include "dungeon_visibility.h"
#include "overlay_29_022F7364.h"
#include "targeting.h"

extern struct dungeon *DUNGEON_PTR[];

#ifndef JAPAN
void SetDecoyAiTracker(struct entity* entity)
{
    if (!EntityIsValid__022F7364(entity))
        return;

    struct monster *pokemon_info = GetEntInfo(entity);
    pokemon_info->decoy_ai_tracker = DECOY_AI_NONE;

    if (!DUNGEON_PTR[0]->decoy_is_active)
        return;

    for (s32 i = 0; i < DUNGEON_MAX_POKEMON; i++)
    {
        struct entity *target = DUNGEON_PTR[0]->active_monster_ptrs[i];
        if (EntityIsValid__022F7364(target) &&
            target != entity &&
            GetEntInfo(target)->curse_class_status.curse == STATUS_CURSE_DECOY &&
            CanSeeTarget(entity, target))
        {
            pokemon_info->decoy_ai_tracker = GetEntInfo(target)->curse_class_status.curse_applier_non_team_member_flag ? DECOY_AI_WILD : DECOY_AI_TEAM;
            break;
        }
    }
}
#endif
