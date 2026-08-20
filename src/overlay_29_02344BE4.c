#include "overlay_29_02344BE4.h"

extern void GenerateItem(struct item *item, enum item_id item_id, s32 quantity, s32 sticky);

void GenerateCleanItem(struct item *item, enum item_id item_id)
{
    GenerateItem(item, item_id, 0, 2);
}
