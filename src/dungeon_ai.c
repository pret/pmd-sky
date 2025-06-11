#include "dungeon_ai.h"
#include "dg_random.h"
#include "direction.h"
#include "dungeon_action.h"
#include "dungeon_ai_itcm.h"
#include "dungeon_ai_items.h"
#include "dungeon_capabilities_1.h"
#include "dungeon_pokemon_attributes.h"
#include "dungeon_pokemon_attributes_1.h"
#include "dungeon_util_static.h"
#include "dungeon_util.h"
#include "dungeon_visibility.h"
#include "overlay_29_022FB538.h"
#include "status_checks.h"
#include "targeting.h"

#ifdef JAPAN
#define CANNOT_USE_ITEM_MESSAGE 0xB2D
#define WATCHING_CAREFULLY_MESSAGE 0xB2E
#else
#define CANNOT_USE_ITEM_MESSAGE 0xDED
#define WATCHING_CAREFULLY_MESSAGE 0xDEE
#endif

extern struct dungeon *DUNGEON_PTR[];

extern void EndFrozenClassStatus(struct entity *user, struct entity *target, bool8 log);
extern void SubstitutePlaceholderStringTags(u8 *string_id, struct entity *entity, u32 param_3);
extern void LogMessageByIdWithPopupCheckUser(struct entity *user, u32 message_id);
extern bool8 GetCanMoveFlag(s16 monster_id);
extern void AiMovement(struct entity *monster, bool8 show_run_away_effect);

void RunMonsterAi(struct entity *monster, u32 unused)
{
    struct monster *pokemon_info = GetEntInfo(monster);
    if (pokemon_info->flags & MOVEMENT_FLAG_SWAPPING_PLACES_PETRIFIED_ALLY)
    {
        if (pokemon_info->frozen_class_status.freeze == STATUS_FROZEN_PETRIFIED)
            EndFrozenClassStatus(monster, monster, TRUE);
        return;
    }

    pokemon_info->decoy_ai_tracker = DECOY_AI_NONE;

    if (pokemon_info->monster_behavior <= BEHAVIOR_FIXED_ENEMY || ShouldRunMonsterAi(monster))
    {
        if (pokemon_info->monster_behavior != BEHAVIOR_RESCUE_TARGET && pokemon_info->use_held_item)
        {
            if (CheckVariousConditions(monster))
            {
                pokemon_info->use_held_item = FALSE;
                SubstitutePlaceholderStringTags(0, monster, 0);
                LogMessageByIdWithPopupCheckUser(monster, CANNOT_USE_ITEM_MESSAGE);
                return;
            }

            AiDecideUseItem(monster);

            if (pokemon_info->action.action_id != ACTION_NOTHING)
                return;
        }

        if (!HasStatusThatPreventsActing(monster))
        {
            #ifdef JAPAN
            if (DUNGEON_PTR[0]->decoy_is_active)
            {
                for (s32 i = 0; i < DUNGEON_MAX_POKEMON; i++)
                {
                    struct entity *target = DUNGEON_PTR[0]->active_monster_ptrs[i];
                    bool8 entity_is_valid;
                    if (target == NULL)
                        entity_is_valid = FALSE;
                    else
                        entity_is_valid = target->type != ENTITY_NOTHING;

                    if (entity_is_valid &&
                        GetEntInfo(target)->curse_class_status.curse == STATUS_CURSE_DECOY &&
                        CanSeeTarget(monster, target))
                    {
                        pokemon_info->decoy_ai_tracker = GetEntInfo(target)->curse_class_status.curse_applier_non_team_member_flag ? DECOY_AI_WILD : DECOY_AI_TEAM;
                        break;
                    }
                }
            }
            #else
            SetDecoyAiTracker(monster);
            #endif

            ClearMonsterActionFields(&pokemon_info->action);

            if (pokemon_info->monster_behavior == BEHAVIOR_RESCUE_TARGET)
            {
                SetActionPassTurnOrWalk(&pokemon_info->action, pokemon_info->id);
                pokemon_info->action.direction = (enum direction_id) DungeonRandInt(DIR_CURRENT);
                pokemon_info->target_pos.x = monster->pos.x;
                pokemon_info->target_pos.y = monster->pos.y - 1;
                return;
            }

            AiDecideUseItem(monster);

            if (pokemon_info->action.action_id == ACTION_NOTHING)
            {
                if (!IqSkillIsEnabled(monster, IQ_DEDICATED_TRAVELER))
                {
                    ChooseAiMove(monster);

                    if (pokemon_info->action.action_id != ACTION_NOTHING)
                        return;

                    if (pokemon_info->cringe_class_status.cringe == STATUS_CRINGE_CONFUSED)
                        SetActionPassTurnOrWalk(&pokemon_info->action, pokemon_info->id);
                    else
                    {
                        if (!GetCanMoveFlag(pokemon_info->id))
                            return;

                        AiMovement(monster, TRUE);

                        if (pokemon_info->is_not_team_member && IqSkillIsEnabled(monster, IQ_EXCLUSIVE_MOVE_USER) && pokemon_info->action.action_id <= ACTION_PASS_TURN)
                        {
                            SubstitutePlaceholderStringTags(0, monster, 0);
                            LogMessageByIdWithPopupCheckUser(monster, WATCHING_CAREFULLY_MESSAGE);
                        }
                    }
                    return;
                }

                if (pokemon_info->cringe_class_status.cringe == STATUS_CRINGE_CONFUSED)
                {
                    SetActionPassTurnOrWalk(&pokemon_info->action, pokemon_info->id);
                    return;
                }

                if (GetCanMoveFlag(pokemon_info->id))
                    AiMovement(monster, TRUE);

                if (pokemon_info->action.action_id != ACTION_NOTHING && pokemon_info->action.action_id != ACTION_PASS_TURN)
                    return;

                ChooseAiMove(monster);

                if (GetCanMoveFlag(pokemon_info->id) &&
                    pokemon_info->is_not_team_member &&
                    IqSkillIsEnabled(monster, IQ_EXCLUSIVE_MOVE_USER) &&
                    pokemon_info->action.action_id <= ACTION_PASS_TURN)
                {
                    SubstitutePlaceholderStringTags(0, monster, 0);
                    LogMessageByIdWithPopupCheckUser(monster, WATCHING_CAREFULLY_MESSAGE);
                }

                if (pokemon_info->action.action_id != ACTION_NOTHING && pokemon_info->action.action_id != ACTION_PASS_TURN)
                {
                    pokemon_info->ai_not_next_to_target = FALSE;
                    pokemon_info->ai_ally_skip = FALSE;
                    pokemon_info->waiting = FALSE;
                }
            }
        }
    }
}
