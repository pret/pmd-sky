#include "item_util.h"
#include "item_util_2.h"

extern s32 GetItemMoveId(s32 item_id);

enum item_category GetItemCategoryVeneer(s16 item_id)
{
    return GetItemCategory(item_id);
}

u16 GetItemMoveId16(s16 item_id)
{
    return GetItemMoveId(item_id);
}

u8 IsThrownItem(s16 item_id) 
{
    return (GetItemCategory(item_id) <= CATEGORY_THROWN_ARC);
}

u8 IsNotMoney(s16 item_id) 
{
    if (item_id == ITEM_NOTHING) return 0;
    return (item_id != ITEM_POKE);
}
