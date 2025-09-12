#include "dungeon_ai_attack.h"
#include "dg_random.h"
#include "dungeon_ai_attack_1.h"
#include "dungeon_ai_targeting_1.h"
#include "dungeon_capabilities.h"
#include "dungeon_capabilities_4.h"
#include "dungeon_logic.h"
#include "dungeon_logic_4.h"
#include "dungeon_map_access.h"
#include "dungeon_pokemon_attributes_1.h"
#include "dungeon_statuses.h"
#include "dungeon_util.h"
#include "dungeon_util_static.h"
#include "dungeon_visibility.h"
#include "main_0208655C.h"
#include "move_checks.h"
#include "move_data.h"
#include "moves_2.h"
#include "moves_3.h"
#include "moves_4.h"
#include "overlay_29_0231ACAC.h"
#include "position_util.h"

extern bool8 AI_CAN_ATTACK_IN_DIRECTION[NUM_DIRECTIONS];
extern u8 AI_POTENTIAL_ATTACK_TARGET_DIRECTIONS[NUM_DIRECTIONS];
extern s32 AI_POTENTIAL_ATTACK_TARGET_WEIGHTS[NUM_DIRECTIONS];
extern struct entity *AI_POTENTIAL_ATTACK_TARGETS[NUM_DIRECTIONS];

extern enum type_id GetMoveTypeForMonster(struct entity *entity, struct move *move);
extern s32 WeightMoveWithIqSkills(struct entity *user, s32 move_ai_range, struct entity *target, enum type_id move_type);

void ResetAiCanAttackInDirection()
{
    for (s32 i = 0; i < NUM_DIRECTIONS; i++)
    {
        AI_CAN_ATTACK_IN_DIRECTION[i] = FALSE;
    }
}

