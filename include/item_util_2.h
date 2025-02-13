#ifndef PMDSKY_ITEM_UTIL_2_H
#define PMDSKY_ITEM_UTIL_2_H

#include "item.h"

// Returns the category of the specified item
enum item_category GetItemCategory(s16 item_id);
// Checks if the given item ID is valid (using IsItemValid). If so, return the given item ID. Otherwise, return ITEM_PLAIN_SEED.
s16 EnsureValidItem(s16 item_id);

#endif //PMDSKY_ITEM_UTIL_2_H
