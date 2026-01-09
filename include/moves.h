#ifndef PMDSKY_MOVES_H
#define PMDSKY_MOVES_H

#include "move.h"

// Gets the maximum PP for a given move.
// return: max PP for the given move, capped at 99
u32 GetMaxPp(struct move *move);

// Gets the maximum Ginseng Boost for a given move
// return: max ginseng boost for the given move, capped at 15
u8 GetMoveMaxGinsengBoost(struct move* move);

// Gets the maximum Ginseng Boost for a given move
// return: max ginseng boost for the given move, capped at 15
u8 GetMoveMaxGinsengBoostGround(struct move* move);

// Gets the critical hit chance for a given move.
// return: critical hit chance for the given move, capped at 15
u8 GetMoveCritChance(struct move *move);


#endif //PMDSKY_MOVES_H
