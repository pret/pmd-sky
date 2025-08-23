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

u8 IsTreasureBox(s16 item_id)
{
    // NOTE: FAKEMATCH
    // TODO: Categories 12 - 14
    return ((u8) (GetItemCategory(item_id) + 0xF4) <= 2);
}

u8 IsStorableItem(s16 item_id)
{
    if (item_id == ITEM_NOTHING) return 0;
    if (item_id == ITEM_POKE) return 0;
    if (item_id == ITEM_TM_USED_TM) return 0;
    if (item_id == ITEM_WONDER_EGG) return 0;
    return 1;
}

u8 IsShoppableItem(s16 item_id)
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

