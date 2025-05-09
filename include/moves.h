#ifndef PMDSKY_MOVES_H
#define PMDSKY_MOVES_H

#include "move.h"

// Gets the maximum PP for a given move.
// return: max PP for the given move, capped at 99
u32 GetMaxPp(struct move *move);

#endif //PMDSKY_MOVES_H
