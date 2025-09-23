#ifndef PMDSKY_DUNGEON_MOVE_UTIL_H
#define PMDSKY_DUNGEON_MOVE_UTIL_H

#include "dungeon_mode.h"

// Checks if an AI-controlled monster can use a move.
// Will return false if the any of the flags move::f_exists, move::f_subsequent_in_link_chain or move::f_disabled is true. The function does not check if the flag move::f_enabled_for_ai is set. This function also returns true if the call to CanMonsterUseMove is true.
// The function contains a loop that is supposed to check other moves after the specified one, but the loop breaks after it finds a move that isn't linked, which is always true given the checks in place at the start of the function.
bool8 CanAiUseMove(struct entity *monster, u32 move_index, bool8 extra_checks);

#endif //PMDSKY_DUNGEON_MOVE_UTIL_H
