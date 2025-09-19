#include "item_util_4.h"
#include "dungeon_util_static.h"
#include "item.h"
#include "item_util.h"
#include "item_util_2.h"

extern s32 GetItemSellPrice(s16);
extern s32 GetItemBuyPrice(s16);
extern s32 GetThrownItemQuantityLimit(s16, s32);
extern s16 RandRangeSafe(s32, s32);
extern s16 _020A18BC[10];

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

bool8 IsValidTargetItem(s16 item_id)
{
    s32 var_ip;

    if (item_id >= ITEM_GORGEOUS_BOX_1) return TRUE;

    for (var_ip = 0; _020A18BC[var_ip] != NUM_ITEM_IDS; var_ip++)
    {
        if (item_id == _020A18BC[var_ip]) {
            return TRUE;
        }
    } 
    
    return FALSE;
}

bool8 IsItemUsableNow(struct item* item)
{
    s16 item_id;

    if (item->flags & ITEM_FLAG_IN_SHOP) {
        if (GetItemCategory(item->id) != CATEGORY_TMS_HMS) {
            item_id = item->id;
            if ((item_id != ITEM_SITRUS_BERRY) && 
                (item_id != ITEM_LIFE_SEED) && 
                (item_id != ITEM_GINSENG) && 
                (item_id != ITEM_JOY_SEED) && 
                (item_id != ITEM_GOLDEN_SEED) && 
                (item_id != ITEM_PROTEIN) && 
                (item_id != ITEM_CALCIUM) && 
                (item_id != ITEM_IRON) && 
                (item_id != ITEM_NECTAR) && 
                (item_id != ITEM_ZINC)) {
                if ((u16) (s16) (item_id - 0x77) > 0x11) {
                    goto _ret;
                }
            }
        }
        return FALSE;
    }
_ret:
    return TRUE;
}

bool8 IsTicketItem(s16 item_id)
{
    s32 arg0 = (u16)(s16)(item_id - ITEM_PRIZE_TICKET);

    return ((arg0) <= 3U);
}

void InitItem(struct item* item, s16 id, s16 quantity, bool8 isSticky)
{
    s32 category;
    s32 to;

    if (id != ITEM_NOTHING) {
        item->flags = ITEM_FLAG_EXISTS;
        item->id = id;
        item->held_by = 0;
        if (IsThrownItem(id)) {
            to = GetThrownItemQuantityLimit(id, 1);
            item->quantity = RandRangeSafe(GetThrownItemQuantityLimit(id, 0), to);
        } else {
            category = GetItemCategory(id);
            if (category == CATEGORY_POKE) {
                item->quantity = 1;
            } else if ((u8) (category + 0xF4) <= 2) {
                item->quantity = quantity;
            } else {
                item->quantity = 0;
            }
        }
        if (isSticky) {
            item->flags |= ITEM_FLAG_STICKY;
        }
        return;
    }
    item->flags = 0;
    item->id = id;
    item->quantity = 0;
}

void InitStandardItem(struct item* item, s16 id, bool8 isSticky)
{
   InitItem(item, id, 0, isSticky);
}

void sub_0200CF6C(struct item* item, s16 id, s16 quantity, bool8 isSticky)
{
    InitItem(item, id, quantity, isSticky);
}

void InitBulkItem(struct bulk_item* item, s16 id) {
    s32 to;

    item->id = id;
    if (id != ITEM_NOTHING) {
        if (IsThrownItem(id)) {
            to = GetThrownItemQuantityLimit(id, 1);
            item->quantity = RandRangeSafe(GetThrownItemQuantityLimit(id, 0), to);
        }
        else if (GetItemCategory(id) == CATEGORY_POKE) {
            item->quantity = 1;
        } else {
            item->quantity = 0;
        }
    }
    else
    {
        item->quantity = 0;
    }
}
