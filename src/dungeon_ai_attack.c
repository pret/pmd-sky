#include "dungeon_ai_attack.h"
#include "dg_random.h"
#include "dungeon_ai_attack_1.h"
#include "dungeon_ai_attack_2.h"
#include "dungeon_ai_targeting_1.h"
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
#include "overlay_29_0231ACAC.h"
#include "position_util.h"

extern bool8 AI_CAN_ATTACK_IN_DIRECTION[NUM_DIRECTIONS];
extern u8 AI_POTENTIAL_ATTACK_TARGET_DIRECTIONS[NUM_DIRECTIONS];
extern s32 AI_POTENTIAL_ATTACK_TARGET_WEIGHTS[NUM_DIRECTIONS];
extern struct entity *AI_POTENTIAL_ATTACK_TARGETS[NUM_DIRECTIONS];

extern enum type_id GetMoveTypeForMonster(struct entity *entity, struct move *move);
extern s32 WeightMoveWithIqSkills(struct entity *user, s32 move_ai_range, struct entity *target, enum type_id move_type);
extern bool8 StatusCheckerCheckOnTarget(struct entity *attacker, struct entity *target, struct move *move);
extern bool8 ov29_023007DC(struct entity *entity);
extern bool8 IsMonsterSleeping(struct entity *monster);
extern u8 GetMoveAccuracyOrAiChance(struct move *move, u32 which);

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
                if (!ov29_023007DC(target))
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
                    if (!MonsterHasNegativeStatus(target, TRUE) && !ov29_023007DC(target))
                        return FALSE;
                }
                else if (!MonsterHasNegativeStatus(target, TRUE) && !ov29_023007DC(target))
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
