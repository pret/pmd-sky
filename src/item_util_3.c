#include "item_util_3.h"
#include "item.h"
#include "item_util_2.h"

extern struct item_data_entry *ITEM_DATA_TABLE_PTRS[3];

bool8 TestItemAiFlag(s16 item_id, s32 flag)
{
    if (flag == 0)
    {
        item_id = EnsureValidItem(item_id);
        if (ITEM_DATA_TABLE_PTRS[ITEM_DATA_TABLE_PTRS_INDEX][item_id].flags & ITEM_DATA_FLAG_THROWABLE_AT_ENEMY)
            return TRUE;
        return FALSE;
    }

    if (flag == 1)
    {
        item_id = EnsureValidItem(item_id);
        if (ITEM_DATA_TABLE_PTRS[ITEM_DATA_TABLE_PTRS_INDEX][item_id].flags & ITEM_DATA_FLAG_THROWABLE_AT_ALLY)
            return TRUE;
        return FALSE;
    }

    item_id = EnsureValidItem(item_id);
    if (ITEM_DATA_TABLE_PTRS[ITEM_DATA_TABLE_PTRS_INDEX][item_id].flags & ITEM_DATA_FLAG_CONSUMABLE)
        return TRUE;
    return FALSE;
}
