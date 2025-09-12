#ifndef PMDSKY_MOVES_4_H
#define PMDSKY_MOVES_4_H

#include "move.h"
#include "move_data.h"

// Gets one of the two accuracy values of a move or its ai_condition_random_chance field.
// move: Move pointer
// which: 0 to get the move's first accuracy1 field, 1 to get its accuracy2, 2 to get its ai_condition_random_chance.
// return: Move's accuracy1, accuracy2 or ai_condition_random_chance
u8 GetMoveAccuracyOrAiChance(struct move *move, enum accuracy_type which);

#endif //PMDSKY_MOVES_4_H
