#include "dungeon_ai_itcm.h"
#include "dg_random.h"
#include "direction.h"
#include "dungeon_action.h"
#include "dungeon_parameters.h"
#include "dungeon_pokemon_attributes.h"
#include "dungeon_pokemon_attributes_1.h"
#include "dungeon_util_static.h"

#define REGULAR_ATTACK_INDEX 4

const s16 AI_REGULAR_ATTACK_WEIGHTS[5] = { 100, 20, 30, 40, 50 };

extern struct dungeon *DUNGEON_PTR[];

extern bool8 AreMovesEnabled(enum fixed_room_id fixed_room_id);
extern bool8 MonsterCannotAttack(struct entity *pokemon, bool8 skip_sleep);
extern u32 ShouldMonsterRunAwayVariation(struct entity *monster, u32 param_2);
extern bool8 IsMonsterCornered(struct entity *monster);
extern bool8 IsChargingTwoTurnMove(struct entity *user, struct move *move);
extern void SetActionUseMoveAi(struct action_data *monster_action, s16 move_index, u8 direction);
extern void UpdateAiTargetPos(struct entity *monster);
extern void InitMove(struct move *move, enum move_id move_id);
extern u32 AiConsiderMove(struct ai_possible_move *ai_possible_move, struct entity *monster, struct move *move);
extern bool8 ov29_02338350(struct entity *monster);
extern bool8 TargetRegularAttack(struct entity *pokemon, u32 *target_dir, bool8 check_petrified);
extern void SetActionRegularAttack(struct action_data *monster_action, u8 direction);
extern void SetActionStruggle(struct action_data *monster_action, u8 direction);
extern bool8 CanAiUseMove(struct entity *monster, u32 move_index, bool8 extra_checks);
extern enum type_id GetMoveTypeForMonster(struct entity *entity, struct move *move);
extern u8 GetMoveAiWeight(struct move *move);

