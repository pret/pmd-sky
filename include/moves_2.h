#ifndef PMDSKY_MOVES_2_H
#define PMDSKY_MOVES_2_H

#include "move.h"
#include "util.h"

// Gets the move target-and-range field.
s16 GetMoveTargetAndRange(struct move *move, bool8 is_ai);
// Gets the type of a move
enum type_id GetMoveType(struct move* move);

#endif //PMDSKY_MOVES_2_H
