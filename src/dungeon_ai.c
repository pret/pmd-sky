#include "dungeon_ai.h"
#include "dungeon_util.h"

#ifdef JAPAN
#define CANNOT_USE_ITEM_MESSAGE 0xB2D
#define WATCHING_CAREFULLY_MESSAGE 0xB2E
#else
#define CANNOT_USE_ITEM_MESSAGE 0xDED
#define WATCHING_CAREFULLY_MESSAGE 0xDEE
#endif

extern struct dungeon *DUNGEON_PTR[];

extern void EndFrozenClassStatus(struct entity *pokemon, struct entity *target, bool8 log);
extern bool8 ShouldRunMonsterAi(struct entity *pokemon);
extern bool8 CheckVariousConditions(struct entity *pokemon);
extern void SubstitutePlaceholderStringTags(u8 *buffer, struct entity *entity, u32 param_3);
extern void LogMessageByIdWithPopupCheckUser(struct entity *pokemon, u32 message_id);
extern void AiDecideUseItem(struct entity *pokemon);
extern bool8 HasStatusThatPreventsActing(struct entity *pokemon);
extern void ClearMonsterActionFields(struct action_data *action_pointer);
extern void SetActionPassTurnOrWalk(struct action_data *action_pointer, s16 species);
extern u32 DungeonRandInt(u32 cap);
extern bool8 IqSkillIsEnabled(struct entity *pokemon, enum iq_skill_id iq_skill);
extern void ChooseAiMove(struct entity *pokemon);
extern bool8 GetCanMoveFlag(s16 index);
extern void AiMovement(struct entity *pokemon, bool8 show_run_away_effect);
extern void SetDecoyAiTracker(struct entity* entity);
extern bool8 CanSeeTarget(struct entity *entity, struct entity *target_entity);

void RunMonsterAi(struct entity *pokemon, u32 unused)
{
    struct monster *pokemon_info = GetEntInfo(pokemon);
    if (pokemon_info->flags & MOVEMENT_FLAG_SWAPPING_PLACES_PETRIFIED_ALLY)
    {
        if (pokemon_info->frozen_class_status.freeze == STATUS_INDEX_PETRIFIED)
        {
            EndFrozenClassStatus(pokemon, pokemon, TRUE);
        }
        return;
    }
    pokemon_info->decoy_ai_tracker = DECOY_AI_NONE;
    if (pokemon_info->monster_behavior <= BEHAVIOR_FIXED_ENEMY || ShouldRunMonsterAi(pokemon))
    {
        if (pokemon_info->monster_behavior != BEHAVIOR_RESCUE_TARGET && pokemon_info->use_held_item)
        {
            if (CheckVariousConditions(pokemon))
            {
                pokemon_info->use_held_item = FALSE;
                SubstitutePlaceholderStringTags(0, pokemon, 0);
                LogMessageByIdWithPopupCheckUser(pokemon, CANNOT_USE_ITEM_MESSAGE);
                return;
            }
            AiDecideUseItem(pokemon);
            if (pokemon_info->action.action_id != ACTION_NOTHING)
            {
                return;
            }
        }
        if (!HasStatusThatPreventsActing(pokemon))
        {
            #ifdef JAPAN
            if (DUNGEON_PTR[0]->decoy_is_active)
            {
                for (s32 i = 0; i < DUNGEON_MAX_POKEMON; i++)
                {
                    struct entity *target = DUNGEON_PTR[0]->active_monster_ptrs[i];
                    bool8 entity_is_valid;
                    if (target == NULL)
                    {
                        entity_is_valid = FALSE;
                    }
                    else
                    {
                        entity_is_valid = target->type != ENTITY_NOTHING;
                    }
                    if (entity_is_valid &&
                        GetEntInfo(target)->curse_class_status.curse == STATUS_INDEX_DECOY &&
                        CanSeeTarget(pokemon, target))
                    {
                        pokemon_info->decoy_ai_tracker = GetEntInfo(target)->curse_class_status.curse_applier_non_team_member_flag ? DECOY_AI_WILD : DECOY_AI_TEAM;
                        break;
                    }
                }
            }
            #else
            SetDecoyAiTracker(pokemon);
            #endif
            ClearMonsterActionFields(&pokemon_info->action);
            if (pokemon_info->monster_behavior == BEHAVIOR_RESCUE_TARGET)
            {
                SetActionPassTurnOrWalk(&pokemon_info->action, pokemon_info->id);
                pokemon_info->action.direction = (enum direction_id) DungeonRandInt(DIR_CURRENT);
                pokemon_info->target_pos.x = pokemon->pos.x;
                pokemon_info->target_pos.y = pokemon->pos.y - 1;
                return;
            }
            AiDecideUseItem(pokemon);
            if (pokemon_info->action.action_id == ACTION_NOTHING)
            {
                if (!IqSkillIsEnabled(pokemon, IQ_DEDICATED_TRAVELER))
                {
                    ChooseAiMove(pokemon);
                    if (pokemon_info->action.action_id != ACTION_NOTHING)
                    {
                        return;
                    }
                    if (pokemon_info->cringe_class_status.cringe == STATUS_INDEX_CONFUSED)
                    {
                        SetActionPassTurnOrWalk(&pokemon_info->action, pokemon_info->id);
                    }
                    else
                    {
                        if (!GetCanMoveFlag(pokemon_info->id))
                        {
                            return;
                        }
                        AiMovement(pokemon, TRUE);
                        if (pokemon_info->is_not_team_member && IqSkillIsEnabled(pokemon, IQ_EXCLUSIVE_MOVE_USER) && pokemon_info->action.action_id <= ACTION_PASS_TURN)
                        {
                            SubstitutePlaceholderStringTags(0, pokemon, 0);
                            LogMessageByIdWithPopupCheckUser(pokemon, WATCHING_CAREFULLY_MESSAGE);
                        }
                    }
                    return;
                }
                if (pokemon_info->cringe_class_status.cringe == STATUS_INDEX_CONFUSED)
                {
                    SetActionPassTurnOrWalk(&pokemon_info->action, pokemon_info->id);
                    return;
                }
                if (GetCanMoveFlag(pokemon_info->id))
                {
                    AiMovement(pokemon, TRUE);
                }
                if (pokemon_info->action.action_id != ACTION_NOTHING && pokemon_info->action.action_id != ACTION_PASS_TURN)
                {
                    return;
                }
                ChooseAiMove(pokemon);
                if (GetCanMoveFlag(pokemon_info->id) &&
                    pokemon_info->is_not_team_member &&
                    IqSkillIsEnabled(pokemon, IQ_EXCLUSIVE_MOVE_USER) &&
                    pokemon_info->action.action_id <= ACTION_PASS_TURN)
                {
                    SubstitutePlaceholderStringTags(0, pokemon, 0);
                    LogMessageByIdWithPopupCheckUser(pokemon, WATCHING_CAREFULLY_MESSAGE);
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
