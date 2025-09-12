#ifndef PMDSKY_MOVES_3_H
#define PMDSKY_MOVES_3_H

#include "move.h"
#include "util.h"

bool8 IsThawingMove(struct move *move);
// Returns true if the given move can be used while the user is affected by Taunt, or false if the move cannot be used while taunted.
bool8 IsUsableWhileTaunted(struct move *move);

#endif //PMDSKY_MOVES_3_H
