#include "item_util_2.h"
#include "util.h"

extern struct item_data_entry *ITEM_DATA_TABLE_PTRS[3];
extern bool8 IsItemValid(s16 item_id);

#ifdef EUROPE
#define ITEM_DATA_TABLE_PTRS_INDEX 0
#else
#define ITEM_DATA_TABLE_PTRS_INDEX 1
#endif

enum item_category GetItemCategory(s16 item_id)
{
    s16 valid_item_id = EnsureValidItem(item_id);
    return ITEM_DATA_TABLE_PTRS[ITEM_DATA_TABLE_PTRS_INDEX][valid_item_id].category;
}

s16 EnsureValidItem(s16 item_id)
{
    if (item_id <= 0 || item_id >= 0x578)
        return ITEM_PLAIN_SEED;

    if (!IsItemValid(item_id))
        return ITEM_PLAIN_SEED;

    return item_id;
}
