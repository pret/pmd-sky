#include "debug.h"
#include "main_0202593C.h"
#include "item.h"
#include "item_util_1.h"

#ifdef EUROPE
#define ITEM_NAME_OFFSET 0x1A78
#elif JAPAN
#define ITEM_NAME_OFFSET 0x0D93
#else
#define ITEM_NAME_OFFSET 0x1A76
#endif

extern struct item_tables ITEM_DATA_TABLE_PTRS;
extern const char ITEM_NAME_FORMAT_YELLOW;
extern const char ITEM_NAME_FORMAT_INDIGO;
extern const char ITEM_NAME_FORMAT_PLAIN;
extern const char ITEM_NAME_FORMAT_CREAM;

extern u8* strcpy(u8*, u8*);
extern s32 vsprintf(u8* str, const u8* format, va_list ap);

static s16 GetExclusiveItemOffsetEnsureValid(s16 item_id);
static s16 EnsureValidItem(s16 item_id);
static void SprintfStatic(char*, const char*, ...);

#ifdef EUROPE
void SprintfStatic__0200E808_EU(char* buf, const char* fmt, ...)
{
    va_list args;
    va_start(args, fmt);
    vsprintf(buf, fmt, args);
}
#endif

u8 GetExclusiveItemType(s16 item_id) {
    item_id = GetExclusiveItemOffsetEnsureValid(item_id);
    return ITEM_DATA_TABLE_PTRS.exclusive_data[item_id].type;
}

static s16 GetExclusiveItemOffsetEnsureValid(s16 item_id) {
    if (item_id < ITEM_PRISM_RUFF || item_id >= NUM_ITEM_IDS) {
        return ITEM_PLAIN_SEED;
    }
    if (IsItemValid(item_id)) {
        return (s16)(item_id - ITEM_PRISM_RUFF);
    }
    return ITEM_PLAIN_SEED;
}

bool8 IsItemValid(s16 item_id)
{
    if (ITEM_DATA_TABLE_PTRS.data[item_id].flags & ITEM_DATA_FLAG_VALID)
        return TRUE;

    return FALSE;
}

s16 GetExclusiveItemParameter(s16 item_id) {
    item_id = GetExclusiveItemOffsetEnsureValid(item_id);
    return ITEM_DATA_TABLE_PTRS.exclusive_data[item_id].unk2;
}

enum item_category GetItemCategory(s16 item_id)
{
    s16 valid_item_id = EnsureValidItem(item_id);
    return ITEM_DATA_TABLE_PTRS.data[valid_item_id].category;
}

static s16 EnsureValidItem(s16 item_id)
{
    if (item_id <= 0 || item_id >= NUM_ITEM_IDS)
        return ITEM_PLAIN_SEED;

    if (!IsItemValid(item_id))
        return ITEM_PLAIN_SEED;

    return item_id;
}

u8* GetItemName(s16 item_id) {
    u32 valid_item_id = EnsureValidItem(item_id);
    return StringFromId((u16)(valid_item_id + ITEM_NAME_OFFSET));
}

#ifdef EUROPE
#define GET_ITEM_NAME_FORMATTED_SPRINTF SprintfStatic__0200E808_EU
#else
#define GET_ITEM_NAME_FORMATTED_SPRINTF SprintfStatic
#endif
void GetItemNameFormatted(char* name, s16 item_id, s32 flag1, s32 flag2)
{
    enum item_category category;

    u8* raw_name = StringFromId((u16) (EnsureValidItem(item_id) + ITEM_NAME_OFFSET));

    category = ITEM_DATA_TABLE_PTRS.data[EnsureValidItem(item_id)].category;
    if ((flag2 != 0) || ((u8)(category + 0xF4) <= 2)) {
        if (flag1 != 0) {
            GET_ITEM_NAME_FORMATTED_SPRINTF(name, &ITEM_NAME_FORMAT_YELLOW, raw_name);
            return;
        }
        strcpy(name, raw_name);
        return;
    }
    if (category == CATEGORY_EXCLUSIVE_ITEMS) {
        if (flag1 != 0) {
            GET_ITEM_NAME_FORMATTED_SPRINTF(name, &ITEM_NAME_FORMAT_INDIGO, raw_name);
            return;
        }
        GET_ITEM_NAME_FORMATTED_SPRINTF(name, &ITEM_NAME_FORMAT_PLAIN, raw_name);
        return;
    }
    if (flag1 != 0) {
        GET_ITEM_NAME_FORMATTED_SPRINTF(name, &ITEM_NAME_FORMAT_CREAM, raw_name);
        return;

    }
    GET_ITEM_NAME_FORMATTED_SPRINTF(name, &ITEM_NAME_FORMAT_PLAIN, raw_name);
    return;
}

#ifndef EUROPE
static void SprintfStatic(char* buf, const char* fmt, ...)
{
    va_list args;
    va_start(args, fmt);
    vsprintf(buf, fmt, args);
}
#endif

u16 GetItemBuyPrice(s16 item_id)
{
    item_id = EnsureValidItem(item_id);
    return ITEM_DATA_TABLE_PTRS.data[item_id].buy_price;
}

u16 GetItemSellPrice(s16 item_id)
{
    item_id = EnsureValidItem(item_id);
    return ITEM_DATA_TABLE_PTRS.data[item_id].sell_price;
}

u8 GetItemSpriteId(s16 item_id)
{
    item_id = EnsureValidItem(item_id);
    return ITEM_DATA_TABLE_PTRS.data[item_id].sprite_id;
}

u8 GetItemPaletteId(s16 item_id)
{
    item_id = EnsureValidItem(item_id);
    return ITEM_DATA_TABLE_PTRS.data[item_id].palette_id;
}

u8 GetItemActionName(s16 item_id)
{
    item_id = EnsureValidItem(item_id);
    return ITEM_DATA_TABLE_PTRS.data[item_id].action_name;
}

u8 GetThrownItemQuantityLimit(s16 item_id, u8 arg1)
{
    item_id = EnsureValidItem(item_id);
    return ITEM_DATA_TABLE_PTRS.data[item_id].quantity_limit[arg1];
}

s16 GetItemMoveId(s16 item_id)
{
    item_id = EnsureValidItem(item_id);
    return ITEM_DATA_TABLE_PTRS.data[item_id].move_id;
}

bool8 TestItemAiFlag(s16 item_id, s32 flag)
{
    if (flag == 0)
    {
        item_id = EnsureValidItem(item_id);
        if (ITEM_DATA_TABLE_PTRS.data[item_id].flags & ITEM_DATA_FLAG_THROWABLE_AT_ENEMY)
            return TRUE;
        return FALSE;
    }

    if (flag == 1)
    {
        item_id = EnsureValidItem(item_id);
        if (ITEM_DATA_TABLE_PTRS.data[item_id].flags & ITEM_DATA_FLAG_THROWABLE_AT_ALLY)
            return TRUE;
        return FALSE;
    }

    item_id = EnsureValidItem(item_id);
    if (ITEM_DATA_TABLE_PTRS.data[item_id].flags & ITEM_DATA_FLAG_CONSUMABLE)
        return TRUE;
    return FALSE;
}
