#ifndef PMDSKY_MOVES_1_H
#define PMDSKY_MOVES_1_H

#include "move.h"

// Initializes a move info struct.
// This sets f_exists and f_enabled_for_ai on the flags, the ID to the given ID, the PP to the max PP for the move ID, and the ginseng boost to 0.
// move: pointer to move to initialize
// move_id: move ID
void InitMove(struct move *move, enum move_id move_id);

#endif //PMDSKY_MOVES_1_H
