#include "dungeon_ai_movement.h"
#include "dg_camera.h"
#include "dg_random.h"
#include "dungeon_action.h"
#include "dungeon_ai_leader.h"
#include "dungeon_ai_targeting.h"
#include "dungeon_ai_targeting_1.h"
#include "dungeon_capabilities_1.h"
#include "dungeon_capabilities_4.h"
#include "dungeon_logic_5.h"
#include "dungeon_logic_7.h"
#include "dungeon_logic_8.h"
#include "dungeon_map_access.h"
#include "dungeon_pokemon_attributes_1.h"
#include "dungeon_range_2.h"
#include "dungeon_util.h"
#include "dungeon_util_1.h"
#include "dungeon_util_2.h"
#include "dungeon_util_static.h"
#include "dungeon_visibility.h"
#include "main_0200EDC0.h"
#include "main_0208655C.h"
#include "math.h"
#include "number_util.h"
#include "overlay_29_022E1610.h"
#include "overlay_29_022FA430.h"
#include "overlay_29_02348D00.h"
#include "position_util.h"

#ifdef SDK_ARM9
#include <nitro/itcm_begin.h>
#endif //SDK_ARM9

#define CHECK_VISIBILITY_DISTANCE 5
#define CORRIDOR_VISIBILITY 2

#define TURN_LEFT_45 1
#define TURN_RIGHT_45 2
#define TURN_LEFT_90 3
#define TURN_RIGHT_90 4
#define TURN_LEFT_135 5

struct can_move_in_direction_info
{
    bool8 try_turn;
    bool8 can_move_in_direction;
    bool8 pokemon_in_front;
    s32 direction;
};

const s32 FACING_DIRECTION_INCREMENTS[] = {0, 1, -1, 2, -2, 3, -3, 4};

extern bool8 ShouldAvoidFirstHit(struct entity *monster, bool8 force_avoid);
extern struct entity* GetLeaderIfVisible(struct entity *monster);
extern bool8 IsAtJunction(struct entity *monster);

bool8 ShouldMonsterRunAwayAndShowEffectOutlawCheck(struct entity *monster, bool8 show_run_away_effect)
{
    bool8 should_run_away = FALSE;
    if (ShouldMonsterRunAwayAndShowEffect(monster, show_run_away_effect))
        should_run_away = TRUE;
    else if (GetEntInfo(monster)->monster_behavior == BEHAVIOR_FLEEING_OUTLAW)
        should_run_away = TRUE;

    return should_run_away;
}


