#ifndef PMDSKY_DUNGEON_MOVE_UTIL_H
#define PMDSKY_DUNGEON_MOVE_UTIL_H

#include "dungeon_mode.h"

// Checks if an AI-controlled monster can use a move.
// Will return false if the any of the flags move::f_exists, move::f_subsequent_in_link_chain or move::f_disabled is true. The function does not check if the flag move::f_enabled_for_ai is set. This function also returns true if the call to CanMonsterUseMove is true.
// The function contains a loop that is supposed to check other moves after the specified one, but the loop breaks after it finds a move that isn't linked, which is always true given the checks in place at the start of the function.
// monster: Entity pointer
// move_index: Move index
// extra_checks: extra_checks parameter when calling CanMonsterUseMove
// return: True if the AI can use the move (not accounting for move::f_enabled_for_ai)
bool8 CanAiUseMove(struct entity *monster, u32 move_index, bool8 extra_checks);
// Checks if a monster can use the given move.
// Will always return true for the regular attack. Will return false if the move if the flag move::f_disabled is true, if the // flag move::f_sealed is true. More things will be checked if the extra_checks parameter is true.
// monster: Entity pointer
// move: Move pointer
// extra_checks: True to check whether the move is out of PP, whether it can be used under the taunted status and whether the encore status prevents using the move
// return: True if the monster can use the move, false otherwise.
bool8 CanMonsterUseMove(struct entity *monster, struct move *move, bool8 extra_checks);

#endif //PMDSKY_DUNGEON_MOVE_UTIL_H
