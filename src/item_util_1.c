#include "item_util_1.h"
#include "item.h"

extern struct item_data_entry *ITEM_DATA_TABLE_PTRS[3];

bool8 IsItemValid(s16 item_id)
{
    if (ITEM_DATA_TABLE_PTRS[ITEM_DATA_TABLE_PTRS_INDEX][item_id].flags & ITEM_DATA_FLAG_VALID)
        return TRUE;

    return FALSE;
}
