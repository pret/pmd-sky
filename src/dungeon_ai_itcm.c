#include "dungeon_ai_itcm.h"
#include "dg_random.h"
#include "direction.h"
#include "dungeon_action.h"
#include "dungeon_action_helper.h"
#include "dungeon_ai_attack.h"
#include "dungeon_ai_parameters.h"
#include "dungeon_ai_targeting.h"
#include "dungeon_capabilities_3.h"
#include "dungeon_capabilities_4.h"
#include "dungeon_logic_5.h"
#include "dungeon_misc.h"
#include "dungeon_mode.h"
#include "dungeon_move.h"
#include "dungeon_parameters.h"
#include "dungeon_pokemon_attributes.h"
#include "dungeon_pokemon_attributes_1.h"
#include "dungeon_util_static.h"
#include "fixed_room_data.h"
#include "moves_1.h"

#define REGULAR_ATTACK_INDEX 4

extern bool8 ov29_02338350(struct entity *monster);
extern bool8 TargetRegularAttack(struct entity *pokemon, u32 *target_dir, bool8 skip_petrified);
extern void SetActionRegularAttack(struct action_data *monster_action, u8 direction);
extern void SetActionStruggle(struct action_data *monster_action, u8 direction);
extern bool8 CanAiUseMove(struct entity *monster, u32 move_index, bool8 extra_checks);
extern u8 GetMoveAiWeight(struct move *move);

#ifdef SDK_ARM9
#include <nitro/itcm_begin.h>
#endif //SDK_ARM9