// https://decomp.me/scratch/zg7V6
#ifdef NONMATCHING
void ChooseAiMove(struct entity *monster)
{
    struct monster *pokemon_info = GetEntInfo(monster);

    if (!AreMovesEnabled(DUNGEON_PTR[0]->gen_info.fixed_room_id) ||
        MonsterCannotAttack(monster, FALSE) ||
        ShouldMonsterRunAwayVariation(monster, TRUE) ||
        GetEntInfo(monster)->monster_behavior == BEHAVIOR_FLEEING_OUTLAW && IsMonsterCornered(monster) ||
        IsTacticSet(monster, TACTIC_KEEP_YOUR_DISTANCE) ||
        (pokemon_info->cringe_class_status.cringe == STATUS_CRINGE_CONFUSED && DungeonRandOutcome__022EAB20(AI_CONFUSED_NO_ATTACK_CHANCE)))
        return;

    int i;
    if (pokemon_info->bide_class_status.bide != STATUS_TWO_TURN_NONE)
    {
        for (i = 0; i < MAX_MON_MOVES; i++)
        {
            struct move *move = &pokemon_info->moves.moves[i];
            if (MoveExists(move) &&
                IsChargingTwoTurnMove(monster, move) &&
                pokemon_info->bide_class_status.bide_move_slot == i)
            {
                s32 j;
                for (j = i; j > 0; j--)
                {
                    if (!(pokemon_info->moves.moves[j].flags0 & MOVE_FLAG_SUBSEQUENT_IN_LINK_CHAIN))
                        break;
                }
                SetActionUseMoveAi(&pokemon_info->action, j, pokemon_info->action.direction);
                UpdateAiTargetPos(monster);
                return;
            }
        }
    }

    struct move *moves = pokemon_info->moves.moves;
    s32 total_pp = 0;
    bool8 has_exclusive_move_user = FALSE;
    s32 num_usable_moves = 0;
    struct move *move;
    for (i = 0; i < MAX_MON_MOVES; i++)
    {
        move = &moves[i];
        if (!MoveExists(&moves[i]))
            continue;

        if (move->flags0 & MOVE_FLAG_ENABLED_FOR_AI)
            num_usable_moves++;

        total_pp += move->pp;
    }

    struct ai_possible_move ai_possible_move[MAX_MON_MOVES + 1];
    if (total_pp == 0)
    {
        struct move struggle;
        InitMove(&struggle, MOVE_STRUGGLE);
        AiConsiderMove(&ai_possible_move[0], monster, &struggle);
        if (ai_possible_move[0].can_be_used)
        {
            SetActionStruggle(&pokemon_info->action, ai_possible_move[0].direction);
            UpdateAiTargetPos(monster);
        }
        return;
    }

    s32 regular_attack_target_dir;
    bool8 has_weak_type_picker = IqSkillIsEnabled(monster, IQ_WEAK_TYPE_PICKER);
    has_exclusive_move_user = IqSkillIsEnabled(monster, IQ_EXCLUSIVE_MOVE_USER) != FALSE;
    s32 total_weight = 0;
    bool8 will_not_unlink_move[MAX_MON_MOVES];
    for (i = 0; i < MAX_MON_MOVES; i++)
    {
        will_not_unlink_move[i] = TRUE;
    }

    if (has_exclusive_move_user)
    {
        s32 min_pp = 99;
        s32 linked_move_start_index = 0;
        // Linked moves unlink if any move in the chain runs out of PP.
        // The AI avoids this by not using linked moves if any move in the chain has 1 PP left.
        // This requires a separate check from the 0-PP check used for unlinked moves.
        for (i = 0; i < MAX_MON_MOVES; i++)
        {
            moves = pokemon_info->moves.moves;
            move = &moves[i];
            if (!MoveExists(&moves[i]))
                break;

            if (i != 0 && !(move->flags0 & MOVE_FLAG_SUBSEQUENT_IN_LINK_CHAIN))
            {
                if (linked_move_start_index + 1 < i && min_pp < 2)
                {
                    for (s32 j = linked_move_start_index; j < i; j++)
                    {
                        will_not_unlink_move[j] = FALSE;
                    }
                }
                min_pp = move->pp;
                linked_move_start_index = i;
            }
            else if (move->pp >= min_pp)
                min_pp = move->pp;
        }
        if (linked_move_start_index + 1 < i && min_pp < 2)
        {
            for (s32 j = linked_move_start_index; j < i; j++)
            {
                will_not_unlink_move[j] = FALSE;
            }
        }
    }

    for (i = 0; i < MAX_MON_MOVES; i++)
    {
        ai_possible_move[i].can_be_used = FALSE;
        struct move *moves = pokemon_info->moves.moves;
        move = &moves[i];
        if (!MoveExists(move))
            continue;

        if (will_not_unlink_move[i] &&
            CanAiUseMove(monster, i, has_exclusive_move_user) &&
            move->flags0 & MOVE_FLAG_ENABLED_FOR_AI)
        {
            ai_possible_move[i].can_be_used = TRUE;
            if (pokemon_info->bide_class_status.bide == STATUS_TWO_TURN_CHARGING)
            {
                if (move->id == MOVE_CHARGE)
                {
                    ai_possible_move[i].weight = 0;
                    continue;
                }
                else if (GetMoveTypeForMonster(monster, move) == TYPE_ELECTRIC)
                    ai_possible_move[i].weight = GetMoveAiWeight(move);
                else
                    ai_possible_move[i].weight = 1;
            }
            else if (has_weak_type_picker)
                ai_possible_move[i].weight = AiConsiderMove(&ai_possible_move[i], monster, &pokemon_info->moves.moves[i]);
            else
                ai_possible_move[i].weight = GetMoveAiWeight(move);

            total_weight += ai_possible_move[i].weight;
        }
    }

    ai_possible_move[REGULAR_ATTACK_INDEX].weight = 0;
    if (!IqSkillIsEnabled(monster, IQ_EXCLUSIVE_MOVE_USER) && pokemon_info->bide_class_status.bide != STATUS_TWO_TURN_CHARGING)
    {
        ai_possible_move[REGULAR_ATTACK_INDEX].can_be_used = TRUE;
        if (pokemon_info->bide_class_status.bide == STATUS_TWO_TURN_CHARGING)
            // Never reached? Charge already skips the regular attack in the outer block.
            ai_possible_move[REGULAR_ATTACK_INDEX].weight = 1;
        else if (has_weak_type_picker)
            ai_possible_move[REGULAR_ATTACK_INDEX].weight = 2;
        else
            ai_possible_move[REGULAR_ATTACK_INDEX].weight = AI_REGULAR_ATTACK_WEIGHTS[num_usable_moves];

        total_weight += ai_possible_move[REGULAR_ATTACK_INDEX].weight;
    }

    if (has_weak_type_picker)
    {
        s32 max_weight = 0;
        total_weight = 0;
        for (i = 0; i < MAX_MON_MOVES + 1; i++)
        {
            if (!ai_possible_move[i].can_be_used)
                ai_possible_move[i].weight = 0;
            else if (max_weight < ai_possible_move[i].weight)
                max_weight = ai_possible_move[i].weight;
        }
        for (i = 0; i < MAX_MON_MOVES + 1; i++)
        {
            if (ai_possible_move[i].can_be_used)
            {
                if (max_weight != ai_possible_move[i].weight)
                    // Only the move(s) with the highest weight can be used, instead of a weighted random.
                    // This has the side effect of making the AI use a STAB ranged move consistently when at a distance.
                    ai_possible_move[i].weight = 0;

                total_weight += ai_possible_move[i].weight;
            }
        }
    }

    if (total_weight == 0)
        return;

    s32 random_weight = DungeonRandInt(total_weight);

    bool8 can_target_regular_attack;
    s32 weight_counter = 0;
    bool8 has_stall = FALSE;
    if (AbilityIsActiveVeneer(monster, ABILITY_STALL) && !ov29_02338350(monster))
    {
        has_stall = TRUE;
        can_target_regular_attack = TargetRegularAttack(monster, &regular_attack_target_dir, TRUE);
    }

    if (!has_stall)
    {
        if (!IqSkillIsEnabled(monster, IQ_EXCLUSIVE_MOVE_USER))
            can_target_regular_attack = TargetRegularAttack(monster, &regular_attack_target_dir, TRUE);
        else
        {
            can_target_regular_attack = FALSE;
            regular_attack_target_dir = DIR_DOWN;
        }
    }

    for (i = 0; i < REGULAR_ATTACK_INDEX + 1; i++)
    {
        if (ai_possible_move[i].can_be_used && ai_possible_move[i].weight != 0)
        {
            weight_counter += ai_possible_move[i].weight;
            if (weight_counter >= random_weight)
            {
                if (has_stall || i == REGULAR_ATTACK_INDEX)
                {
                    if (can_target_regular_attack)
                    {
                        SetActionRegularAttack(&pokemon_info->action, regular_attack_target_dir);
                        UpdateAiTargetPos(monster);
                    }
                    else
                        break;
                }
                else
                {
                    AiConsiderMove(&ai_possible_move[i], monster, &pokemon_info->moves.moves[i]);
                    if (ai_possible_move[i].can_be_used)
                    {
                        s32 j;
                        for (j = i; j > 0; j--)
                        {
                            if (!(pokemon_info->moves.moves[j].flags0 & MOVE_FLAG_SUBSEQUENT_IN_LINK_CHAIN))
                                break;
                        }
                        SetActionUseMoveAi(&pokemon_info->action, j, ai_possible_move[i].direction);
                        UpdateAiTargetPos(monster);
                    }
                    else
                        break;
                }
                return;
            }
        }
    }

    if (can_target_regular_attack)
    {
        SetActionRegularAttack(&pokemon_info->action, regular_attack_target_dir);
        UpdateAiTargetPos(monster);
    }
}
#endif
