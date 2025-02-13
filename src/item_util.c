#include "item_util.h"

extern enum item_category GetItemCategory(s16 index);

enum item_category GetItemCategoryVeneer(s16 index)
{
    return GetItemCategory(index);
}
