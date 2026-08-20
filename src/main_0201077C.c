#include "main_0201077C.h"
#include "item.h"

void SetMoneyStored(s32 money);
extern struct bag_items *BAG_ITEMS_PTR_MIRROR;

void AddMoneyStored(s32 amount)
{
    SetMoneyStored(BAG_ITEMS_PTR_MIRROR->field_0x13A0 + amount);
}


s16 GetEggSpecies(void)
{
    return BAG_ITEMS_PTR_MIRROR->field_0x13A4;
}

void SetEggSpecies(s16 species)
{
    BAG_ITEMS_PTR_MIRROR->field_0x13A4 = species;
}
