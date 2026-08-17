#include "main_0201227C.h"
#include "item.h"

extern struct bag_items *BAG_ITEMS_PTR_MIRROR;

s16 GetRecycleOfferCooldown(void)
{
    return BAG_ITEMS_PTR_MIRROR->field_0x13B0;
}
