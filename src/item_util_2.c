#include "item_util_2.h"
#include "item_util_1.h"

extern struct item_data_entry *ITEM_DATA_TABLE_PTRS[3];

enum item_category GetItemCategory(s16 item_id)
{
    s16 valid_item_id = EnsureValidItem(item_id);
    return ITEM_DATA_TABLE_PTRS[ITEM_DATA_TABLE_PTRS_INDEX][valid_item_id].category;
}

s16 EnsureValidItem(s16 item_id)
{
    if (item_id <= 0 || item_id >= NUM_ITEM_IDS)
        return ITEM_PLAIN_SEED;

    if (!IsItemValid(item_id))
        return ITEM_PLAIN_SEED;

    return item_id;
}