// https://decomp.me/scratch/jVfou
#ifdef NONMATCHING
u32 AiConsiderMove(struct ai_possible_move *ai_possible_move, struct entity *monster, struct move *move)
{
    struct monster *pokemon_info = GetEntInfo(monster);
    s32 move_weight = 1;
    bool8 has_status_checker;
    s32 num_potential_targets = 0;
    ResetAiCanAttackInDirection();

    s32 move_target_and_range = GetEntityMoveTargetAndRange(monster, move, TRUE);
    has_status_checker = IqSkillIsEnabled(monster, IQ_STATUS_CHECKER);
    ai_possible_move->can_be_used = FALSE;
    if (pokemon_info->cringe_class_status.cringe == STATUS_CRINGE_TAUNTED && !IsUsableWhileTaunted(move))
        return move_weight;

    if (has_status_checker && !StatusCheckerCheck(monster, move))
        return move_weight;

    if (GetMoveTargetAndRange(move, FALSE) == TARGET_USER | RANGE_USER | AI_CONDITION_HP_25)
    {
        s32 max_hp = MIN(pokemon_info->max_hp_stat + pokemon_info->max_hp_boost, 999);
        if (pokemon_info->hp == max_hp)
            return move_weight;
    }

    s32 i;
    s32 move_range = move_target_and_range & 0xF0;
    if (move_range == RANGE_FRONT ||
        move_range == RANGE_FRONT_AND_SIDES ||
        move_range == RANGE_NEARBY)
    {
        if (IsBlinded(monster, TRUE))
        {
            u8 direction = pokemon_info->action.direction;
            if (!AI_CAN_ATTACK_IN_DIRECTION[direction])
            {
                AI_CAN_ATTACK_IN_DIRECTION[direction] = TRUE;
                AI_POTENTIAL_ATTACK_TARGET_DIRECTIONS[num_potential_targets] = direction;
                AI_POTENTIAL_ATTACK_TARGET_WEIGHTS[num_potential_targets] = 99;
                AI_POTENTIAL_ATTACK_TARGET_WEIGHTS[NUM_DIRECTIONS] = 0;
                num_potential_targets++;
            }
        }
        else
        {
            for (i = 0; i < NUM_DIRECTIONS; i++)
            {
                struct entity *adjacent_monster = GetTile(monster->pos.x + DIRECTIONS_XY[i].x, monster->pos.y + DIRECTIONS_XY[i].y)->monster;
                if (adjacent_monster != NULL &&
                    GetEntityType(adjacent_monster) == ENTITY_MONSTER &&
                    (move_range == RANGE_FRONT_AND_SIDES ||
                    move_range == RANGE_NEARBY ||
                    CanAttackInDirection(monster, i)))
                {
                    num_potential_targets = TryAddTargetToAiTargetList(num_potential_targets, move_target_and_range, monster, adjacent_monster, move, has_status_checker);
                }
            }
        }
    }
    else if (move_range == RANGE_ROOM)
    {
        for (i = 0; i < DUNGEON_MAX_POKEMON; i++)
        {
            struct entity *target = DUNGEON_PTR[0]->active_monster_ptrs[i];
            if (EntityIsValid__02319F8C(target) && CanSeeTarget(monster, target))
                num_potential_targets = TryAddTargetToAiTargetList(num_potential_targets, move_target_and_range, monster, target, move, has_status_checker);
        }
    }
    else if (move_range == RANGE_FRONT_2)
    {
        for (i = 0; i < NUM_DIRECTIONS; i++)
        {
            const struct tile *target_tile = GetTile(monster->pos.x + DIRECTIONS_XY[i].x, monster->pos.y + DIRECTIONS_XY[i].y);
            if (CanAttackInDirection(monster, i))
            {
                if (target_tile->monster != NULL && GetEntityType(target_tile->monster) == ENTITY_MONSTER)
                {
                    s32 prev_num_potential_targets = num_potential_targets;
                    num_potential_targets = TryAddTargetToAiTargetList(num_potential_targets, move_target_and_range, monster, target_tile->monster, move, has_status_checker);
                    if (prev_num_potential_targets != num_potential_targets)
                        continue;
                }

                target_tile = GetTile(monster->pos.x + DIRECTIONS_XY[i].x * 2, monster->pos.y + DIRECTIONS_XY[i].y * 2);
                if (target_tile->monster != NULL && GetEntityType(target_tile->monster) == ENTITY_MONSTER)
                    num_potential_targets = TryAddTargetToAiTargetList(num_potential_targets, move_target_and_range, monster, target_tile->monster, move, has_status_checker);
            }
        }
    }
    else if (move_range == RANGE_FRONT_10 ||
        move_range == RANGE_FRONT_WITH_CORNER_CUTTING ||
        move_range == RANGE_FRONT_2_WITH_CORNER_CUTTING)
    {
        s32 max_range;
        if (move_range == RANGE_FRONT_10)
            max_range = RANGED_ATTACK_RANGE;
        else
            max_range = 1;
        if (move_range == RANGE_FRONT_2_WITH_CORNER_CUTTING)
            max_range = 2;

        for (s32 i = 0; i < DUNGEON_MAX_POKEMON; i++)
        {
            s32 direction;
            struct entity *target = DUNGEON_PTR[0]->active_monster_ptrs[i];
            if (EntityIsValid__02319F8C(target) && monster != target)
            {
                direction = GetDirectionTowardsPosition(&monster->pos, &target->pos);
                if (!AI_CAN_ATTACK_IN_DIRECTION[direction] && CanSeeTarget(monster, target))
                {
                    s32 target_pos_x = target->pos.x;
                    s32 monster_pos_x = monster->pos.x;
                    s32 distance_x = abs(monster_pos_x - target_pos_x);
                    s32 target_pos_y = target->pos.y;
                    s32 monster_pos_y = monster->pos.y;
                    s32 distance_y = abs(monster_pos_y - target_pos_y);
                    s32 distance = MAX(distance_x, distance_y);

                    bool8 is_target_in_line_range;
                    if (distance > RANGED_ATTACK_RANGE)
                        is_target_in_line_range = FALSE;
                    else if (distance > max_range)
                        is_target_in_line_range = FALSE;
                    else
                    {
                        s32 target_direction = DIR_NONE;
                        if (distance_x == distance_y)
                        {
                            if (monster_pos_x < target_pos_x && monster_pos_y < target_pos_y)
                                target_direction = DIR_DOWN_RIGHT;
                            else if (monster_pos_x < target_pos_x && monster_pos_y > target_pos_y)
                                target_direction = DIR_UP_RIGHT;
                            else if (monster_pos_x > target_pos_x && monster_pos_y > target_pos_y)
                                target_direction = DIR_UP_LEFT;
                            else
                                target_direction = DIR_DOWN_LEFT;
                        }
                        else if (monster_pos_x == target_pos_x && monster_pos_y < target_pos_y)
                            target_direction = DIR_DOWN;
                        else if (monster_pos_x < target_pos_x && monster_pos_y == target_pos_y)
                            target_direction = DIR_RIGHT;
                        else if (monster_pos_x == target_pos_x && monster_pos_y > target_pos_y)
                            target_direction = DIR_UP;
                        else if (monster_pos_x > target_pos_x && monster_pos_y == target_pos_y)
                            target_direction = DIR_LEFT;

                        if (target_direction >= DIR_DOWN)
                            is_target_in_line_range = TRUE;
                        else
                            is_target_in_line_range = FALSE;
                    }

                    if (is_target_in_line_range)
                    {
                        if (IsAiTargetEligible(move_target_and_range, monster, target, move, has_status_checker) &&
                            IsTargetInRange(monster, target, direction, max_range))
                        {
                            AI_CAN_ATTACK_IN_DIRECTION[direction] = TRUE;
                            AI_POTENTIAL_ATTACK_TARGET_DIRECTIONS[num_potential_targets] = direction;
                            AI_POTENTIAL_ATTACK_TARGET_WEIGHTS[num_potential_targets] = WeightMoveWithIqSkills(monster, move_target_and_range, target, GetMoveTypeForMonster(monster, move));
                            AI_POTENTIAL_ATTACK_TARGETS[num_potential_targets] = target;
                            num_potential_targets++;
                        }
                    }
                }
            }
        }
    }
    else if (move_range == RANGE_FLOOR)
    {
        for (i = 0; i < DUNGEON_MAX_POKEMON; i++)
        {
            struct entity *target = DUNGEON_PTR[0]->active_monster_ptrs[i];
            if (EntityIsValid__02319F8C(target))
                num_potential_targets = TryAddTargetToAiTargetList(num_potential_targets, move_target_and_range, monster, target, move, has_status_checker);
        }
    }
    else if (move_range == RANGE_USER)
        num_potential_targets = TryAddTargetToAiTargetList(num_potential_targets, move_target_and_range, monster, monster, move, has_status_checker);

    if (num_potential_targets == 0)
        ai_possible_move->can_be_used = FALSE;
    else
    {
        s32 total_weight = 0;
        s32 max_weight = 0;
        for (i = 0; i < num_potential_targets; i++)
        {
            if (max_weight < AI_POTENTIAL_ATTACK_TARGET_WEIGHTS[i])
                max_weight = AI_POTENTIAL_ATTACK_TARGET_WEIGHTS[i];
        }

        for (i = 0; i < num_potential_targets; i++)
        {
            if (max_weight != AI_POTENTIAL_ATTACK_TARGET_WEIGHTS[i])
                AI_POTENTIAL_ATTACK_TARGET_WEIGHTS[i] = 0;
        }

        move_weight = max_weight;
        for (i = 0; i < num_potential_targets; i++)
        {
            total_weight += AI_POTENTIAL_ATTACK_TARGET_WEIGHTS[i];
        }

        s32 weight_counter = DungeonRandInt(total_weight);
        for (i = 0; i < num_potential_targets; i++)
        {
            weight_counter -= AI_POTENTIAL_ATTACK_TARGET_WEIGHTS[i];
            if (weight_counter < 0)
                break;
        }

        ai_possible_move->can_be_used = TRUE;
        ai_possible_move->direction = AI_POTENTIAL_ATTACK_TARGET_DIRECTIONS[i];
        ai_possible_move->weight = 8;
    }

    return move_weight;
}
#else
// AI_POTENTIAL_ATTACK_TARGET_WEIGHTS is defined two separate times in the ASM, so define it twice here to match.
extern s32 AI_POTENTIAL_ATTACK_TARGET_WEIGHTS_2[NUM_DIRECTIONS];

