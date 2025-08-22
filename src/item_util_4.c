#include "item_util_4.h"
#include "dungeon_util_static.h"
#include "item.h"
#include "item_util.h"
#include "item_util_2.h"

extern s32 GetItemSellPrice(s16);
extern s32 GetItemBuyPrice(s16);

BOOL IsLosableItem(struct item* item)
{
    return ((ItemExists(item->flags) && ((!IsAuraBow(item->id)) || (item->flags & ITEM_FLAG_IN_SHOP))));
}

bool8 IsTreasureBox(s16 item_id)
{
    // NOTE: FAKEMATCH
    // TODO: Categories 12 - 14
    return ((u8) (GetItemCategory(item_id) + 0xF4) <= 2);
}

bool8 IsStorableItem(s16 item_id)
{
    if (item_id == ITEM_NOTHING) return 0;
    if (item_id == ITEM_POKE) return 0;
    if (item_id == ITEM_TM_USED_TM) return 0;
    if (item_id == ITEM_WONDER_EGG) return 0;
    return 1;
}

bool8 IsShoppableItem(s16 item_id)
{
    if (item_id == ITEM_NOTHING) return FALSE;
    if (item_id == ITEM_POKE) return FALSE;
    if (item_id == ITEM_GOLD_THORN) return FALSE;
    if (item_id == ITEM_GOLDEN_MASK) return FALSE;
    if (item_id == ITEM_AMBER_TEAR) return FALSE;
    if (item_id == ITEM_GOLDEN_APPLE) return FALSE;
    if (item_id == ITEM_WONDER_GUMMI) return FALSE;
    if (item_id == ITEM_UNNAMED_0xB9) return FALSE;
    if (item_id == ITEM_MYSTERY_PART) return FALSE;
    if (item_id == ITEM_SECRET_SLAB) return FALSE;
    if (item_id == ITEM_RARE_FOSSIL) return FALSE;
    if (item_id == ITEM_UNNAMED_0xB0) return FALSE;
    if (item_id == ITEM_GOLDEN_SEED) return FALSE;
    if (GetItemSellPrice(item_id) == 0) return FALSE;
    if (GetItemBuyPrice(item_id) == 0) return FALSE;
    return 1;
}

extern s16 _020A18BC[10];

bool8 IsValidTargetItem(s16 item_id) {
    s32 var_ip;

    if (item_id >= 0x16C) return TRUE;

    for (var_ip = 0; _020A18BC[var_ip] != 0x578; var_ip++)
    {
        if (item_id == _020A18BC[var_ip]) {
            return TRUE;
        }
    } 
    
    return FALSE;
}
