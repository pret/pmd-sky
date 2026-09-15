#include "item_util_4.h"
#include "dungeon_util_static.h"
#include "item.h"
#include "item_util.h"
#include "item_util_1.h"
#include "main_0200D81C.h"
#include <stdarg.h>

extern s16 RandRangeSafe(s32, s32);
extern s16 _020A18BC[10];
extern void ItemZInit();
extern u16 GetItemBuyPrice(s16);
extern u16 GetItemSellPrice(s16);
extern bool8 IsShoppableItem(s16);
extern bool8 IsThrownItem(s16);

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

void BulkItemToItem(struct item* item, struct bulk_item* bulk_item)
{
    if (bulk_item->id != 0) {
        item->flags = ITEM_FLAG_EXISTS;
        item->id = bulk_item->id;
        item->held_by = 0;
        if (IsThrownItem(item->id)) {
            item->quantity = bulk_item->quantity;
            return;
        }
        
        switch(GetItemCategory(item->id)) {
            case CATEGORY_POKE:
            case CATEGORY_TREASURE_BOXES_1:
            case CATEGORY_TREASURE_BOXES_2:
            case CATEGORY_TREASURE_BOXES_3:
            case 0xBB:
                item->quantity = bulk_item->quantity;
                return;
            default:
                 item->quantity = 0;
        }
    } else {
        ItemZInit();
    }
}

void ItemToBulkItem(struct bulk_item* bulk, struct item* item)
{
    if (GET_FLAG(item->flags, ITEM_FLAG_EXISTS)) {
        bulk->id = item->id;
        bulk->quantity = item->quantity;
    }
    else {
        bulk->id = 0;
        bulk->quantity = 0;
    }
}

s32 GetDisplayedBuyPrice(struct item* item)
{
    if (item->id == ITEM_POKE) {
        return GetMoneyQuantity(item);
    }
    if (IsThrownItem(item->id)) {
        return item->quantity * GetItemBuyPrice(item->id);
    }
    return GetItemBuyPrice(item->id);
}

s32 GetDisplayedSellPrice(struct item* item)
{
    if (item->id == ITEM_POKE) {
        return GetMoneyQuantity(item);
    }
    if (IsThrownItem(item->id)) {
        return item->quantity * GetItemSellPrice(item->id);
    }
    return GetItemSellPrice(item->id);
}

s32 GetActualBuyPrice(struct item* item)
{
    if (!IsShoppableItem(item->id)) {
        return 0;
    }
    if (IsThrownItem(item->id)) {
        return item->quantity * GetItemBuyPrice(item->id);
    }
    return GetItemBuyPrice(item->id);
}

s32 GetActualSellPrice(struct item* item)
{
    if (!IsShoppableItem(item->id)) {
        return 0;
    }
    if (IsThrownItem(item->id)) {
        return item->quantity * GetItemSellPrice(item->id);
    }
    return GetItemSellPrice(item->id);
}

extern u8* strcpy(u8*, u8*);
extern u8* strncpy(u8* dest, u8* src, u32 n);
extern s32 vsprintf(u8* str, const u8* format, va_list ap);
extern struct bag_items* BAG_ITEMS_PTR_MIRROR;
extern s32 sub_0200EB64(s16 a);
extern void MoneyQuantityToString__02023B30(u8* buf, s32 quantity);
extern const char _02097F34;
extern const char _02097F50;
extern const char _02097F58;
extern const char _02097F68;
extern const char _02097F6C;
extern const char _02097F7C;
extern const char _02097F90;
extern const char _02097F9C;
extern const char _02097FAC;
extern const char _02097FB8;
extern const char _02097FC4;
extern const char _02097FE4;

s32 sub_0200D1F0(s16 a)
{
    return sub_0200EB64(a);
}

u8 sub_0200D1FC(s16 item_id)
{
    return GetItemPaletteId(item_id);
}

u8 sub_0200D208(s16 item_id)
{
    return GetItemActionName(item_id);
}

void sub_0200D214(u8 *buf, s16 item_id, struct unk_0209C850 *a)
{
    struct item item;
    u8 name[0x50];

    strncpy(name, GetItemName(item_id), 0x50);
    InitItem(&item, item_id, 0, 0);
    item.quantity = 1;
    sub_0200D688(buf, name, &item, a);
}

s32 FindItemInInventory(s16 item_id)
{
    s32 i;
    s32 j;
    struct bag_items *bag;

    bag = BAG_ITEMS_PTR_MIRROR;
    for (i = 0; i < INVENTORY_SIZE; i++) {
        if (ItemExists(bag->bag_items->bag_items[i].flags)) {
            if (item_id == bag->bag_items->bag_items[i].id) {
                return i;
            }
        }
    }
    for (j = 0; j < 1000; j++) {
        if (item_id == bag->field_0x38A[j]) {
            return j + 0x8000;
        }
    }
    return -1;
}

