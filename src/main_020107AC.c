#include "main_020107AC.h"
#include "item.h"

extern struct bag_items *BAG_ITEMS_PTR_MIRROR;

u16 GetUnkGameState0x13a6(void)
{
    return BAG_ITEMS_PTR_MIRROR->field_0x13A6;
}

void SetUnkGameState0x13a6(u16 value)
{
    BAG_ITEMS_PTR_MIRROR->field_0x13A6 = value;
}
