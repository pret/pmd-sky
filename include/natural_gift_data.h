#ifndef PMDSKY_NATURAL_GIFT_DATA_H
#define PMDSKY_NATURAL_GIFT_DATA_H

#include "enums.h"
#include "item.h"

struct natural_gift_item_info
{
    enum item_id item_id;
    enum type_id type_id;
    // This value is the boost that's added to Natural Gift's default base power of 1
    // during damage calculation
    s16 base_power_boost;
};

extern const struct natural_gift_item_info NATURAL_GIFT_ITEM_TABLE[34];

#endif //PMDSKY_NATURAL_GIFT_DATA_H
