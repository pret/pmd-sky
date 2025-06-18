#ifndef PMDSKY_TWO_TURN_MOVES_AND_STATUSES_H
#define PMDSKY_TWO_TURN_MOVES_AND_STATUSES_H

#include "enums.h"

// Represents a two-turn move and its corresponding status_two_turn_id value
struct two_turn_move_and_status {
    enum move_id move;
    enum status_two_turn_id status;
};

// List that matches two-turn move IDs to their corresponding status ID. The last entry is null.
extern const struct two_turn_move_and_status TWO_TURN_MOVES_AND_STATUSES[11];

#endif //PMDSKY_TWO_TURN_MOVES_AND_STATUSES_H