bool8 MaybeGetFormattedItemName(u8 *buf, struct item *item,
                                struct unk_0209C850 *a, bool8 colored,
                                bool8 forceBrackets)
{
    u8 name[0x50];
    u8 money[0x50];
    u8 *raw_name;
    bool8 sticky;
    bool8 brackets;
    bool8 ret;
    enum item_category category;

    brackets = FALSE;
    category = GetItemCategory(item->id);
    ret = FALSE;
    sticky = FALSE;
    if (a != NULL && a->field_0x8 != 0) {
        brackets = TRUE;
    }
    raw_name = GetItemName(item->id);
    if (category == CATEGORY_THROWN_LINE) {
        if (brackets) {
            if (colored) {
                SprintfStatic__0200D634(name, &_02097F34, raw_name, item->quantity);
            } else {
                SprintfStatic__0200D634(name, &_02097F50, raw_name, item->quantity);
            }
        } else {
            if (colored) {
                SprintfStatic__0200D634(name, &_02097F58, raw_name);
            } else {
                SprintfStatic__0200D634(name, &_02097F68, raw_name);
            }
        }
    } else if (category == CATEGORY_THROWN_ARC) {
        if (brackets) {
            if (colored) {
                SprintfStatic__0200D634(name, &_02097F34, raw_name, item->quantity);
            } else {
                SprintfStatic__0200D634(name, &_02097F50, raw_name, item->quantity);
            }
        } else {
            if (colored) {
                SprintfStatic__0200D634(name, &_02097F58, raw_name);
            } else {
                SprintfStatic__0200D634(name, &_02097F68, raw_name);
            }
        }
    } else if ((u8) (category + 0xF4) <= 2) {
        if (colored) {
            SprintfStatic__0200D634(name, &_02097F6C, raw_name);
        } else {
            strcpy(name, raw_name);
        }
    } else if (item->id == ITEM_POKE) {
        MoneyQuantityToString__02023B30(money, GetMoneyQuantity(item));
        if (colored) {
            SprintfStatic__0200D634(name, &_02097F7C, money);
        } else {
            SprintfStatic__0200D634(name, &_02097F90, money);
        }
        if (colored) {
            SprintfStatic__0200D634(name, &_02097F7C, money);
        } else {
            SprintfStatic__0200D634(name, &_02097F90, money);
        }
    } else if (category == CATEGORY_EXCLUSIVE_ITEMS) {
        if (colored) {
            SprintfStatic__0200D634(name, &_02097F9C, raw_name);
        } else {
            strcpy(name, raw_name);
        }
    } else {
        if (colored) {
            SprintfStatic__0200D634(name, &_02097F58, raw_name);
        } else {
            strncpy(name, raw_name, 0x50);
        }
    }
    if (ItemSticky(item->flags)) {
        SprintfStatic__0200D634(buf, &_02097FAC, name);
        strncpy(name, buf, 0x50);
        sticky = TRUE;
    } else if (forceBrackets) {
        SprintfStatic__0200D634(buf, &_02097FB8, name);
        strncpy(name, buf, 0x50);
    }
    if (a == NULL) {
        strncpy(buf, name, 0x50);
    } else {
        if (a->field_0x4 != 0 && (item->flags & ITEM_FLAG_SET)) {
            if (sticky) {
                name[4] = '5';
            } else {
                name[4] = '2';
            }
        }
        if (a->field_0x0 == 1 || a->field_0x0 == 3) {
            if (item->flags & ITEM_FLAG_IN_SHOP) {
                sub_0200D688(buf, name, item, a);
                ret = TRUE;
            } else {
                strncpy(buf, name, 0x50);
            }
        } else {
            sub_0200D688(buf, name, item, a);
        }
    }
    return ret;
}

void SprintfStatic__0200D634(u8 *buf, const char *fmt, ...)
{
    va_list args;
    va_start(args, fmt);
    vsprintf(buf, fmt, args);
}

bool8 MaybeGetUncoloredFormattedItemName(u8 *buf, struct item *item,
                                         struct unk_0209C850 *a)
{
    return MaybeGetFormattedItemName(buf, item, a, FALSE, FALSE);
}

bool8 MaybeGetColoredFormattedItemName(u8 *buf, struct item *item,
                                       struct unk_0209C850 *a)
{
    return MaybeGetFormattedItemName(buf, item, a, TRUE, FALSE);
}

void sub_0200D688(u8 *buf, u8 *name, struct item *item,
                  struct unk_0209C850 *a)
{
    s32 price;
    u8 numbuf[40];

    if (a == NULL) {
        strncpy(buf, name, 0x50);
        return;
    }
    switch (a->field_0x0) {
    case 1:
    case 2:
        price = GetDisplayedBuyPrice(item);
        break;
    case 3:
    case 4:
        price = GetDisplayedSellPrice(item);
        break;
    default:
        price = 0;
        break;
    }
    if (price == 0) {
        strncpy(buf, name, 0x50);
        return;
    }
    if (a->field_0x6 != 0) {
        sub_0200D76C(price, numbuf, TRUE);
        SprintfStatic__0200D634(buf, &_02097FC4, name, a->field_0x6, numbuf);
    } else {
        sub_0200D76C(price, numbuf, FALSE);
        SprintfStatic__0200D634(buf, &_02097FE4, name, numbuf);
    }
}
