#ifndef PMDSKY_DUNGEON_RANGE_H
#define PMDSKY_DUNGEON_RANGE_H

#include "dungeon_mode.h"

// Checks if a given target position is in sight from a given origin position.
// If the origin position is on a hallway or r2 is true, checks if both positions are within <dungeon::display_data::visibility_range> tiles of each other.
// If the origin position is on a room, checks that the target position is within the boundaries of said room.
// origin: Origin position
// target: Target position
// user_has_dropeye: True to assume the entity standing on the origin position has the dropeye status
// return: True if the target position is in sight from the origin position
bool8 IsPositionActuallyInSight(struct position *origin, struct position *target, bool8 user_has_dropeye);
// Checks if a given target position is in sight from a given origin position.
// There's multiple factors that affect this check, but generally, it's true if both positions are in the same room (by checking if the target position is within the boundaries of the room where the origin position is) or within 2 tiles of each other.
bool8 IsPositionInSight(struct position *origin, struct position *target, bool8 user_has_dropeye);

#endif //PMDSKY_DUNGEON_RANGE_H
