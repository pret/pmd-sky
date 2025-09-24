#ifndef PMDSKY_DUNGEON_AI_ATTACK_H
#define PMDSKY_DUNGEON_AI_ATTACK_H

#include "dungeon_mode.h"

#define RANGED_ATTACK_RANGE 10

struct ai_possible_move
{
    bool8 can_be_used;
    u8 direction;
    s32 weight;
};

// Stores whether the AI can use an attack in each direction.
extern bool8 AI_CAN_ATTACK_IN_DIRECTION[NUM_DIRECTIONS];
// Stores the directions that the AI can use an attack in. Parallel to AI_POTENTIAL_ATTACK_TARGET_WEIGHTS and AI_POTENTIAL_ATTACK_TARGETS.
extern u8 AI_POTENTIAL_ATTACK_TARGET_DIRECTIONS[NUM_DIRECTIONS];
// Stores the targeting weights for each direction the AI can use an attack in. Parallel to AI_POTENTIAL_ATTACK_TARGET_DIRECTIONS and AI_POTENTIAL_ATTACK_TARGETS.
extern s32 AI_POTENTIAL_ATTACK_TARGET_WEIGHTS[NUM_DIRECTIONS];
// Stores the target entity for each direction the AI can use an attack in. Parallel to AI_POTENTIAL_ATTACK_TARGET_DIRECTIONS and AI_POTENTIAL_ATTACK_TARGET_DIRECTIONS.
extern struct entity *AI_POTENTIAL_ATTACK_TARGETS[NUM_DIRECTIONS];

// Sets all values in AI_CAN_ATTACK_IN_DIRECTION to false.
void ResetAiCanAttackInDirection();
// The AI uses this function to check if a move has any potential targets, to calculate the list of potential targets and to calculate the move's special weight. The weight is calculated using WeightMoveWithIqSkills.
// This function also sets the flag can_be_used on the ai_possible_move struct if it makes sense to use it.
// The weight returned by this function is not the same as GetMoveAiWeight. If the AI does not have Weak-Type Picker, AiConsiderMove is called after the AI has selected which move it will use (using GetMoveAiWeight). It determines whether it makes sense for the AI to actually use the chosen move (i.e., whether targets are in range), and which direction the AI will use the move in if so. The return value of this function is not used anywhere in this case.
// If the AI has Weak-Type Picker, the AI calls this function earlier in the AI logic to determine which move to use, using the returned special weight to find which move has the most advantageous type matchups.
// ai_possible_move: ai_possible_move struct for this move
// monster: Entity pointer
// move: Move pointer
// return: Move's calculated special weight
u32 AiConsiderMove(struct ai_possible_move *ai_possible_move, struct entity *monster, struct move *move);
// Checks if an entity pointer points to a valid entity (not entity type 0, which represents no entity).
bool8 EntityIsValid__02319F8C(struct entity *entity);
// Checks if the specified target is eligible to be targeted by the AI and if so adds it to the list of targets. This function also fills an array that seems to contain the directions in which the user should turn to look at each of the targets in the list, as well as a third unknown array.
// current_num_targets: Number of existing targets in the list
// move_ai_range: Move's AI range field
// user: User entity pointer
// target: Target entity pointer
// move: Move pointer
// check_all_conditions: check_all_conditions parameter to pass to IsAiTargetEligible
// return: New number of targets in the target list
s32 TryAddTargetToAiTargetList(s32 current_num_targets, s32 move_ai_range, struct entity *user, struct entity *target, struct move *move, bool8 check_all_conditions);
// Checks if a given target is eligible to be targeted by the AI with a certain move
// move_ai_range: Move's AI range field
// user: User entity pointer
// target: Target entity pointer
// move: Move pointer
// check_all_conditions True to check all the possible move_ai_condition values, false to only check for move_ai_condition::AI_CONDITION_RANDOM (if the move has a different ai condition, the result will be false).
// return: True if the target is eligible, false otherwise
bool8 IsAiTargetEligible(s32 move_ai_range, struct entity *user, struct entity *target, struct move *move, bool8 check_all_conditions);
// Calculates a move weight used for deciding which target the move should be used on. If the user is an ally, the target is an enemy Pokémon, and the user has Exp. Go-Getter, Efficiency Expert, or Weak-Type Picker enabled, this function calculates a move weight based on that IQ skill's functionality. Otherwise, this function returns a weight of 1.
s32 WeightMoveWithIqSkills(struct entity *user, s32 move_ai_range, struct entity *target, enum type_id move_type);
// Decides which direction the AI will use its regular attack in.
// user: User entity pointer
// target_dir: [output] direction that the regular attack should be targeted at.
// skip_petrified: If true, the AI will ignore enemies that are petrified. If false, the AI will include petrified enemies when targeting.
// return: True if there is a target for the regular attack, false if there is no target.
bool8 TargetRegularAttack(struct entity *user, u32 *target_dir, bool8 skip_petrified);
// Returns true if the target is within range of the user's move, false otherwise.
// If the user does not have Course Checker, it simply checks if the distance between user and target is less or equal than the move range.
// Otherwise, it will iterate through all tiles in the direction specified, checking for walls or other monsters in the way, and return false if they are found.
// user: user pointer
// target: target pointer
// direction: direction ID
// n_tiles: move range (in number of tiles)
bool8 IsTargetInRange(struct entity *user, struct entity *target, s32 direction, s32 n_tiles);

#endif //PMDSKY_DUNGEON_AI_ATTACK_H
