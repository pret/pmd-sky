#include "overlay_29_0231B194.h"
#include "dungeon_util_static.h"
#include "dungeon_capabilities.h"
#include "dungeon_visibility.h"
#include "overlay_29_0231B318.h"
#include "overlay_29_0234B024.h"

extern struct dungeon *DUNGEON_PTR;
extern const s16 ov10_022C4530;
extern void ApplyDamageAndEffectsWrapper(struct entity *entity, s32 damage, s32 a, s32 b);
extern bool8 TryEndPetrifiedOrSleepStatus(struct entity *user, struct entity *target);

bool8 EntityIsValid__0231B194(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return GetEntityType(entity) != ENTITY_NOTHING;
}

void TryActivateBadDreams(struct entity *attacker)
{
    struct entity *targets[DUNGEON_MAX_POKEMON];
    s16 num_targets;
    s16 i;
    struct entity *target;
    bool8 attacker_is_team_member;

    num_targets = 0;
    attacker_is_team_member = GetEntInfo(attacker)->is_not_team_member == 0;

    for (i = 0; i < DUNGEON_MAX_POKEMON; i++) {
        target = DUNGEON_PTR->active_monster_ptrs[i];
        if (!IsMonster__0231B318(target))
            continue;
        if (attacker_is_team_member) {
            if (!GetEntInfo(target)->is_not_team_member)
                continue;
        } else {
            if (GetEntInfo(target)->is_not_team_member)
                continue;
        }
        targets[num_targets++] = target;
    }

    SetPreprocessorArgsIdVal(2, ABILITY_BAD_DREAMS);

    for (i = 0; i < num_targets; i++) {
        target = targets[i];
        if (target != NULL && IsMonster__0231B318(target) &&
            IsValidTargetEntity(attacker, target) && attacker != target &&
            IsMonsterSleeping(target)) {
            ApplyDamageAndEffectsWrapper(target, ov10_022C4530, 0x18,
                                         DAMAGE_SOURCE_BAD_DREAMS);
            if (EntityIsValid__0231B194(target))
                TryEndPetrifiedOrSleepStatus(attacker, target);
        }
    }
}
