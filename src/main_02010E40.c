#include "main_02010E40.h"
#include "item_util_1.h"

s16 GetExclusiveItemOffset(s16 item_id)
{
    if (GetItemCategory(item_id) != CATEGORY_EXCLUSIVE_ITEMS) {
        return 0;
    }
    return item_id - 0x1bc;
}
