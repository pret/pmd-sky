#ifndef PMDSKY_OVERLAY_29_0231E9F0_H
#define PMDSKY_OVERLAY_29_0231E9F0_H

#include "move.h"

// Gets the maximum PP for a given move. A wrapper around the function in the ARM 9 binary.
// return: max PP for the given move, capped at 99
s16 GetMaxPpWrapper(struct move *move);

#endif //PMDSKY_OVERLAY_29_0231E9F0_H
