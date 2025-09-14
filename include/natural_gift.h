#ifndef PMDSKY_NATURAL_GIFT_H
#define PMDSKY_NATURAL_GIFT_H

#include "dungeon_mode.h"

struct natural_gift_item_info
{
    enum item_id item_id;
    enum type_id type_id;
    // This value is the boost that's added to Natural Gift's default base power of 1
    // during damage calculation
    s16 base_power_boost;
};

struct natural_gift_item_info* GetEntityNaturalGiftInfo(struct entity* entity);

#endif //PMDSKY_NATURAL_GIFT_H