// https://decomp.me/scratch/2QnEr
#ifdef NONMATCHING
void AiMovement(struct entity *monster, bool8 show_run_away_effect)
{
    struct monster *pokemon_info = GetEntInfo(monster);
    pokemon_info->ai_target.ai_not_next_to_target = FALSE;
    pokemon_info->ai_target.ai_targeting_enemy = FALSE;
    pokemon_info->ai_target.ai_turning_around = FALSE;

    if (IsTacticSet(monster, TACTIC_BE_PATIENT))
    {
        s32 max_hp_stat = pokemon_info->max_hp_stat + pokemon_info->max_hp_boost;
        if (pokemon_info->hp <= Min(999, max_hp_stat) / 2)
        {
            pokemon_info->action.action_id = ACTION_NOTHING;
            return;
        }
    }

    if (IsTacticSet(monster, TACTIC_WAIT_THERE) || IsSecretBazaarNpc(monster))
        pokemon_info->action.action_id = ACTION_NOTHING;
    else if (!pokemon_info->is_team_leader && CeilFixedPoint(pokemon_info->belly) == 0)
        pokemon_info->action.action_id = ACTION_NOTHING;
    else if (pokemon_info->monster_behavior == BEHAVIOR_RESCUE_TARGET)
    {
        SetActionPassTurnOrWalk(&pokemon_info->action, pokemon_info->id);
        pokemon_info->action.direction = DungeonRandInt(NUM_DIRECTIONS);
        pokemon_info->target_pos.x = monster->pos.x;
        pokemon_info->target_pos.y = monster->pos.y - 1;
    }
    else
    {
        bool8 has_action;
        if (ShouldMonsterRunAwayAndShowEffectOutlawCheck(monster, show_run_away_effect))
        {
            // AvoidEnemies function from RT.
            struct monster *pokemon_info_2 = GetEntInfo(monster);
            s32 closest_target_distance = INFINITY_2;
            u8 room = monster->room_idx;

            if (pokemon_info_2->monster_behavior == BEHAVIOR_FLEEING_OUTLAW && ShouldMonsterHeadToStairs(monster))
            {
                pokemon_info_2->ai_target.ai_target_pos = DUNGEON_PTR[0]->gen_info.stairs_pos;
                pokemon_info_2->target_pos = DUNGEON_PTR[0]->gen_info.stairs_pos;
                has_action = TRUE;
            }
            else
            {
                struct entity **possible_targets;
                s32 num_possible_targets;
                if (DUNGEON_PTR[0]->decoy_is_active)
                {
                    possible_targets = DUNGEON_PTR[0]->active_monster_ptrs;
                    num_possible_targets = DUNGEON_MAX_POKEMON;
                }
                else if (pokemon_info_2->is_not_team_member && !pokemon_info_2->is_ally)
                {
                    possible_targets = DUNGEON_PTR[0]->monster_slots.party_members;
                    num_possible_targets = MAX_TEAM_MEMBERS;
                }
                else
                {
                    possible_targets = DUNGEON_PTR[0]->monster_slots.wild_pokemon;
                    num_possible_targets = DUNGEON_MAX_WILD_POKEMON;
                }

                struct entity *closest_target = NULL;
                u8 closest_target_room = CORRIDOR_ROOM;
                for (s32 i = 0; i < num_possible_targets; i++)
                {
                    struct entity *target = possible_targets[i];
                    if (EntityIsValid__0230827C(target) && CanSeeTarget(monster, target))
                    {
                        if (DUNGEON_PTR[0]->decoy_is_active && GetTreatmentBetweenMonsters(monster, target, FALSE, TRUE) != TREATMENT_TREAT_AS_ENEMY)
                            continue;

                        s32 distance = GetChebyshevDistance(&monster->pos, &target->pos);
                        if (closest_target_distance > distance)
                        {
                            closest_target_distance = distance;
                            closest_target = target;
                            closest_target_room = target->room_idx;
                            pokemon_info_2->ai_target.ai_target_pos = closest_target->pos;
                            pokemon_info_2->target_pos = closest_target->pos;
                        }
                    }
                }

                if (closest_target_distance != INFINITY_2)
                {
                    if (room == closest_target_room && room != CORRIDOR_ROOM)
                    {
                        const struct tile *tile = GetTile(monster->pos.x, monster->pos.y);
                        if (tile->terrain_flags & TERRAIN_TYPE_NATURAL_JUNCTION)
                        {
                            struct position ai_target_pos = {
                                .x = monster->pos.x,
                                .y = monster->pos.y
                            };
                            // Scan for a direction leading outside the room.
                            s32 target_dir;
                            for (target_dir = 0; target_dir < NUM_DIRECTIONS; target_dir++)
                            {
                                ai_target_pos.x = monster->pos.x + DIRECTIONS_XY[target_dir].x;
                                ai_target_pos.y = monster->pos.y + DIRECTIONS_XY[target_dir].y;
                                const struct tile *adjacent_tile = GetTile(ai_target_pos.x, ai_target_pos.y);
                                bool8 pokemon_in_front;
                                if (adjacent_tile->room != room && CanAiMonsterMoveInDirection(monster, target_dir, &pokemon_in_front))
                                    break;
                            }

                            if (target_dir == NUM_DIRECTIONS)
                            {
                                target_dir = DungeonRandInt(NUM_DIRECTIONS);
                                pokemon_info_2->ai_target.ai_objective = AI_STAND_STILL;
                                pokemon_info_2->ai_target.ai_target_pos.x = monster->pos.x + DIRECTIONS_XY[target_dir].x;
                                pokemon_info_2->ai_target.ai_target_pos.y = monster->pos.y + DIRECTIONS_XY[target_dir].y;
                                has_action = TRUE;
                            }
                            else
                            {
                                pokemon_info_2->ai_target.ai_objective = AI_RUN_AWAY;
                                pokemon_info_2->ai_target.ai_target_pos = ai_target_pos;
                                has_action = TRUE;
                            }
                        }
                        else
                        {
                            // At this point, the Pokémon is running directly away from the target.
                            // If there are any room exits that the Pokémon can head towards without moving
                            // closer to the target, head towards the furthest eligible exit.
                            struct position *natural_junction_list = DUNGEON_PTR[0]->natural_junction_list[room];

                            s16 natural_junction_list_counts = DUNGEON_PTR[0]->natural_junction_list_counts[room];
                            s32 furthest_target_to_exit_distance = -INFINITY_2;
                            s32 furthest_target_exit_index = 0;
                            s32 distance_y = abs(closest_target->pos.y - monster->pos.y);
                            s32 pokemon_to_target_distance = abs(closest_target->pos.x - monster->pos.x);
                            if (pokemon_to_target_distance <= distance_y)
                                pokemon_to_target_distance = distance_y;

                            for (s32 i = 0; i < natural_junction_list_counts; i++)
                            {
                                s16 natural_junction_pos_y = natural_junction_list[i].y;
                                s32 distance_y = abs(closest_target->pos.y - natural_junction_pos_y);
                                s16 natural_junction_pos_x = natural_junction_list[i].x;
                                s32 target_to_exit_distance = abs(closest_target->pos.x - natural_junction_pos_x);
                                if (target_to_exit_distance <= distance_y)
                                    target_to_exit_distance = distance_y;

                                s32 pokemon_to_exit_sign_x = natural_junction_pos_x - monster->pos.x;
                                if (pokemon_to_exit_sign_x < -1)
                                    pokemon_to_exit_sign_x = -1;

                                s32 pokemon_to_exit_sign_y = natural_junction_pos_y - monster->pos.y;
                                if (pokemon_to_exit_sign_y < -1)
                                    pokemon_to_exit_sign_y = -1;

                                if (pokemon_to_exit_sign_x > 1)
                                    pokemon_to_exit_sign_x = 1;

                                if (pokemon_to_exit_sign_y > 1)
                                    pokemon_to_exit_sign_y = 1;

                                s32 adjacent_to_target_distance = abs(closest_target->pos.y - (monster->pos.y + pokemon_to_exit_sign_y));
                                s32 adjacent_to_target_distance_x = abs(closest_target->pos.x - (monster->pos.x + pokemon_to_exit_sign_x));

                                if (adjacent_to_target_distance <= adjacent_to_target_distance_x)
                                    adjacent_to_target_distance = adjacent_to_target_distance_x;

                                // BUG: The Pokémon is allowed to move towards the exit and remain the same
                                // distance away from the target.
                                // This leads to odd behavior like turning around when near an exit.
                                // Using a > instead of a >= would avoid this issue.
                                // For an example of this behavior, see https://youtu.be/plke4eU_PU8?t=435.
                                if (adjacent_to_target_distance >= pokemon_to_target_distance &&
                                    furthest_target_to_exit_distance < target_to_exit_distance)
                                {
                                    furthest_target_exit_index = i;
                                    furthest_target_to_exit_distance = target_to_exit_distance;
                                }
                            }

                            if (furthest_target_to_exit_distance >= 0)
                            {
                                pokemon_info_2->ai_target.ai_objective = AI_RUN_AWAY;
                                pokemon_info_2->ai_target.ai_target_pos.x = natural_junction_list[furthest_target_exit_index].x;
                                pokemon_info_2->ai_target.ai_target_pos.y = natural_junction_list[furthest_target_exit_index].y;
                                has_action = TRUE;
                            }
                        }
                    }
                    else
                    {
                        pokemon_info_2->ai_target.ai_objective = AI_RUN_AWAY;
                        pokemon_info_2->ai_target.ai_target_pos.x = monster->pos.x - (closest_target->pos.x - monster->pos.x);
                        pokemon_info_2->ai_target.ai_target_pos.y = monster->pos.y - (closest_target->pos.y - monster->pos.y);
                        has_action = TRUE;
                    }
                }
                else
                    has_action = CalculateAiTargetPos(monster);
            }
        }
        else
        {
            // CanTakeItem function from RT.
            struct monster *pokemon_info_2 = GetEntInfo(monster);
            bool8 can_take_item;
            if (!EntityIsValid__0230827C(monster))
                can_take_item = FALSE;
            else if (CheckVariousConditions__0230156C(monster))
                can_take_item = FALSE;
            else
            {
                const struct tile *map_tile = GetTileAtEntity(monster);
                struct entity *object = map_tile->object;
                if (object == NULL)
                    can_take_item = FALSE;
                else
                {
                    switch (GetEntityType(object))
                    {
                        case ENTITY_ITEM:
                            if (!pokemon_info_2->is_team_leader &&
                                !ItemExists(pokemon_info_2->held_item.flags) &&
                                (GetTerrainType(map_tile) || !pokemon_info_2->is_not_team_member))
                            {
                                if (!pokemon_info_2->is_not_team_member)
                                {
                                    if (!IsBagFull() && !(map_tile->terrain_flags & TERRAIN_TYPE_SHOP))
                                    {
                                        can_take_item = TRUE;
                                        break;
                                    }
                                }
                                else if (IsItemUnkMissionItem2(GetItemInfo(object)))
                                {
                                    can_take_item = FALSE;
                                    break;
                                }
                                else if (!(GetItemInfo(object)->flags & ITEM_FLAG_IN_SHOP))
                                {
                                    can_take_item = TRUE;
                                    break;
                                }
                            }
                        case ENTITY_NOTHING:
                        case ENTITY_MONSTER:
                        case ENTITY_TRAP:
                        case ENTITY_HIDDEN_STAIRS:
                        case ENTITY_TEMPORARY:
                        default:
                            can_take_item = FALSE;
                            break;
                    }
                }
            }

            if (can_take_item)
            {
                pokemon_info->action.action_id = ACTION_PICK_UP_AI;
                return;
            }
            else
            {
                // ChooseTargetPosition function from RT.
                struct monster *pokemon_info_2 = GetEntInfo(monster);
                if (!ShouldMonsterFollowLeader(monster))
                {
                    struct entity **possible_targets;
                    s32 max_possible_targets;
                    if (DUNGEON_PTR[0]->decoy_is_active)
                    {
                        possible_targets = DUNGEON_PTR[0]->active_monster_ptrs;
                        max_possible_targets = DUNGEON_MAX_POKEMON;
                    }
                    else if (pokemon_info_2->is_not_team_member && !pokemon_info_2->is_ally)
                    {
                        possible_targets = DUNGEON_PTR[0]->monster_slots.party_members;
                        max_possible_targets = MAX_TEAM_MEMBERS;
                    }
                    else
                    {
                        possible_targets = DUNGEON_PTR[0]->monster_slots.wild_pokemon;
                        max_possible_targets = DUNGEON_MAX_WILD_POKEMON;
                    }

                    bool8 can_cross_walls = CanMoveThroughWalls(monster);
                    s32 target_index = -1;
                    s32 target_distance = INFINITY;
                    for (s32 i = 0; i < max_possible_targets; i++)
                    {
                        struct entity *target = possible_targets[i];
                        if (EntityIsValid__0230827C(target) && GetEntInfo(target)->monster_behavior <= BEHAVIOR_FIXED_ENEMY)
                        {
                            if (DUNGEON_PTR[0]->decoy_is_active)
                            {
                                if (GetTreatmentBetweenMonsters(monster, target, FALSE, TRUE) != TREATMENT_TREAT_AS_ENEMY)
                                    continue;
                            }
                            else if (!pokemon_info_2->is_not_team_member && GetEntInfo(target)->frozen_class_status.freeze == STATUS_FROZEN_PETRIFIED)
                                continue;

                            if (GetEntInfo(target)->shopkeeper != SHOPKEEPER_MODE_SHOPKEEPER)
                            {
                                if (can_cross_walls)
                                {
                                    if (abs(monster->pos.x - target->pos.x) > CHECK_VISIBILITY_DISTANCE ||
                                        abs(monster->pos.y - target->pos.y) > CHECK_VISIBILITY_DISTANCE)
                                    {
                                        if (!CanTargetEntity(monster, target))
                                            continue;
                                    }
                                }
                                else if (!CanTargetEntity(monster, target))
                                    continue;

                                s32 current_distance = GetChebyshevDistance(&monster->pos, &target->pos);
                                if (target_distance > current_distance)
                                {
                                    target_distance = current_distance;
                                    target_index = i;
                                    if (target_distance < 2)
                                        break;
                                }
                            }
                        }
                    }

                    if (target_index >= 0)
                    {
                        pokemon_info_2->ai_target.ai_objective = AI_CHASE_TARGET;
                        pokemon_info_2->ai_target.ai_target_pos = possible_targets[target_index]->pos;
                        pokemon_info_2->ai_target.ai_target = possible_targets[target_index];
                        pokemon_info_2->ai_target.ai_target_spawn_genid = pokemon_info_2->ai_target.ai_target->spawn_genid;
                        pokemon_info_2->ai_target.ai_targeting_enemy = TRUE;
                        pokemon_info_2->random_movement = FALSE;
                        if (IsTacticSet(monster, TACTIC_KEEP_YOUR_DISTANCE) && !CanSeeTeammate(monster))
                        {
                            struct entity *possible_target = possible_targets[target_index];
                            s32 distance_x = abs(monster->pos.x - possible_target->pos.x);
                            if (distance_x <= 1)
                            {
                                s32 distance_y = abs(monster->pos.y - possible_target->pos.y);
                                if (distance_y <= 1)
                                    pokemon_info_2->ai_target.ai_turning_around = TRUE;
                            }
                        }
                        has_action = TRUE;
                        goto end_choose_target_position;
                    }
                }
                if (!IsTacticSet(monster, TACTIC_YOU_GO_THE_OTHER_WAY))
                {
                    if (!pokemon_info_2->is_not_team_member)
                    {
                        struct entity *leader = GetLeaderIfVisible(monster);
                        if (EntityIsValid__0230827C(leader))
                        {
                            pokemon_info_2->ai_target.ai_objective = AI_CHASE_TARGET;
                            pokemon_info_2->ai_target.ai_target_pos = leader->pos;
                            pokemon_info_2->ai_target.ai_target = leader;
                            pokemon_info_2->ai_target.ai_target_spawn_genid = leader->spawn_genid;
                            pokemon_info_2->random_movement = FALSE;
                            has_action = TRUE;
                            goto end_choose_target_position;
                        }
                    }
                }
                else if (pokemon_info_2->is_team_leader)
                {
                    // This item targeting code is never reached because the leader is never AI-controlled.
                    GetVisibilityRange(); // Dead code
                    u8 room = GetTile(monster->pos.x, monster->pos.y)->room;
                    s32 min_x, min_y, max_x, max_y;
                    if (room == CORRIDOR_ROOM)
                    {
                        min_x = monster->pos.x - CORRIDOR_VISIBILITY;
                        min_y = monster->pos.y - CORRIDOR_VISIBILITY;
                        max_x = monster->pos.x + CORRIDOR_VISIBILITY;
                        max_y = monster->pos.y + CORRIDOR_VISIBILITY;
                    }
                    else
                    {
                        struct room_data *map_room = &DUNGEON_PTR[0]->room_data[room];
                        min_x = map_room->bottom_right_corner.x - 1;
                        min_y = map_room->bottom_right_corner.y - 1;
                        max_x = map_room->top_left_corner.x + 1;
                        max_y = map_room->top_left_corner.y + 1;
                    }
                    for (s32 y = min_y; y <= max_y; y++)
                    {
                        for (s32 x = min_x; x <= max_x; x++)
                        {
                            struct entity *object = GetTileSafe(x, y)->object;
                            if (object && GetEntityType(object) == ENTITY_ITEM)
                            {
                                pokemon_info_2->ai_target.ai_objective = AI_TAKE_ITEM;
                                pokemon_info_2->ai_target.ai_target_pos.x = x;
                                pokemon_info_2->ai_target.ai_target_pos.y = y;
                                pokemon_info_2->ai_target.ai_target = NULL;
                                pokemon_info_2->ai_target.ai_target_spawn_genid = 0;
                                pokemon_info_2->random_movement = FALSE;
                                has_action = TRUE;
                                goto end_choose_target_position;
                            }
                        }
                    }
                }

                if (!HasDropeyeStatus(monster) && (u8) (pokemon_info_2->ai_target.ai_objective + 0xFF) <= 1)
                {
                    if (pokemon_info_2->ai_target.ai_target)
                    {
                        if (pokemon_info_2->ai_target.ai_target->spawn_genid == pokemon_info_2->ai_target.ai_target_spawn_genid)
                        {
                            struct monster *target_data = GetEntInfo(pokemon_info_2->ai_target.ai_target);
                            for (s32 i = 0; i < NUM_PREV_POS; i++)
                            {
                                if (CanTargetPosition(monster, &target_data->prev_pos[i]))
                                {
                                    pokemon_info_2->ai_target.ai_objective = AI_CHASE_REMEMBERED_TARGET;
                                    pokemon_info_2->ai_target.ai_target_pos = target_data->prev_pos[i];
                                    pokemon_info_2->random_movement = FALSE;
                                    has_action = TRUE;
                                    goto end_choose_target_position;
                                }
                            }
                        }
                        else
                        {
                            pokemon_info_2->ai_target.ai_objective = AI_STAND_STILL;
                            pokemon_info_2->ai_target.ai_target = NULL;
                            pokemon_info_2->ai_target.ai_target_spawn_genid = 0;
                        }
                    }
                }
                CalculateAiTargetPos(monster);
                has_action = TRUE;
            }
            end_choose_target_position:

            if (!has_action)
                pokemon_info->action.action_id = ACTION_NOTHING;
            else
            {
                // DecideMovement function from RT.
                struct monster *pokemon_info_2 = GetEntInfo(monster);
                pokemon_info_2->target_pos = pokemon_info_2->ai_target.ai_target_pos;

                if (monster->pos.x == pokemon_info_2->ai_target.ai_target_pos.x &&
                    monster->pos.y == pokemon_info_2->ai_target.ai_target_pos.y)
                {
                    SetMonsterActionFields(&pokemon_info_2->action, ACTION_PASS_TURN);
                    return;
                }

                if (IsTeamMemberOnFirstTurnInFixedRoom(pokemon_info))
                    return;

                s32 direction = GetDirectionTowardsPosition(&monster->pos, &pokemon_info_2->ai_target.ai_target_pos);
                if (ShouldAvoidFirstHit(monster, pokemon_info_2->ai_target.ai_targeting_enemy))
                {
                    if (pokemon_info_2->ai_target.ai_objective == AI_CHASE_TARGET &&
                        IsPositionWithinTwoTiles(&monster->pos, &pokemon_info_2->ai_target.ai_target_pos))
                    {
                        s32 distance = GetChebyshevDistance(&monster->pos, &pokemon_info_2->ai_target.ai_target_pos);
                        if (distance == 2)
                        {
                            SetMonsterActionFields(&pokemon_info_2->action, ACTION_PASS_TURN);
                            return;
                        }
                        else if (distance < 2)
                        {
                            direction += 4;
                            direction &= DIRECTION_MASK;
                        }
                    }
                }
                else if (pokemon_info_2->ai_target.ai_turning_around)
                {
                    direction += 4;
                    direction &= DIRECTION_MASK;
                }

                bool8 pokemon_in_front;
                if (CanAiMonsterMoveInDirection(monster, direction, &pokemon_in_front))
                {
                    SetActionPassTurnOrWalk(&pokemon_info_2->action, pokemon_info_2->id);
                    pokemon_info_2->action.direction = direction & DIRECTION_MASK;
                    return;
                }
                else if (pokemon_in_front)
                {
                    if (!pokemon_info_2->is_not_team_member && !pokemon_info_2->ai_next_to_target)
                    {
                        pokemon_info_2->ai_target.ai_not_next_to_target = TRUE;
                        pokemon_info_2->ai_ally_skip = TRUE;
                        SetMonsterActionFields(&pokemon_info_2->action, ACTION_PASS_TURN);
                        pokemon_info_2->waiting = TRUE;
                        return;
                    }

                    if (monster->pos.x + DIRECTIONS_XY[direction].x == pokemon_info_2->ai_target.ai_target_pos.x &&
                        monster->pos.y + DIRECTIONS_XY[direction].y == pokemon_info_2->ai_target.ai_target_pos.y)
                    {
                        SetMonsterActionFields(&pokemon_info_2->action, ACTION_PASS_TURN);
                        pokemon_info_2->waiting = TRUE;
                        return;
                    }

                    pokemon_info_2->ai_target.ai_not_next_to_target = TRUE;
                }

                struct can_move_in_direction_info can_move_in_direction_info[6];
                can_move_in_direction_info[TURN_LEFT_45].try_turn = can_move_in_direction_info[TURN_RIGHT_45].try_turn = can_move_in_direction_info[TURN_LEFT_90].try_turn = can_move_in_direction_info[TURN_RIGHT_90].try_turn = can_move_in_direction_info[TURN_LEFT_135].try_turn = TRUE;

                if (!pokemon_info_2->is_not_team_member && (direction & 1) != 0)
                {
                    s32 target_distance_x = abs(monster->pos.x - pokemon_info_2->ai_target.ai_target_pos.x);
                    s32 target_distance_y = abs(monster->pos.y - pokemon_info_2->ai_target.ai_target_pos.y);
                    if (target_distance_x <= 2 && target_distance_y <= 2 && target_distance_x != target_distance_y)
                    {
                        if ((direction & 2) != 0)
                        {
                            if (target_distance_x < target_distance_y)
                                can_move_in_direction_info[TURN_RIGHT_45].try_turn = FALSE;
                            else
                                can_move_in_direction_info[TURN_LEFT_45].try_turn = FALSE;
                        }
                        else
                        {
                            if (target_distance_x < target_distance_y)
                                can_move_in_direction_info[TURN_LEFT_45].try_turn = FALSE;
                            else
                                can_move_in_direction_info[TURN_RIGHT_45].try_turn = FALSE;
                        }
                    }
                }

                s32 turn_limit;
                if (GetTile(monster->pos.x, monster->pos.y)->terrain_flags & TERRAIN_TYPE_UNBREAKABLE)
                    turn_limit = TURN_LEFT_135;
                else
                    turn_limit = TURN_LEFT_90;

                if (ShouldMonsterRunAwayAndShowEffectOutlawCheck(monster, show_run_away_effect) || pokemon_info_2->ai_target.ai_turning_around)
                    turn_limit = TURN_LEFT_135;

                for (s32 i = TURN_LEFT_45; i < turn_limit; i++)
                {
                    can_move_in_direction_info[i].direction = (FACING_DIRECTION_INCREMENTS[i] + direction) & DIRECTION_MASK;
                    can_move_in_direction_info[i].can_move_in_direction = CanAiMonsterMoveInDirection(monster, can_move_in_direction_info[i].direction, &can_move_in_direction_info[i].pokemon_in_front);
                    if (!can_move_in_direction_info[i].can_move_in_direction && !can_move_in_direction_info[i].pokemon_in_front)
                    {
                        can_move_in_direction_info[TURN_RIGHT_45].try_turn = TRUE;
                        can_move_in_direction_info[TURN_LEFT_45].try_turn = TRUE;
                    }
                }

                for (s32 i = TURN_LEFT_45; i < turn_limit; i++)
                {
                    if (can_move_in_direction_info[i].can_move_in_direction && can_move_in_direction_info[i].try_turn)
                    {
                        SetActionPassTurnOrWalk(&pokemon_info_2->action, pokemon_info_2->id);
                        pokemon_info_2->action.direction = can_move_in_direction_info[i].direction & DIRECTION_MASK;
                        return;
                    }
                    if (can_move_in_direction_info[i].pokemon_in_front)
                        pokemon_info_2->ai_target.ai_not_next_to_target = TRUE;
                }

                SetMonsterActionFields(&pokemon_info_2->action, ACTION_PASS_TURN);
                pokemon_info_2->waiting = TRUE;
                if (pokemon_info_2->is_team_leader)
                {
                    pokemon_info_2->ai_target.ai_not_next_to_target = FALSE;
                    pokemon_info_2->ai_ally_skip = FALSE;
                }
                else if (pokemon_info_2->ai_target.ai_not_next_to_target)
                    pokemon_info_2->ai_ally_skip = TRUE;
            }
        }
    }
}
#else
asm void AiMovement(struct entity *monster, bool8 show_run_away_effect)
{
#ifdef JAPAN
#define AI_MOVEMENT_OFFSET -4
#define AI_MOVEMENT_OFFSET_2 -0xA4
#else
#define AI_MOVEMENT_OFFSET 0
#define AI_MOVEMENT_OFFSET_2 0
#endif
	stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
	sub sp, sp, #0x88
	mov r4, r0
	ldr r8, [r4, #0xb4]
	mov r2, #0
	strb r2, [r8, #0x7d]
	str r1, [sp]
	strb r2, [r8, #0x7e]
	mov r1, #7
	strb r2, [r8, #0x7f]
	bl IsTacticSet
	cmp r0, #0
	beq _01FFA428
	ldrsh r2, [r8, #0x12]
	ldrsh r1, [r8, #0x16]
	ldr r0, =0x000003E7
	add r2, r2, r1
	cmp r2, r0
	movgt r2, r0
	ldrsh r1, [r8, #0x10]
	add r0, r2, r2, lsr #31
	cmp r1, r0, asr #1
	movle r0, #0
	strleh r0, [r8, #0x4a]
	ble _01FFB2A4
_01FFA428:
	mov r0, r4
	mov r1, #9
	bl IsTacticSet
	cmp r0, #0
	bne _01FFA44C
	mov r0, r4
	bl IsSecretBazaarNpc
	cmp r0, #0
	beq _01FFA458
_01FFA44C:
	mov r0, #0
	strh r0, [r8, #0x4a]
	b _01FFB2A4
_01FFA458:
	ldrb r0, [r8, #7]
	cmp r0, #0
	bne _01FFA494
	add r0, r8, #0x100
	ldrh r1, [r0, #0x46 + AI_MOVEMENT_OFFSET]
	sub r2, sp, #4
	strh r1, [r2]
	ldrh r0, [r0, #0x48 + AI_MOVEMENT_OFFSET]
	strh r0, [r2, #2]
	ldr r0, [r2]
	bl CeilFixedPoint
	cmp r0, #0
	moveq r0, #0
	streqh r0, [r8, #0x4a]
	beq _01FFB2A4
_01FFA494:
	ldrb r0, [r8, #0xbc]
	cmp r0, #7
	bne _01FFA4D4
	ldrsh r1, [r8, #2]
	add r0, r8, #0x4a
	bl SetActionPassTurnOrWalk
	mov r0, #8
	bl DungeonRandInt
	strb r0, [r8, #0x4c]
	ldrsh r1, [r4, #4]
	add r0, r8, #0x100
	strh r1, [r0, #0x7e + AI_MOVEMENT_OFFSET]
	ldrsh r1, [r4, #6]
	sub r1, r1, #1
	strh r1, [r0, #0x80 + AI_MOVEMENT_OFFSET]
	b _01FFB2A4
_01FFA4D4:
	ldr r1, [sp]
	mov r0, r4
	bl ShouldMonsterRunAwayAndShowEffectOutlawCheck
	cmp r0, #0
	beq _01FFA9A8
	ldr r9, [r4, #0xb4]
	ldrb r5, [r4, #0x25]
	ldrb r0, [r9, #0xbc]
	ldr r11, =0x000F423F
	cmp r0, #3
	bne _01FFA550
	mov r0, r4
	bl ShouldMonsterHeadToStairs
	cmp r0, #0
	beq _01FFA550
	ldr r3, =DUNGEON_PTR
	add r2, r9, #0x100
	ldr r1, [r3]
	mov r0, #1
	add r1, r1, #0xcc00
	ldrh r5, [r1, #0xe4 + AI_MOVEMENT_OFFSET_2]
	strh r5, [r9, #0x8c]
	ldrh r1, [r1, #0xe6 + AI_MOVEMENT_OFFSET_2]
	strh r1, [r9, #0x8e]
	ldr r1, [r3]
	add r1, r1, #0xcc00
	ldrh r3, [r1, #0xe4 + AI_MOVEMENT_OFFSET_2]
	strh r3, [r2, #0x7e + AI_MOVEMENT_OFFSET]
	ldrh r1, [r1, #0xe6 + AI_MOVEMENT_OFFSET_2]
	strh r1, [r2, #0x80 + AI_MOVEMENT_OFFSET]
	b _01FFAF28
_01FFA550:
	ldr r0, =DUNGEON_PTR
	ldr r1, [r0]
	add r0, r1, #0x3000
	ldrb r0, [r0, #0xe38 + AI_MOVEMENT_OFFSET_2]
	cmp r0, #0
	beq _01FFA580
	add r0, r1, #0x378 + AI_MOVEMENT_OFFSET_2
	add r0, r0, #0x12800
	str r0, [sp, #0x2c]
	mov r0, #0x14
	str r0, [sp, #0x28]
	b _01FFA5C4
_01FFA580:
	ldrb r0, [r9, #6]
	cmp r0, #0
	beq _01FFA5B0
	ldrb r0, [r9, #8]
	cmp r0, #0
	bne _01FFA5B0
	add r0, r1, #0x328 + AI_MOVEMENT_OFFSET_2
	add r0, r0, #0x12800
	str r0, [sp, #0x2c]
	mov r0, #4
	str r0, [sp, #0x28]
	b _01FFA5C4
_01FFA5B0:
	add r0, r1, #0x338 + AI_MOVEMENT_OFFSET_2
	add r0, r0, #0x12800
	str r0, [sp, #0x2c]
	mov r0, #0x10
	str r0, [sp, #0x28]
_01FFA5C4:
	mov r0, #0xff
	mov r7, #0
	str r0, [sp, #0x24]
	add r0, r9, #0x100
	mov r10, r7
	str r0, [sp, #0x4c]
	b _01FFA68C
_01FFA5E0:
	ldr r0, [sp, #0x2c]
	ldr r6, [r0, r10, lsl #2]
	mov r0, r6
	bl EntityIsValid__0230827C
	cmp r0, #0
	beq _01FFA688
	mov r0, r4
	mov r1, r6
	bl CanSeeTarget
	cmp r0, #0
	beq _01FFA688
	ldr r0, =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x3000
	ldrb r0, [r0, #0xe38 + AI_MOVEMENT_OFFSET_2]
	cmp r0, #0
	beq _01FFA640
	mov r0, r4
	mov r1, r6
	mov r2, #0
	mov r3, #1
	bl GetTreatmentBetweenMonsters
	cmp r0, #1
	bne _01FFA688
_01FFA640:
	add r0, r4, #4
	add r1, r6, #4
	bl GetChebyshevDistance
	cmp r11, r0
	ble _01FFA688
	mov r11, r0
	ldrb r0, [r6, #0x25]
	mov r7, r6
	str r0, [sp, #0x24]
	ldrh r0, [r6, #4]
	strh r0, [r9, #0x8c]
	ldrh r0, [r6, #6]
	strh r0, [r9, #0x8e]
	ldrh r1, [r6, #4]
	ldr r0, [sp, #0x4c]
	strh r1, [r0, #0x7e + AI_MOVEMENT_OFFSET]
	ldrh r1, [r6, #6]
	strh r1, [r0, #0x80 + AI_MOVEMENT_OFFSET]
_01FFA688:
	add r10, r10, #1
_01FFA68C:
	ldr r0, [sp, #0x28]
	cmp r10, r0
	blt _01FFA5E0
	ldr r0, =0x000F423F
	cmp r11, r0
	beq _01FFA99C
	ldr r0, [sp, #0x24]
	cmp r5, r0
	bne _01FFA96C
	cmp r5, #0xff
	beq _01FFA96C
	ldrsh r0, [r4, #4]
	ldrsh r1, [r4, #6]
	bl GetTile
	ldrh r0, [r0]
	tst r0, #8
	beq _01FFA7C0
	ldrsh r1, [r4, #4]
	ldrsh r0, [r4, #6]
	mov r7, #0
	strh r1, [sp, #0x52]
	strh r0, [sp, #0x54]
	add r10, sp, #0x51
	ldr r6, =DIRECTIONS_XY
	b _01FFA74C
_01FFA6F0:
	mov r1, r7, lsl #2
	add r0, r6, r7, lsl #2
	ldrsh r3, [r4, #4]
	ldrsh r2, [r6, r1]
	ldrsh r1, [r4, #6]
	ldrsh r0, [r0, #2]
	add r2, r3, r2
	strh r2, [sp, #0x52]
	add r0, r1, r0
	strh r0, [sp, #0x54]
	ldrsh r0, [sp, #0x52]
	ldrsh r1, [sp, #0x54]
	bl GetTile
	ldrb r0, [r0, #7]
	cmp r5, r0
	beq _01FFA748
	mov r0, r4
	mov r1, r7
	mov r2, r10
	bl CanAiMonsterMoveInDirection
	cmp r0, #0
	bne _01FFA754
_01FFA748:
	add r7, r7, #1
_01FFA74C:
	cmp r7, #8
	blt _01FFA6F0
_01FFA754:
	cmp r7, #8
	bne _01FFA7A0
	mov r0, #8
	bl DungeonRandInt
	mov r1, #6
	strb r1, [r9, #0x7c]
	mov r3, r0, lsl #2
	ldr r0, =DIRECTIONS_XY
	ldrsh r5, [r4, #4]
	ldrsh r2, [r0, r3]
	ldr r1, =DIRECTIONS_XY + 2
	mov r0, #1
	add r2, r5, r2
	strh r2, [r9, #0x8c]
	ldrsh r2, [r4, #6]
	ldrsh r1, [r1, r3]
	add r1, r2, r1
	strh r1, [r9, #0x8e]
	b _01FFAF28
_01FFA7A0:
	ldrh r0, [sp, #0x52]
	mov r1, #5
	strb r1, [r9, #0x7c]
	ldrh r1, [sp, #0x54]
	strh r0, [r9, #0x8c]
	mov r0, #1
	strh r1, [r9, #0x8e]
	b _01FFAF28
_01FFA7C0:
	ldr r0, =DUNGEON_PTR
	ldrsh r10, [r4, #6]
	ldr r1, [r0]
	ldrsh r2, [r7, #6]
	add r0, r1, #0x2a8 + AI_MOVEMENT_OFFSET_2
	add r1, r1, r5, lsl #1
#ifdef JAPAN
	add r1, r1, #0xf100
	ldrsh r1, [r1, #0xc4]
#else
	add r1, r1, #0xf200
	ldrsh r1, [r1, #0x68]
#endif
	add r3, r0, #0xf000
	sub r0, r2, r10
	str r1, [sp, #0x30]
	ldr r1, =0xFFF0BDC1
	add r6, r3, r5, lsl #7
	str r1, [sp, #0x38]
	mov r1, #0
	str r1, [sp, #0x34]
	bl abs
	ldrsh r11, [r4, #4]
	ldrsh r1, [r7, #4]
	mov r5, r0
	sub r0, r1, r11
	bl abs
	str r0, [sp, #8]
	cmp r0, r5
	mvn r0, #0
	strle r5, [sp, #8]
	mov r5, #0
	str r0, [sp, #0x44]
	b _01FFA924
_01FFA834:
	add r0, r6, r5, lsl #2
	ldrsh r0, [r0, #2]
	ldrsh r1, [r7, #6]
	str r0, [sp, #0x10]
	sub r0, r1, r0
	str r1, [sp, #0xc]
	bl abs
	str r0, [sp, #0x40]
	mov r0, r5, lsl #2
	ldrsh r0, [r6, r0]
	ldrsh r1, [r7, #4]
	str r0, [sp, #0x18]
	sub r0, r1, r0
	str r1, [sp, #0x14]
	bl abs
	ldr r1, [sp, #0x40]
	str r0, [sp, #4]
	cmp r0, r1
	movle r0, r1
	strle r0, [sp, #4]
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x44]
	sub r0, r0, r11
	str r0, [sp, #0x3c]
	ldr r2, [sp, #0x3c]
	ldr r0, [sp, #0x10]
	cmp r2, r1
	strlt r1, [sp, #0x3c]
	ldr r1, [sp, #0x44]
	sub r0, r0, r10
	cmp r0, r1
	movlt r0, r1
	ldr r1, [sp, #0x3c]
	cmp r1, #1
	movgt r1, #1
	strgt r1, [sp, #0x3c]
	cmp r0, #1
	movgt r0, #1
	add r1, r10, r0
	ldr r0, [sp, #0xc]
	sub r0, r0, r1
	bl abs
	ldr r1, [sp, #0x3c]
	str r0, [sp, #0x48]
	ldr r0, [sp, #0x14]
	add r1, r11, r1
	sub r0, r0, r1
	bl abs
	ldr r1, [sp, #0x48]
	cmp r0, r1
	movle r0, r1
	ldr r1, [sp, #8]
	cmp r0, r1
	blt _01FFA920
	ldr r1, [sp, #0x38]
	ldr r0, [sp, #4]
	cmp r1, r0
	strlt r0, [sp, #0x38]
	strlt r5, [sp, #0x34]
_01FFA920:
	add r5, r5, #1
_01FFA924:
	ldr r0, [sp, #0x30]
	cmp r5, r0
	blt _01FFA834
	ldr r0, [sp, #0x38]
	cmp r0, #0
	blt _01FFA96C
	mov r0, #5
	strb r0, [r9, #0x7c]
	ldr r0, [sp, #0x34]
	mov r0, r0, lsl #2
	ldrsh r2, [r6, r0]
	ldr r0, [sp, #0x34]
	add r1, r6, r0, lsl #2
	strh r2, [r9, #0x8c]
	ldrsh r1, [r1, #2]
	mov r0, #1
	strh r1, [r9, #0x8e]
	b _01FFAF28
_01FFA96C:
	mov r0, #5
	strb r0, [r9, #0x7c]
	ldrsh r2, [r4, #4]
	ldrsh r1, [r7, #4]
	mov r0, #1
	rsb r1, r1, r2, lsl #1
	strh r1, [r9, #0x8c]
	ldrsh r2, [r4, #6]
	ldrsh r1, [r7, #6]
	rsb r1, r1, r2, lsl #1
	strh r1, [r9, #0x8e]
	b _01FFAF28
_01FFA99C:
	mov r0, r4
	bl CalculateAiTargetPos
	b _01FFAF28
_01FFA9A8:
	mov r0, r4
	ldr r7, [r4, #0xb4]
	bl EntityIsValid__0230827C
	cmp r0, #0
	moveq r0, #0
	beq _01FFAAB8
	mov r0, r4
	bl CheckVariousConditions__0230156C
	cmp r0, #0
	movne r0, #0
	bne _01FFAAB8
	mov r0, r4
	bl GetTileAtEntity
	mov r5, r0
	ldr r6, [r5, #0x10]
	cmp r6, #0
	moveq r0, #0
	beq _01FFAAB8
	ldr r0, [r6]
	cmp r0, #6
	addls pc, pc, r0, lsl #2
	b _01FFAAB4
_01FFAA00:
	b _01FFAAB4
	b _01FFAAB4
	b _01FFAAB4
	b _01FFAA1C
	b _01FFAAB4
	b _01FFAAB4
	b _01FFAAB4
_01FFAA1C:
	ldrb r0, [r7, #7]
	cmp r0, #0
	bne _01FFAAB4
	ldrb r0, [r7, #0x62]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	bne _01FFAAB4
	ldrh r0, [r5]
	tst r0, #3
	bne _01FFAA58
	ldrb r0, [r7, #6]
	cmp r0, #0
	bne _01FFAAB4
_01FFAA58:
	ldrb r0, [r7, #6]
	cmp r0, #0
	bne _01FFAA84
	bl IsBagFull
	cmp r0, #0
	bne _01FFAAB4
	ldrh r0, [r5]
	tst r0, #0x20
	bne _01FFAAB4
	mov r0, #1
	b _01FFAAB8
_01FFAA84:
	mov r0, r6
	bl GetItemInfo
	bl IsItemUnkMissionItem2
	cmp r0, #0
	movne r0, #0
	bne _01FFAAB8
	mov r0, r6
	bl GetItemInfo
	ldrb r0, [r0]
	tst r0, #2
	moveq r0, #1
	beq _01FFAAB8
_01FFAAB4:
	mov r0, #0
_01FFAAB8:
	cmp r0, #0
	movne r0, #0x3f
	strneh r0, [r8, #0x4a]
	bne _01FFB2A4
	mov r0, r4
	ldr r10, [r4, #0xb4]
	bl ShouldMonsterFollowLeader
	cmp r0, #0
	bne _01FFAD14
	ldr r0, =DUNGEON_PTR
	ldr r1, [r0]
	add r0, r1, #0x3000
	ldrb r0, [r0, #0xe38 + AI_MOVEMENT_OFFSET_2]
	cmp r0, #0
	addne r0, r1, #0x378 + AI_MOVEMENT_OFFSET_2
	addne r9, r0, #0x12800
	movne r11, #0x14
	bne _01FFAB30
	ldrb r0, [r10, #6]
	cmp r0, #0
	beq _01FFAB24
	ldrb r0, [r10, #8]
	cmp r0, #0
	addeq r0, r1, #0x328 + AI_MOVEMENT_OFFSET_2
	addeq r9, r0, #0x12800
	moveq r11, #4
	beq _01FFAB30
_01FFAB24:
	add r0, r1, #0x338 + AI_MOVEMENT_OFFSET_2
	add r9, r0, #0x12800
	mov r11, #0x10
_01FFAB30:
	mov r0, r4
	bl CanMoveThroughWalls
	mvn r6, #0
	str r0, [sp, #0x20]
	add r0, r6, #0x3e8
	str r0, [sp, #0x1c]
	mov r7, #0
	b _01FFAC64
_01FFAB50:
	ldr r5, [r9, r7, lsl #2]
	mov r0, r5
	bl EntityIsValid__0230827C
	cmp r0, #0
	beq _01FFAC60
	ldr r0, [r5, #0xb4]
	ldrb r1, [r0, #0xbc]
	cmp r1, #6
	bhi _01FFAC60
	ldr r1, =DUNGEON_PTR
	ldr r1, [r1]
	add r1, r1, #0x3000
	ldrb r1, [r1, #0xe38 + AI_MOVEMENT_OFFSET_2]
	cmp r1, #0
	beq _01FFABAC
	mov r0, r4
	mov r1, r5
	mov r2, #0
	mov r3, #1
	bl GetTreatmentBetweenMonsters
	cmp r0, #1
	bne _01FFAC60
	b _01FFABC0
_01FFABAC:
	ldrb r1, [r10, #6]
	cmp r1, #0
	ldreqb r0, [r0, #0xc4]
	cmpeq r0, #6
	beq _01FFAC60
_01FFABC0:
	ldr r0, [r5, #0xb4]
	ldrb r0, [r0, #9]
	cmp r0, #1
	beq _01FFAC60
	ldr r0, [sp, #0x20]
	cmp r0, #0
	beq _01FFAC24
	ldrsh r1, [r4, #4]
	ldrsh r0, [r5, #4]
	sub r0, r1, r0
	bl abs
	cmp r0, #5
	bgt _01FFAC0C
	ldrsh r1, [r4, #6]
	ldrsh r0, [r5, #6]
	sub r0, r1, r0
	bl abs
	cmp r0, #5
	ble _01FFAC38
_01FFAC0C:
	mov r0, r4
	mov r1, r5
	bl CanTargetEntity
	cmp r0, #0
	beq _01FFAC60
	b _01FFAC38
_01FFAC24:
	mov r0, r4
	mov r1, r5
	bl CanTargetEntity
	cmp r0, #0
	beq _01FFAC60
_01FFAC38:
	add r1, r5, #4
	add r0, r4, #4
	bl GetChebyshevDistance
	ldr r1, [sp, #0x1c]
	cmp r1, r0
	ble _01FFAC60
	str r0, [sp, #0x1c]
	mov r6, r7
	cmp r0, #2
	blt _01FFAC6C
_01FFAC60:
	add r7, r7, #1
_01FFAC64:
	cmp r7, r11
	blt _01FFAB50
_01FFAC6C:
	cmp r6, #0
	blt _01FFAD14
	mov r2, #1
	strb r2, [r10, #0x7c]
	ldr r7, [r9, r6, lsl #2]
	mov r0, r4
	ldrh r5, [r7, #4]
	mov r3, #0
	mov r1, #8
	strh r5, [r10, #0x8c]
	ldrh r5, [r7, #6]
	strh r5, [r10, #0x8e]
	ldr r5, [r9, r6, lsl #2]
	str r5, [r10, #0x84]
	ldr r5, [r9, r6, lsl #2]
	ldrh r5, [r5, #0x26]
	strh r5, [r10, #0x80]
	strb r2, [r10, #0x7e]
	str r3, [r10, #0x120 + AI_MOVEMENT_OFFSET]
	bl IsTacticSet
	cmp r0, #0
	beq _01FFAD0C
	mov r0, r4
	bl CanSeeTeammate
	cmp r0, #0
	bne _01FFAD0C
	ldr r5, [r9, r6, lsl #2]
	ldrsh r1, [r4, #4]
	ldrsh r0, [r5, #4]
	sub r0, r1, r0
	bl abs
	cmp r0, #1
	bgt _01FFAD0C
	ldrsh r1, [r4, #6]
	ldrsh r0, [r5, #6]
	sub r0, r1, r0
	bl abs
	cmp r0, #1
	movle r0, #1
	strleb r0, [r10, #0x7f]
_01FFAD0C:
	mov r0, #1
	b _01FFAF28
_01FFAD14:
	mov r0, r4
	mov r1, #1
	bl IsTacticSet
	cmp r0, #0
	bne _01FFAD7C
	ldrb r0, [r10, #6]
	cmp r0, #0
	bne _01FFAE68
	mov r0, r4
	bl GetLeaderIfVisible
	mov r5, r0
	bl EntityIsValid__0230827C
	cmp r0, #0
	beq _01FFAE68
	mov r0, #1
	strb r0, [r10, #0x7c]
	ldrh r2, [r5, #4]
	mov r1, #0
	strh r2, [r10, #0x8c]
	ldrh r2, [r5, #6]
	strh r2, [r10, #0x8e]
	str r5, [r10, #0x84]
	ldrh r2, [r5, #0x26]
	strh r2, [r10, #0x80]
	str r1, [r10, #0x120 + AI_MOVEMENT_OFFSET]
	b _01FFAF28
_01FFAD7C:
	ldrb r0, [r10, #7]
	cmp r0, #0
	beq _01FFAE68
	bl GetVisibilityRange
	ldrsh r0, [r4, #4]
	ldrsh r1, [r4, #6]
	bl GetTile
	ldrb r2, [r0, #7]
	cmp r2, #0xff
	bne _01FFADC0
	ldrsh r1, [r4, #4]
	ldrsh r0, [r4, #6]
	sub r11, r1, #2
	sub r9, r0, #2
	add r6, r1, #2
	add r5, r0, #2
	b _01FFAE60
_01FFADC0:
	ldr r0, =DUNGEON_PTR
	mov r1, #0x1c
	ldr r0, [r0]
	add r0, r0, #0x2e8 + AI_MOVEMENT_OFFSET_2
	add r0, r0, #0xec00
	mla r0, r2, r1, r0
	ldrsh r3, [r0, #2]
	ldrsh r2, [r0, #4]
	ldrsh r1, [r0, #6]
	ldrsh r0, [r0, #8]
	sub r11, r3, #1
	sub r9, r2, #1
	add r6, r1, #1
	add r5, r0, #1
	b _01FFAE60
_01FFADFC:
	mov r7, r11
	b _01FFAE54
_01FFAE04:
	mov r0, r7
	mov r1, r9
	bl GetTileSafe
	ldr r0, [r0, #0x10]
	cmp r0, #0
	beq _01FFAE50
	ldr r0, [r0]
	cmp r0, #3
	bne _01FFAE50
	mov r0, #7
	strb r0, [r10, #0x7c]
	strh r7, [r10, #0x8c]
	strh r9, [r10, #0x8e]
	mov r0, #0
	str r0, [r10, #0x84]
	strh r0, [r10, #0x80]
	str r0, [r10, #0x120 + AI_MOVEMENT_OFFSET]
	mov r0, #1
	b _01FFAF28
_01FFAE50:
	add r7, r7, #1
_01FFAE54:
	cmp r7, r6
	ble _01FFAE04
	add r9, r9, #1
_01FFAE60:
	cmp r9, r5
	ble _01FFADFC
_01FFAE68:
	mov r0, r4
	bl HasDropeyeStatus
	cmp r0, #0
	bne _01FFAF1C
	ldrb r0, [r10, #0x7c]
	add r0, r0, #0xff
	and r0, r0, #0xff
	cmp r0, #1
	bhi _01FFAF1C
	ldr r2, [r10, #0x84]
	cmp r2, #0
	beq _01FFAF1C
	ldrh r1, [r2, #0x26]
	ldrh r0, [r10, #0x80]
	cmp r1, r0
	bne _01FFAF08
	ldr r7, [r2, #0xb4]
	mov r6, #0
	add r5, r7, #0x6a
	b _01FFAEFC
_01FFAEB8:
	mov r0, r4
	add r1, r5, r6, lsl #2
	bl CanTargetPosition
	cmp r0, #0
	beq _01FFAEF8
	mov r0, #2
	strb r0, [r10, #0x7c]
	add r3, r7, r6, lsl #2
	ldrh r2, [r3, #0x6a]
	mov r1, #0
	mov r0, #1
	strh r2, [r10, #0x8c]
	ldrh r2, [r3, #0x6c]
	strh r2, [r10, #0x8e]
	str r1, [r10, #0x120 + AI_MOVEMENT_OFFSET]
	b _01FFAF28
_01FFAEF8:
	add r6, r6, #1
_01FFAEFC:
	cmp r6, #4
	blt _01FFAEB8
	b _01FFAF1C
_01FFAF08:
	mov r0, #6
	strb r0, [r10, #0x7c]
	mov r0, #0
	str r0, [r10, #0x84]
	strh r0, [r10, #0x80]
_01FFAF1C:
	mov r0, r4
	bl CalculateAiTargetPos
	mov r0, #1
_01FFAF28:
	cmp r0, #0
	moveq r0, #0
	streqh r0, [r8, #0x4a]
	beq _01FFB2A4
	ldr r9, [r4, #0xb4]
	ldrh r1, [r9, #0x8c]
	add r0, r9, #0x100
	strh r1, [r0, #0x7e + AI_MOVEMENT_OFFSET]
	ldrh r1, [r9, #0x8e]
	strh r1, [r0, #0x80 + AI_MOVEMENT_OFFSET]
	ldrsh r1, [r4, #4]
	ldrsh r0, [r9, #0x8c]
	cmp r1, r0
	ldreqsh r1, [r4, #6]
	ldreqsh r0, [r9, #0x8e]
	cmpeq r1, r0
	bne _01FFAF7C
	add r0, r9, #0x4a
	mov r1, #1
	bl SetMonsterActionFields
	b _01FFB2A4
_01FFAF7C:
	mov r0, r9
	bl IsTeamMemberOnFirstTurnInFixedRoom
	cmp r0, #0
	bne _01FFB2A4
	add r0, r4, #4
	add r1, r9, #0x8c
	bl GetDirectionTowardsPosition
	mov r7, r0
	ldrb r1, [r9, #0x7e]
	mov r0, r4
	bl ShouldAvoidFirstHit
	cmp r0, #0
	beq _01FFB000
	ldrb r0, [r9, #0x7c]
	cmp r0, #1
	bne _01FFB010
	add r0, r4, #4
	add r1, r9, #0x8c
	bl IsPositionWithinTwoTiles
	cmp r0, #0
	beq _01FFB010
	add r0, r4, #4
	add r1, r9, #0x8c
	bl GetChebyshevDistance
	cmp r0, #2
	bne _01FFAFF4
	add r0, r9, #0x4a
	mov r1, #1
	bl SetMonsterActionFields
	b _01FFB2A4
_01FFAFF4:
	addlt r0, r7, #4
	andlt r7, r0, #7
	b _01FFB010
_01FFB000:
	ldrb r0, [r9, #0x7f]
	cmp r0, #0
	addne r0, r7, #4
	andne r7, r0, #7
_01FFB010:
	add r2, sp, #0x50
	mov r0, r4
	mov r1, r7
	bl CanAiMonsterMoveInDirection
	cmp r0, #0
	beq _01FFB040
	ldrsh r1, [r9, #2]
	add r0, r9, #0x4a
	bl SetActionPassTurnOrWalk
	and r0, r7, #7
	strb r0, [r9, #0x4c]
	b _01FFB2A4
_01FFB040:
	ldrb r0, [sp, #0x50]
	cmp r0, #0
	beq _01FFB0DC
	ldrb r0, [r9, #6]
	cmp r0, #0
	ldreqb r0, [r9, #0x14f + AI_MOVEMENT_OFFSET]
	cmpeq r0, #0
	bne _01FFB080
	mov r1, #1
	strb r1, [r9, #0x7d]
	add r0, r9, #0x4a
	strb r1, [r9, #0x14e + AI_MOVEMENT_OFFSET]
	bl SetMonsterActionFields
	mov r0, #1
	strb r0, [r9, #0x151 + AI_MOVEMENT_OFFSET]
	b _01FFB2A4
_01FFB080:
	ldr r0, =DIRECTIONS_XY
	mov r2, r7, lsl #2
	ldrsh r1, [r4, #4]
	ldrsh r0, [r0, r2]
	ldrsh r3, [r9, #0x8c]
	add r0, r1, r0
	cmp r3, r0
	bne _01FFB0D4
	ldr r0, =DIRECTIONS_XY + 2
	ldrsh r1, [r4, #6]
	ldrsh r0, [r0, r2]
	ldrsh r2, [r9, #0x8e]
	add r0, r1, r0
	cmp r2, r0
	bne _01FFB0D4
	add r0, r9, #0x4a
	mov r1, #1
	bl SetMonsterActionFields
	mov r0, #1
	strb r0, [r9, #0x151 + AI_MOVEMENT_OFFSET]
	b _01FFB2A4
_01FFB0D4:
	mov r0, #1
	strb r0, [r9, #0x7d]
_01FFB0DC:
	mov r0, #1
	strb r0, [sp, #0x80]
	strb r0, [sp, #0x78]
	strb r0, [sp, #0x70]
	strb r0, [sp, #0x68]
	strb r0, [sp, #0x60]
	ldrb r0, [r9, #6]
	cmp r0, #0
	bne _01FFB16C
	tst r7, #1
	beq _01FFB16C
	ldrsh r1, [r4, #4]
	ldrsh r0, [r9, #0x8c]
	sub r0, r1, r0
	bl abs
	ldrsh r2, [r4, #6]
	ldrsh r1, [r9, #0x8e]
	mov r5, r0
	sub r0, r2, r1
	bl abs
	cmp r5, #2
	cmple r0, #2
	bgt _01FFB16C
	cmp r5, r0
	beq _01FFB16C
	tst r7, #2
	beq _01FFB15C
	cmp r5, r0
	mov r0, #0
	strltb r0, [sp, #0x68]
	strgeb r0, [sp, #0x60]
	b _01FFB16C
_01FFB15C:
	cmp r5, r0
	mov r0, #0
	strltb r0, [sp, #0x60]
	strgeb r0, [sp, #0x68]
_01FFB16C:
	ldrsh r0, [r4, #4]
	ldrsh r1, [r4, #6]
	bl GetTile
	ldrh r0, [r0]
	ldr r1, [sp]
	tst r0, #0x100
	movne r10, #5
	mov r0, r4
	moveq r10, #3
	bl ShouldMonsterRunAwayAndShowEffectOutlawCheck
	cmp r0, #0
	ldreqb r0, [r9, #0x7f]
	mov r8, #1
	mov r11, r8
	cmpeq r0, #0
	movne r10, #5
	ldr r6, =FACING_DIRECTION_INCREMENTS
	add r5, sp, #0x58
	b _01FFB1FC
_01FFB1B8:
	ldr r0, [r6, r8, lsl #2]
	add r3, r5, r8, lsl #3
	add r0, r7, r0
	and r1, r0, #7
	mov r0, r4
	add r2, r3, #2
	str r1, [r3, #4]
	bl CanAiMonsterMoveInDirection
	add r1, r5, r8, lsl #3
	strb r0, [r1, #1]
	tst r0, #0xff
	ldreqb r0, [r1, #2]
	add r8, r8, #1
	cmpeq r0, #0
	andeq r0, r11, #0xff
	streqb r11, [sp, #0x68]
	streqb r0, [sp, #0x60]
_01FFB1FC:
	cmp r8, r10
	blt _01FFB1B8
	mov r4, #1
	add r2, sp, #0x58
	mov r0, r4
	b _01FFB264
_01FFB214:
	add r1, r2, r4, lsl #3
	ldrb r1, [r1, #1]
	mov r3, r4, lsl #3
	cmp r1, #0
	ldrneb r1, [r2, r3]
	cmpne r1, #0
	beq _01FFB250
	ldrsh r1, [r9, #2]
	add r0, r9, #0x4a
	bl SetActionPassTurnOrWalk
	add r0, sp, #0x5c
	ldr r0, [r0, r4, lsl #3]
	and r0, r0, #7
	strb r0, [r9, #0x4c]
	b _01FFB2A4
_01FFB250:
	add r1, r2, r4, lsl #3
	ldrb r1, [r1, #2]
	add r4, r4, #1
	cmp r1, #0
	strneb r0, [r9, #0x7d]
_01FFB264:
	cmp r4, r10
	blt _01FFB214
	add r0, r9, #0x4a
	mov r1, #1
	bl SetMonsterActionFields
	mov r1, #1
	strb r1, [r9, #0x151 + AI_MOVEMENT_OFFSET]
	ldrb r0, [r9, #7]
	cmp r0, #0
	movne r0, #0
	strneb r0, [r9, #0x7d]
	strneb r0, [r9, #0x14e + AI_MOVEMENT_OFFSET]
	bne _01FFB2A4
	ldrb r0, [r9, #0x7d]
	cmp r0, #0
	strneb r1, [r9, #0x14e + AI_MOVEMENT_OFFSET]
_01FFB2A4:
	add sp, sp, #0x88
	ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
}
#endif

bool8 CalculateAiTargetPos(struct entity *monster)
{
    struct monster *pokemon_info = GetEntInfo(monster);
    enum fixed_room_id fixed_room_id = DUNGEON_PTR[0]->gen_info.fixed_room_id;
    s32 room = monster->room_idx;
    bool8 is_sealed_chamber = FALSE;
    if (fixed_room_id == FIXED_SEALED_CHAMBER ||
        fixed_room_id >= FIXED_CLEAR_SILK_CHAMBER && fixed_room_id < FIXED_LEGENDARY_EXCLUSIVE_CHAMBER_1)
    {
        if (GetTile(monster->pos.x, monster->pos.y)->terrain_flags & TERRAIN_TYPE_UNBREAKABLE)
            is_sealed_chamber = TRUE;
    }

    if (is_sealed_chamber || room == CORRIDOR_ROOM)
    {
        s32 i;
        s32 opposite_facing_dir = (pokemon_info->action.direction + NUM_DIRECTIONS / 2) & DIRECTION_MASK;
        bool8 is_at_junction = FALSE;
        s32 target_facing_dir;
        if (IsAtJunction(monster))
        {
            pokemon_info->action.direction = DungeonRandInt(NUM_DIRECTIONS);
            is_at_junction = TRUE;
        }

        for (i = 0; i < NUM_DIRECTIONS; i++)
        {
            bool8 pokemon_in_front;
            target_facing_dir = (pokemon_info->action.direction + FACING_DIRECTION_INCREMENTS[i]) & DIRECTION_MASK;

            if (is_at_junction && target_facing_dir == opposite_facing_dir)
            {
                continue;
            }

            if (!CanAiMonsterMoveInDirection(monster, target_facing_dir, &pokemon_in_front))
            {
                continue;
            }

            pokemon_info->ai_target.ai_objective = AI_ROAM;
            pokemon_info->ai_target.ai_target_pos.x = monster->pos.x + DIRECTIONS_XY[target_facing_dir].x;
            pokemon_info->ai_target.ai_target_pos.y = monster->pos.y + DIRECTIONS_XY[target_facing_dir].y;
            return TRUE;
        }
    }
    else
    {
        s32 i;
        s32 target_facing_dir;
        s32 natural_junction_list_counts = DUNGEON_PTR[0]->natural_junction_list_counts[room];
        struct position *natural_junction_list = DUNGEON_PTR[0]->natural_junction_list[room];
        if (pokemon_info->random_movement)
        {
            target_facing_dir = DungeonRandInt(NUM_DIRECTIONS);
            pokemon_info->ai_target.ai_objective = AI_STAND_STILL;
            pokemon_info->ai_target.ai_target_pos.x = monster->pos.x + DIRECTIONS_XY[target_facing_dir].x;
            pokemon_info->ai_target.ai_target_pos.y = monster->pos.y + DIRECTIONS_XY[target_facing_dir].y;
            return TRUE;
        }
        else
        {
            if (pokemon_info->ai_target.ai_objective != AI_LEAVE_ROOM)
            {
                if (natural_junction_list_counts == 0)
                {
                    target_facing_dir = DungeonRandInt(NUM_DIRECTIONS);
                    pokemon_info->ai_target.ai_objective = AI_STAND_STILL;
                    pokemon_info->ai_target.ai_target_pos.x = monster->pos.x + DIRECTIONS_XY[target_facing_dir].x;
                    pokemon_info->ai_target.ai_target_pos.y = monster->pos.y + DIRECTIONS_XY[target_facing_dir].y;
                    return TRUE;
                }

                for (i = 0; i < 10; i++)
                {
                    target_facing_dir = DungeonRandInt(natural_junction_list_counts);
                    if (monster->pos.x != natural_junction_list[target_facing_dir].x ||
                        monster->pos.y != natural_junction_list[target_facing_dir].y)
                    {
                        pokemon_info->ai_target.ai_objective = AI_LEAVE_ROOM;
                        pokemon_info->ai_target.ai_target_pos.x = natural_junction_list[target_facing_dir].x;
                        pokemon_info->ai_target.ai_target_pos.y = natural_junction_list[target_facing_dir].y;
                        return TRUE;
                    }
                }
                // If the AI randomly picks the exit it's standing on 10 times,
                // it gives up and exits the way it came.
                // This occurs normally for one-exit rooms, but can happen rarely for multi-exit rooms.
            }
            if (GetTile(monster->pos.x, monster->pos.y)->terrain_flags & TERRAIN_TYPE_NATURAL_JUNCTION)
            {
                s32 i;
                target_facing_dir = DungeonRandInt(NUM_DIRECTIONS);
                for (i = 0; i < NUM_DIRECTIONS; i++, target_facing_dir++)
                {
                    bool8 pokemon_in_front;
                    s32 forward_x, forward_y;
                    target_facing_dir &= DIRECTION_MASK;
                    forward_x = monster->pos.x + DIRECTIONS_XY[target_facing_dir].x;
                    forward_y = monster->pos.y + DIRECTIONS_XY[target_facing_dir].y;
                    if (GetTile(forward_x, forward_y)->room == CORRIDOR_ROOM &&
                        CanAiMonsterMoveInDirection(monster, target_facing_dir, &pokemon_in_front))
                    {
                        pokemon_info->ai_target.ai_objective = AI_ROAM;
                        pokemon_info->ai_target.ai_target_pos.x = forward_x;
                        pokemon_info->ai_target.ai_target_pos.y = forward_y;
                        return TRUE;
                    }
                }
            }
            return TRUE;
        }
    }

    s32 target_facing_dir = DungeonRandInt(NUM_DIRECTIONS);
    pokemon_info->ai_target.ai_objective = AI_STAND_STILL;
    pokemon_info->ai_target.ai_target_pos.x = monster->pos.x + DIRECTIONS_XY[target_facing_dir].x;
    pokemon_info->ai_target.ai_target_pos.y = monster->pos.y + DIRECTIONS_XY[target_facing_dir].y;
    return TRUE;
}