asm u32 AiConsiderMove(struct ai_possible_move *ai_possible_move, struct entity *monster, struct move *move)
{
#ifdef JAPAN
#define AI_CONSIDER_MOVE_OFFSET -0xA4
#else
#define AI_CONSIDER_MOVE_OFFSET 0
#endif
	stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
	sub sp, sp, #0x2c
	mov r10, r1
	str r0, [sp, #8]
	mov r0, #1
	mov r9, r2
	ldr r6, [r10, #0xb4]
	str r0, [sp, #0x14]
	mov r5, #0
	bl ResetAiCanAttackInDirection
	mov r0, r10
	mov r1, r9
	mov r2, #1
	bl GetEntityMoveTargetAndRange
	str r0, [sp, #0x24]
	mov r0, r10
	mov r1, #8
	bl IqSkillIsEnabled
	mov r4, r0
	ldr r0, [sp, #8]
	mov r1, r5
	strb r1, [r0]
	ldrb r0, [r6, #0xd0]
	cmp r0, #5
	bne _023198F8
	mov r0, r9
	bl IsUsableWhileTaunted
	cmp r0, #0
	moveq r0, #1
	beq _02319F64
_023198F8:
	cmp r4, #0
	beq _02319918
	mov r0, r10
	mov r1, r9
	bl StatusCheckerCheck
	cmp r0, #0
	moveq r0, #1
	beq _02319F64
_02319918:
	mov r0, r9
	mov r1, #0
	bl GetMoveTargetAndRange
	ldr r1, =0x00000273
	cmp r0, r1
	bne _02319958
	ldrsh r3, [r6, #0x12]
	ldrsh r2, [r6, #0x16]
	add r0, r1, #0x174
	add r2, r3, r2
	cmp r2, r0
	movgt r2, r0
	ldrsh r0, [r6, #0x10]
	cmp r0, r2
	moveq r0, #1
	beq _02319F64
_02319958:
	ldr r0, [sp, #0x24]
	ands r7, r0, #0xf0
	cmpne r7, #0x10
	cmpne r7, #0x20
	bne _02319A54
	mov r0, r10
	mov r1, #1
	bl IsBlinded
	cmp r0, #0
	beq _023199C0
	ldrb r6, [r6, #0x4c]
	ldr r4, =AI_CAN_ATTACK_IN_DIRECTION
	ldrb r0, [r4, r6]
	cmp r0, #0
	bne _02319E88
	ldr r1, =AI_POTENTIAL_ATTACK_TARGET_DIRECTIONS
	mov r3, #1
	ldr r0, =AI_POTENTIAL_ATTACK_TARGET_WEIGHTS
	mov r2, #0x63
	strb r3, [r4, r6]
	strb r6, [r1]
	str r2, [r0]
	mov r1, #0
	str r1, [r0, #0x20]
	add r5, r5, #1
	b _02319E88
_023199C0:
	ldr r11, =DIRECTIONS_XY
	mov r8, #0
_023199C8:
	mov r1, r8, lsl #2
	add r0, r11, r8, lsl #2
	ldrsh r6, [r10, #4]
	ldrsh r3, [r11, r1]
	ldrsh r2, [r10, #6]
	ldrsh r1, [r0, #2]
	add r0, r6, r3
	add r1, r2, r1
	bl GetTile
	ldr r6, [r0, #0xc]
	cmp r6, #0
	beq _02319A44
	ldr r0, [r6]
	cmp r0, #1
	bne _02319A44
	cmp r7, #0x10
	cmpne r7, #0x20
	beq _02319A24
	mov r0, r10
	mov r1, r8
	bl CanAttackInDirection
	cmp r0, #0
	beq _02319A44
_02319A24:
	str r9, [sp]
	ldr r1, [sp, #0x24]
	mov r0, r5
	mov r2, r10
	mov r3, r6
	str r4, [sp, #4]
	bl TryAddTargetToAiTargetList
	mov r5, r0
_02319A44:
	add r8, r8, #1
	cmp r8, #8
	blt _023199C8
	b _02319E88
_02319A54:
	cmp r7, #0x30
	bne _02319AC8
	ldr r7, =DUNGEON_PTR
	mov r6, #0
_02319A64:
	ldr r0, [r7]
	add r0, r0, r6, lsl #2
	add r0, r0, #0x12000
	ldr r8, [r0, #0xb78 + AI_CONSIDER_MOVE_OFFSET]
	mov r0, r8
	bl EntityIsValid__02319F8C
	cmp r0, #0
	beq _02319AB8
	mov r0, r10
	mov r1, r8
	bl CanSeeTarget
	cmp r0, #0
	beq _02319AB8
	str r9, [sp]
	ldr r1, [sp, #0x24]
	mov r0, r5
	mov r2, r10
	mov r3, r8
	str r4, [sp, #4]
	bl TryAddTargetToAiTargetList
	mov r5, r0
_02319AB8:
	add r6, r6, #1
	cmp r6, #0x14
	blt _02319A64
	b _02319E88
_02319AC8:
	cmp r7, #0x40
	bne _02319BB0
	mov r8, #0
_02319AD4:
	ldr r0, =DIRECTIONS_XY
	mov r2, r8, lsl #2
	add r0, r0, r8, lsl #2
	ldrsh r6, [r0, #2]
	ldr r0, =DIRECTIONS_XY
	ldrsh r1, [r10, #6]
	ldrsh r7, [r0, r2]
	ldrsh r0, [r10, #4]
	add r1, r1, r6
	add r0, r0, r7
	bl GetTile
	mov r11, r0
	mov r0, r10
	mov r1, r8
	bl CanAttackInDirection
	cmp r0, #0
	beq _02319BA0
	ldr r3, [r11, #0xc]
	cmp r3, #0
	beq _02319B58
	ldr r0, [r3]
	cmp r0, #1
	bne _02319B58
	str r9, [sp]
	ldr r1, [sp, #0x24]
	mov r0, r5
	mov r2, r10
	str r4, [sp, #4]
	mov r11, r5
	bl TryAddTargetToAiTargetList
	mov r5, r0
	cmp r11, r5
	bne _02319BA0
_02319B58:
	ldrsh r0, [r10, #4]
	ldrsh r1, [r10, #6]
	add r0, r0, r7, lsl #1
	add r1, r1, r6, lsl #1
	bl GetTile
	ldr r3, [r0, #0xc]
	cmp r3, #0
	beq _02319BA0
	ldr r0, [r3]
	cmp r0, #1
	bne _02319BA0
	str r9, [sp]
	ldr r1, [sp, #0x24]
	mov r0, r5
	mov r2, r10
	str r4, [sp, #4]
	bl TryAddTargetToAiTargetList
	mov r5, r0
_02319BA0:
	add r8, r8, #1
	cmp r8, #8
	blt _02319AD4
	b _02319E88
_02319BB0:
	cmp r7, #0x50
	cmpne r7, #0x80
	cmpne r7, #0x90
	bne _02319E00
	cmp r7, #0x50
	moveq r0, #0xa
	streq r0, [sp, #0xc]
	movne r0, #1
	strne r0, [sp, #0xc]
	cmp r7, #0x90
	moveq r0, #2
	streq r0, [sp, #0xc]
	mov r0, #0
	str r0, [sp, #0x20]
	mvn r0, #0
	str r0, [sp, #0x28]
_02319BF0:
	ldr r0, =DUNGEON_PTR
	ldr r1, [r0]
	ldr r0, [sp, #0x20]
	add r0, r1, r0, lsl #2
	add r0, r0, #0x12000
	ldr r0, [r0, #0xb78 + AI_CONSIDER_MOVE_OFFSET]
	str r0, [sp, #0x18]
	bl EntityIsValid__02319F8C
	cmp r0, #0
	ldrne r0, [sp, #0x18]
	cmpne r10, r0
	beq _02319DE8
	ldr r1, [sp, #0x18]
	add r0, r10, #4
	add r1, r1, #4
	bl GetDirectionTowardsPosition
	ldr r1, =AI_CAN_ATTACK_IN_DIRECTION
	str r0, [sp, #0x1c]
	ldrb r0, [r1, r0]
	cmp r0, #0
	bne _02319DE8
	ldr r1, [sp, #0x18]
	mov r0, r10
	bl CanSeeTarget
	cmp r0, #0
	beq _02319DE8
	ldr r0, [sp, #0x18]
	ldrsh r6, [r10, #4]
	ldrsh r11, [r0, #4]
	sub r0, r6, r11
	bl abs
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x18]
	ldrsh r8, [r10, #6]
	ldrsh r7, [r0, #6]
	sub r0, r8, r7
	bl abs
	ldr r1, [sp, #0x10]
	cmp r1, r0
	movgt r2, r1
	movle r2, r0
	cmp r2, #0xa
	movgt r0, #0
	bgt _02319D50
	ldr r1, [sp, #0xc]
	cmp r2, r1
	movgt r0, #0
	bgt _02319D50
	ldr r1, [sp, #0x10]
	cmp r1, r0
	ldr r0, [sp, #0x28]
	bne _02319CF8
	cmp r6, r11
	cmplt r8, r7
	movlt r0, #1
	blt _02319D44
	cmp r6, r11
	bge _02319CE4
	cmp r8, r7
	movgt r0, #3
	bgt _02319D44
_02319CE4:
	cmp r6, r11
	cmpgt r8, r7
	movgt r0, #5
	movle r0, #7
	b _02319D44
_02319CF8:
	cmp r6, r11
	bne _02319D0C
	cmp r8, r7
	movlt r0, #0
	blt _02319D44
_02319D0C:
	cmp r6, r11
	bge _02319D20
	cmp r8, r7
	moveq r0, #2
	beq _02319D44
_02319D20:
	cmp r6, r11
	bne _02319D34
	cmp r8, r7
	movgt r0, #4
	bgt _02319D44
_02319D34:
	cmp r6, r11
	ble _02319D44
	cmp r8, r7
	moveq r0, #6
_02319D44:
	cmp r0, #0
	movge r0, #1
	movlt r0, #0
_02319D50:
	cmp r0, #0
	beq _02319DE8
	str r4, [sp]
	ldr r0, [sp, #0x24]
	ldr r2, [sp, #0x18]
	mov r1, r10
	mov r3, r9
	bl IsAiTargetEligible
	cmp r0, #0
	beq _02319DE8
	ldr r1, [sp, #0x18]
	ldr r2, [sp, #0x1c]
	ldr r3, [sp, #0xc]
	mov r0, r10
	bl IsTargetInRange
	cmp r0, #0
	beq _02319DE8
	ldr r1, =AI_CAN_ATTACK_IN_DIRECTION
	ldr r0, [sp, #0x1c]
	mov r2, #1
	strb r2, [r1, r0]
	mov r1, r0
	ldr r0, =AI_POTENTIAL_ATTACK_TARGET_DIRECTIONS
	strb r1, [r0, r5]
	mov r0, r10
	mov r1, r9
	bl GetMoveTypeForMonster
	mov r3, r0
	ldr r1, [sp, #0x24]
	ldr r2, [sp, #0x18]
	mov r0, r10
	bl WeightMoveWithIqSkills
	ldr r1, =AI_POTENTIAL_ATTACK_TARGET_WEIGHTS_2
	str r0, [r1, r5, lsl #2]
	ldr r1, [sp, #0x18]
	ldr r0, =AI_POTENTIAL_ATTACK_TARGETS
	str r1, [r0, r5, lsl #2]
	add r5, r5, #1
_02319DE8:
	ldr r0, [sp, #0x20]
	add r0, r0, #1
	str r0, [sp, #0x20]
	cmp r0, #0x14
	blt _02319BF0
	b _02319E88
_02319E00:
	cmp r7, #0x60
	bne _02319E60
	ldr r7, =DUNGEON_PTR
	mov r6, #0
_02319E10:
	ldr r0, [r7]
	add r0, r0, r6, lsl #2
	add r0, r0, #0x12000
	ldr r8, [r0, #0xb78 + AI_CONSIDER_MOVE_OFFSET]
	mov r0, r8
	bl EntityIsValid__02319F8C
	cmp r0, #0
	beq _02319E50
	str r9, [sp]
	ldr r1, [sp, #0x24]
	mov r0, r5
	mov r2, r10
	mov r3, r8
	str r4, [sp, #4]
	bl TryAddTargetToAiTargetList
	mov r5, r0
_02319E50:
	add r6, r6, #1
	cmp r6, #0x14
	blt _02319E10
	b _02319E88
_02319E60:
	cmp r7, #0x70
	bne _02319E88
	str r9, [sp]
	ldr r1, [sp, #0x24]
	mov r2, r10
	mov r3, r10
	mov r0, #0
	str r4, [sp, #4]
	bl TryAddTargetToAiTargetList
	mov r5, r0
_02319E88:
	cmp r5, #0
	ldreq r0, [sp, #8]
	moveq r1, #0
	streqb r1, [r0]
	beq _02319F60
	mov r0, #0
	str r0, [sp, #0x14]
	mov r4, r0
	ldr r3, =AI_POTENTIAL_ATTACK_TARGET_WEIGHTS_2
	b _02319EC4
_02319EB0:
	ldr r2, [r3, r4, lsl #2]
	ldr r1, [sp, #0x14]
	add r4, r4, #1
	cmp r1, r2
	strlt r2, [sp, #0x14]
_02319EC4:
	cmp r4, r5
	blt _02319EB0
	mov r6, #0
	mov r2, r6
	ldr r4, =AI_POTENTIAL_ATTACK_TARGET_WEIGHTS_2
	b _02319EF0
_02319EDC:
	ldr r3, [r4, r6, lsl #2]
	ldr r1, [sp, #0x14]
	cmp r1, r3
	strne r2, [r4, r6, lsl #2]
	add r6, r6, #1
_02319EF0:
	cmp r6, r5
	blt _02319EDC
	mov r3, #0
	ldr r2, =AI_POTENTIAL_ATTACK_TARGET_WEIGHTS_2
	b _02319F10
_02319F04:
	ldr r1, [r2, r3, lsl #2]
	add r3, r3, #1
	add r0, r0, r1
_02319F10:
	cmp r3, r5
	blt _02319F04
	bl DungeonRandInt
	mov r3, #0
	ldr r2, =AI_POTENTIAL_ATTACK_TARGET_WEIGHTS_2
	b _02319F38
_02319F28:
	ldr r1, [r2, r3, lsl #2]
	subs r0, r0, r1
	bmi _02319F40
	add r3, r3, #1
_02319F38:
	cmp r3, r5
	blt _02319F28
_02319F40:
	ldr r1, =AI_POTENTIAL_ATTACK_TARGET_DIRECTIONS
	ldr r0, [sp, #8]
	mov r2, #1
	strb r2, [r0]
	ldrb r2, [r1, r3]
	mov r1, #8
	strb r2, [r0, #1]
	str r1, [r0, #4]
_02319F60:
	ldr r0, [sp, #0x14]
_02319F64:
	add sp, sp, #0x2c
	ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
}
#endif

bool8 EntityIsValid__02319F8C(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return GetEntityType(entity) != ENTITY_NOTHING;
}

s32 TryAddTargetToAiTargetList(s32 current_num_targets, s32 move_ai_range, struct entity *user, struct entity *target, struct move *move, bool8 check_all_conditions)
{
    struct monster *user_data = GetEntInfo(user);

    s32 direction;
    if (user->pos.x == target->pos.x && user->pos.y == target->pos.y)
        direction = user_data->action.direction;
    else if ((move_ai_range & 0xF0) == RANGE_ROOM ||
        (move_ai_range & 0xF0) == RANGE_FLOOR ||
        (move_ai_range & 0xF0) == RANGE_USER)
        direction = user_data->action.direction;
    else
        direction = GetDirectionTowardsPosition(&user->pos, &target->pos);

    if (AI_CAN_ATTACK_IN_DIRECTION[direction])
        return current_num_targets;

    if (IsAiTargetEligible(move_ai_range, user, target, move, check_all_conditions))
    {
        AI_CAN_ATTACK_IN_DIRECTION[direction] = TRUE;
        AI_POTENTIAL_ATTACK_TARGET_DIRECTIONS[current_num_targets] = direction;
        AI_POTENTIAL_ATTACK_TARGET_WEIGHTS[current_num_targets] = WeightMoveWithIqSkills(user, move_ai_range, target, GetMoveTypeForMonster(user, move));
        AI_POTENTIAL_ATTACK_TARGETS[current_num_targets] = target;
        current_num_targets++;
    }
    return current_num_targets;
}

bool8 IsAiTargetEligible(s32 move_ai_range, struct entity *user, struct entity *target, struct move *move, bool8 check_all_conditions)
{
    bool8 has_target = FALSE;
    u32 move_ai_target = move_ai_range & 0xF;
    if (move_ai_target == TARGET_ENEMIES)
    {
        if (GetTreatmentBetweenMonsters(user, target, FALSE, TRUE) == TREATMENT_TREAT_AS_ENEMY)
            has_target = TRUE;
    }
    else if (move_ai_target == TARGET_PARTY)
    {
        if (GetTreatmentBetweenMonsters(user, target, FALSE, TRUE) == TREATMENT_TREAT_AS_ALLY)
            has_target = TRUE;
    }
    else if (move_ai_target == TARGET_ALL)
    {
        struct monster *target_data = target_data = GetEntInfo(target);
        has_target = TRUE;
        if (target_data->shopkeeper == SHOPKEEPER_MODE_SHOPKEEPER)
            return FALSE;

        if (target_data->monster_behavior == BEHAVIOR_RESCUE_TARGET)
            return FALSE;
    }
    else if (move_ai_target == TARGET_ALL_EXCEPT_USER)
    {
        struct monster *target_data = target_data = GetEntInfo(target);
        if (user == target)
            return FALSE;

        has_target = TRUE;
        if (target_data->shopkeeper == SHOPKEEPER_MODE_SHOPKEEPER)
            return FALSE;

        if (target_data->monster_behavior == BEHAVIOR_RESCUE_TARGET)
            return FALSE;
    }
    else if (move_ai_target == TARGET_TEAMMATES)
    {
        if (user == target)
            return FALSE;

        if (GetTreatmentBetweenMonsters(user, target, FALSE, TRUE) == TREATMENT_TREAT_AS_ALLY)
            has_target = TRUE;
    }
    else if (move_ai_target - 3 <= 1) // move_ai_target == TARGET_SPECIAL
        has_target = TRUE;

    if (has_target)
    {
        if (check_all_conditions)
        {
            if (!StatusCheckerCheckOnTarget(user, target, move))
                return FALSE;

            if ((move_ai_range & 0xF00) == AI_CONDITION_RANDOM)
            {
                s32 use_chance = GetMoveAccuracyOrAiChance(move, ACCURACY_AI_CONDITION_RANDOM_CHANCE);
                if (DungeonRandInt(100) >= use_chance)
                    return FALSE;
            }
            else if ((move_ai_range & 0xF00) == AI_CONDITION_HP_25)
            {
                if (!MonsterHasQuarterHp(target))
                    return FALSE;
            }
            else if ((move_ai_range & 0xF00) == AI_CONDITION_STATUS)
            {
                if (!MonsterHasNegativeStatus(target, TRUE))
                    return FALSE;
            }
            else if ((move_ai_range & 0xF00) == AI_CONDITION_ASLEEP)
            {
                if (!IsMonsterSleeping(target))
                    return FALSE;
            }
            else if ((move_ai_range & 0xF00) == AI_CONDITION_GHOST)
            {
                struct monster *target_data = target_data = GetEntInfo(target);
                if (target_data->types[0] != TYPE_GHOST && target_data->types[1] != TYPE_GHOST)
                    return FALSE;

                if (target_data->exposed)
                    return FALSE;
            }
            else if ((move_ai_range & 0xF00) == AI_CONDITION_HP_25_OR_STATUS)
            {
                if (move->id == MOVE_HEALING_WISH || move->id == MOVE_LUNAR_DANCE)
                {
                    if (!MonsterHasNegativeStatus(target, TRUE) && !MonsterHasQuarterHp(target))
                        return FALSE;
                }
                else if (!MonsterHasNegativeStatus(target, TRUE) && !MonsterHasQuarterHp(target))
                    return FALSE;
            }
        }
        else if ((move_ai_range & 0xF00) == AI_CONDITION_RANDOM)
        {
            s32 use_chance = GetMoveAccuracyOrAiChance(move, ACCURACY_AI_CONDITION_RANDOM_CHANCE);
            if (DungeonRandInt(100) >= use_chance)
                return FALSE;
        }
    }
    return has_target;
}
