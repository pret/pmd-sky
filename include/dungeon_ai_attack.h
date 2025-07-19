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

#endif //PMDSKY_DUNGEON_AI_ATTACK_H
