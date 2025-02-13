#ifndef PMDSKY_ITEM_UTIL_1_H
#define PMDSKY_ITEM_UTIL_1_H

#include "util.h"

// Checks if an item is valid given its ID.
// In particular, checks if the "is valid" flag is set on its item_p.bin entry.
bool8 IsItemValid(s16 item_id);

#endif //PMDSKY_ITEM_UTIL_1_H
