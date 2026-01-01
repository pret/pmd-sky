#include "item_util.h"
#include "item_util_1.h"

enum item_category GetItemCategoryVeneer(s16 item_id)
{
    return GetItemCategory(item_id);
}

u16 GetItemMoveId16(s16 item_id)
{
    return GetItemMoveId(item_id);
}

bool8 IsThrownItem(s16 item_id) 
{
    return (GetItemCategory(item_id) <= CATEGORY_THROWN_ARC);
}

bool8 IsNotMoney(s16 item_id) 
{
    if (item_id == ITEM_NOTHING) return FALSE;
    return (item_id != ITEM_POKE);
}

bool8 IsEdible(s16 item_id) 
{
    return ((bool8) (GetItemCategory(item_id) + 0xFE) <= 1);
}

bool8 IsHM(s16 item_id) 
{
    if(item_id == ITEM_TM_CUT) return TRUE;
    else if(item_id == ITEM_TM_FLY) return TRUE;
    else if(item_id == ITEM_TM_SURF) return TRUE;
    else if(item_id == ITEM_TM_STRENGTH) return TRUE;
    else if(item_id == ITEM_TM_ROCK_SMASH) return TRUE;
    else if(item_id == ITEM_TM_WATERFALL) return TRUE;
    else if(item_id == ITEM_TM_ROCK_CLIMB) return TRUE;
    else if(item_id == ITEM_TM_DEFOG) return TRUE;
    else return FALSE;
}

bool8 IsGummi(s16 item_id) 
{
    if(item_id < ITEM_WHITE_GUMMI) return FALSE;
    return (item_id <= ITEM_WONDER_GUMMI);
}

BOOL IsAuraBow(s32 item_id) 
{
    return ((item_id >= ITEM_SILVER_BOW) && (item_id <= ITEM_FUCHSIA_BOW));
}