// https://decomp.me/scratch/zg7V6
#ifdef NONMATCHING
void ChooseAiMove(struct entity *monster)
{
    struct monster *pokemon_info = GetEntInfo(monster);

    if (!AreMovesEnabled(DUNGEON_PTR[0]->gen_info.fixed_room_id) ||
        MonsterCannotAttack(monster, FALSE) ||
        ShouldMonsterRunAwayAndShowEffect(monster, TRUE) ||
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
#else
asm void ChooseAiMove(struct entity *monster)
{
#ifdef JAPAN
#define CHOOSE_AI_MOVE_OFFSET -4
#else
#define CHOOSE_AI_MOVE_OFFSET 0
#endif
	stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
	sub sp, sp, #0x44
	ldr r1, =DUNGEON_PTR
	mov r10, r0
	ldr r0, [r1]
	ldr r7, [r10, #0xb4]
	add r0, r0, #0x4000
#ifdef JAPAN
	ldrb r0, [r0, #0x36]
#else
	ldrb r0, [r0, #0xda]
#endif
	bl AreMovesEnabled
	cmp r0, #0
	beq _01FFBD0C
	mov r0, r10
	mov r1, #0
	bl MonsterCannotAttack
	cmp r0, #0
	bne _01FFBD0C
	mov r0, r10
	mov r1, #1
	bl ShouldMonsterRunAwayAndShowEffect
	cmp r0, #0
	bne _01FFBD0C
	ldr r0, [r10, #0xb4]
	ldrb r0, [r0, #0xbc]
	cmp r0, #3
	bne _01FFB6CC
	mov r0, r10
	bl IsMonsterCornered
	cmp r0, #0
	bne _01FFBD0C
_01FFB6CC:
	mov r0, r10
	mov r1, #8
	bl IsTacticSet
	cmp r0, #0
	bne _01FFBD0C
	ldrb r0, [r7, #0xd0]
	cmp r0, #2
	bne _01FFB700
	ldr r0, =AI_CONFUSED_NO_ATTACK_CHANCE
	ldrsh r0, [r0]
	bl DungeonRandOutcome__022EAB20
	cmp r0, #0
	bne _01FFBD0C
_01FFB700:
	ldrb r0, [r7, #0xd2]
	cmp r0, #0
	beq _01FFB7A8
	mov r8, #0
	add r6, r7, #0x124 + CHOOSE_AI_MOVE_OFFSET
	mov r4, r8
	mov r5, #1
	b _01FFB7A0
_01FFB720:
	ldrb r0, [r6, r8, lsl #3]
	mov r1, r8, lsl #3
	tst r0, #1
	movne r0, r5
	moveq r0, r4
	tst r0, #0xff
	beq _01FFB79C
	mov r0, r10
	add r1, r6, r1
	bl IsChargingTwoTurnMove
	cmp r0, #0
	beq _01FFB79C
	ldrb r0, [r7, #0xd4]
	cmp r0, r8
	bne _01FFB79C
	b _01FFB774
_01FFB760:
	add r0, r7, r8, lsl #3
	ldrb r0, [r0, #0x124 + CHOOSE_AI_MOVE_OFFSET]
	tst r0, #2
	beq _01FFB77C
	sub r8, r8, #1
_01FFB774:
	cmp r8, #0
	bgt _01FFB760
_01FFB77C:
	ldrb r2, [r7, #0x4c]
	mov r1, r8, lsl #0x10
	add r0, r7, #0x4a
	mov r1, r1, asr #0x10
	bl SetActionUseMoveAi
	mov r0, r10
	bl UpdateAiTargetPos
	b _01FFBD0C
_01FFB79C:
	add r8, r8, #1
_01FFB7A0:
	cmp r8, #4
	blt _01FFB720
_01FFB7A8:
	mov r5, #0
	str r5, [sp]
	mov r0, r5
	add r4, r7, #0x124 + CHOOSE_AI_MOVE_OFFSET
	mov r2, r5
	mov r3, #1
_01FFB7C0:
	ldrb r1, [r4, r0, lsl #3]
	add r6, r4, r0, lsl #3
	tst r1, #1
	movne r1, r3
	moveq r1, r2
	tst r1, #0xff
	beq _01FFB7F8
	ldrb r1, [r6]
	tst r1, #4
	ldrne r1, [sp]
	addne r1, r1, #1
	strne r1, [sp]
	ldrb r1, [r6, #6]
	add r5, r5, r1
_01FFB7F8:
	add r0, r0, #1
	cmp r0, #4
	blt _01FFB7C0
	cmp r5, #0
	bne _01FFB84C
	add r0, sp, #0x14
	mov r1, #0x160
	bl InitMove
	add r0, sp, #0x1c
	add r2, sp, #0x14
	mov r1, r10
	bl AiConsiderMove
	ldrb r0, [sp, #0x1c]
	cmp r0, #0
	beq _01FFBD0C
	ldrb r1, [sp, #0x1d]
	add r0, r7, #0x4a
	bl SetActionStruggle
	mov r0, r10
	bl UpdateAiTargetPos
	b _01FFBD0C
_01FFB84C:
	mov r0, r10
	mov r1, #0xb
	bl IqSkillIsEnabled
	mov r5, r0
	mov r0, r10
	mov r1, #0x17
	bl IqSkillIsEnabled
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	mov r8, #0
	and r0, r0, #0xff
	str r0, [sp, #4]
	mov r2, r8
	mov r1, #1
	add r0, sp, #0xc
_01FFB88C:
	strb r1, [r0, r2]
	add r2, r2, #1
	cmp r2, #4
	blt _01FFB88C
	ldr r0, [sp, #4]
	cmp r0, #0
	beq _01FFB96C
	mov r2, #0
	mov r3, r2
	mov r4, #0x63
	add r0, r7, #0x124 + CHOOSE_AI_MOVE_OFFSET
	mov r9, r2
	add r6, sp, #0xc
	mov lr, #1
	b _01FFB938
_01FFB8C8:
	ldrb ip, [r0, r3, lsl #3]
	add r1, r0, r3, lsl #3
	tst ip, #1
	movne ip, lr
	moveq ip, #0
	tst ip, #0xff
	beq _01FFB940
	cmp r3, #0
	beq _01FFB928
	ldrb ip, [r1]
	tst ip, #2
	bne _01FFB928
	add ip, r2, #1
	cmp ip, r3
	cmplt r4, #2
	bge _01FFB91C
	b _01FFB914
_01FFB90C:
	strb r9, [r6, r2]
	add r2, r2, #1
_01FFB914:
	cmp r2, r3
	blt _01FFB90C
_01FFB91C:
	ldrb r4, [r1, #6]
	mov r2, r3
	b _01FFB934
_01FFB928:
	ldrb r1, [r1, #6]
	cmp r4, r1
	movge r4, r1
_01FFB934:
	add r3, r3, #1
_01FFB938:
	cmp r3, #4
	blt _01FFB8C8
_01FFB940:
	add r0, r2, #1
	cmp r0, r3
	cmplt r4, #2
	bge _01FFB96C
	mov r1, #0
	add r0, sp, #0xc
	b _01FFB964
_01FFB95C:
	strb r1, [r0, r2]
	add r2, r2, #1
_01FFB964:
	cmp r2, r3
	blt _01FFB95C
_01FFB96C:
	add r0, r7, #0x124 + CHOOSE_AI_MOVE_OFFSET
	mov r9, #0
	str r0, [sp, #8]
	add r4, sp, #0x1c
_01FFB97C:
	mov r0, #0
	strb r0, [r4, r9, lsl #3]
	ldr r0, [sp, #8]
	add r6, r0, r9, lsl #3
	ldrb r0, [r0, r9, lsl #3]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	addne r0, sp, #0xc
	ldrneb r0, [r0, r9]
	cmpne r0, #0
	beq _01FFBA7C
	ldr r2, [sp, #4]
	mov r0, r10
	mov r1, r9
	bl CanAiUseMove
	cmp r0, #0
	beq _01FFBA7C
	ldrb r0, [r6]
	tst r0, #4
	beq _01FFBA7C
	mov r0, #1
	strb r0, [r4, r9, lsl #3]
	ldrb r0, [r7, #0xd2]
	mov r2, r9, lsl #3
	cmp r0, #0xb
	bne _01FFBA38
	ldrh r0, [r6, #4]
	cmp r0, #0x80
	addeq r1, r4, r2
	moveq r0, #0
	streq r0, [r1, #4]
	beq _01FFBA7C
	mov r0, r10
	mov r1, r6
	bl GetMoveTypeForMonster
	cmp r0, #5
	addne r1, r4, r9, lsl #3
	movne r0, #1
	strne r0, [r1, #4]
	bne _01FFBA70
	mov r0, r6
	bl GetMoveAiWeight
	add r1, r4, r9, lsl #3
	str r0, [r1, #4]
	b _01FFBA70
_01FFBA38:
	cmp r5, #0
	beq _01FFBA60
	ldr r1, [sp, #8]
	add r0, r4, r2
	add r2, r1, r2
	mov r1, r10
	bl AiConsiderMove
	add r1, r4, r9, lsl #3
	str r0, [r1, #4]
	b _01FFBA70
_01FFBA60:
	mov r0, r6
	bl GetMoveAiWeight
	add r1, r4, r9, lsl #3
	str r0, [r1, #4]
_01FFBA70:
	add r0, r4, r9, lsl #3
	ldr r0, [r0, #4]
	add r8, r8, r0
_01FFBA7C:
	add r9, r9, #1
	cmp r9, #4
	blt _01FFB97C
	mov r2, #0
	mov r0, r10
	mov r1, #0x17
	str r2, [sp, #0x40]
	bl IqSkillIsEnabled
	cmp r0, #0
	bne _01FFBAF0
	ldrb r0, [r7, #0xd2]
	cmp r0, #0xb
	beq _01FFBAF0
	mov r1, #1
	strb r1, [sp, #0x3c]
	ldrb r0, [r7, #0xd2]
	cmp r0, #0xb
	streq r1, [sp, #0x40]
	beq _01FFBAE8
	cmp r5, #0
	movne r0, #2
	strne r0, [sp, #0x40]
	ldreq r0, [sp]
	ldreq r1, =AI_REGULAR_ATTACK_WEIGHTS
	moveq r0, r0, lsl #1
	ldreqsh r0, [r1, r0]
	streq r0, [sp, #0x40]
_01FFBAE8:
	ldr r0, [sp, #0x40]
	add r8, r8, r0
_01FFBAF0:
	cmp r5, #0
	beq _01FFBB80
	mov r0, #0
	mov r8, r0
	mov r5, r0
	mov r2, r0
	add r3, sp, #0x1c
_01FFBB0C:
	ldrb r1, [r3, r5, lsl #3]
	mov r4, r5, lsl #3
	cmp r1, #0
	add r1, r3, r4
	streq r2, [r1, #4]
	beq _01FFBB30
	ldr r1, [r1, #4]
	cmp r0, r1
	movlt r0, r1
_01FFBB30:
	add r5, r5, #1
	cmp r5, #5
	blt _01FFBB0C
	mov r1, #0
	mov r3, r1
	add r5, sp, #0x1c
_01FFBB48:
	ldrb r2, [r5, r1, lsl #3]
	mov r4, r1, lsl #3
	cmp r2, #0
	beq _01FFBB74
	add r4, r5, r4
	ldr r2, [r4, #4]
	cmp r0, r2
	strne r3, [r4, #4]
	add r2, r5, r1, lsl #3
	ldr r2, [r2, #4]
	add r8, r8, r2
_01FFBB74:
	add r1, r1, #1
	cmp r1, #5
	blt _01FFBB48
_01FFBB80:
	cmp r8, #0
	beq _01FFBD0C
	mov r0, r8
	bl DungeonRandInt
	mov r5, r0
	mov r4, #0
	mov r0, r10
	mov r1, #0x4e
	mov r6, r4
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _01FFBBD8
	mov r0, r10
	bl ov29_02338350
	cmp r0, #0
	bne _01FFBBD8
	mov r6, #1
	add r1, sp, #0x10
	mov r0, r10
	mov r2, r6
	bl TargetRegularAttack
	mov r11, r0
_01FFBBD8:
	cmp r6, #0
	bne _01FFBC10
	mov r0, r10
	mov r1, #0x17
	bl IqSkillIsEnabled
	cmp r0, #0
	movne r11, #0
	strne r11, [sp, #0x10]
	bne _01FFBC10
	add r1, sp, #0x10
	mov r0, r10
	mov r2, #1
	bl TargetRegularAttack
	mov r11, r0
_01FFBC10:
	mov r8, #0
	add r3, sp, #0x1c
	b _01FFBCE4
_01FFBC1C:
	ldrb r0, [r3, r8, lsl #3]
	mov r2, r8, lsl #3
	cmp r0, #0
	addne r0, r3, r2
	ldrne r1, [r0, #4]
	cmpne r1, #0
	beq _01FFBCE0
	add r4, r4, r1
	cmp r4, r5
	blt _01FFBCE0
	cmp r6, #0
	bne _01FFBC54
	cmp r8, #4
	bne _01FFBC78
_01FFBC54:
	cmp r11, #0
	beq _01FFBCEC
	ldr r1, [sp, #0x10]
	add r0, r7, #0x4a
	and r1, r1, #0xff
	bl SetActionRegularAttack
	mov r0, r10
	bl UpdateAiTargetPos
	b _01FFBD0C
_01FFBC78:
	add r3, r7, #0x124 + CHOOSE_AI_MOVE_OFFSET
	mov r1, r10
	add r2, r3, r2
	bl AiConsiderMove
	add r0, sp, #0x1c
	ldrb r0, [r0, r8, lsl #3]
	cmp r0, #0
	beq _01FFBCEC
	mov r1, r8
	b _01FFBCB4
_01FFBCA0:
	add r0, r7, r1, lsl #3
	ldrb r0, [r0, #0x124 + CHOOSE_AI_MOVE_OFFSET]
	tst r0, #2
	beq _01FFBCBC
	sub r1, r1, #1
_01FFBCB4:
	cmp r1, #0
	bgt _01FFBCA0
_01FFBCBC:
	add r0, sp, #0x1d
	ldrb r2, [r0, r8, lsl #3]
	mov r1, r1, lsl #0x10
	add r0, r7, #0x4a
	mov r1, r1, asr #0x10
	bl SetActionUseMoveAi
	mov r0, r10
	bl UpdateAiTargetPos
	b _01FFBD0C
_01FFBCE0:
	add r8, r8, #1
_01FFBCE4:
	cmp r8, #5
	blt _01FFBC1C
_01FFBCEC:
	cmp r11, #0
	beq _01FFBD0C
	ldr r1, [sp, #0x10]
	add r0, r7, #0x4a
	and r1, r1, #0xff
	bl SetActionRegularAttack
	mov r0, r10
	bl UpdateAiTargetPos
_01FFBD0C:
	add sp, sp, #0x44
	ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
}
#endif

#ifdef SDK_ARM9
#include <nitro/itcm_end.h>
#endif //SDK_ARM9
