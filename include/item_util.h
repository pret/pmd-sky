#ifndef PMDSKY_ITEM_UTIL_H
#define PMDSKY_ITEM_UTIL_H

#include "item.h"

// Likely a linker-generated veneer for GetItemCategory.
// See https://developer.arm.com/documentation/dui0474/k/image-structure-and-generation/linker-generated-veneers/what-is-a-veneer-
enum item_category GetItemCategoryVeneer(s16 item_id);

#endif //PMDSKY_ITEM_UTIL_H
