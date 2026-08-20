#include "overlay_29_02344BE4.h"
#include "main_02001188.h"
#include "overlay_29_0234B024.h"

extern void GenerateItem(struct item *item, enum item_id item_id, s32 quantity, s32 sticky);

void GenerateStandardItem(struct item* item, enum item_id item_id, s32 sticky)
{
    GenerateItem(item, item_id, 0, sticky);
}

void GenerateCleanItem(struct item *item, enum item_id item_id)
{
    GenerateItem(item, item_id, 0, 2);
}
