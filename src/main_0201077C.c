#include "main_0201077C.h"
#include "item.h"

extern struct bag_items *BAG_ITEMS_PTR_MIRROR;

s16 GetEggSpecies(void)
{
    return BAG_ITEMS_PTR_MIRROR->field_0x13A4;
}
