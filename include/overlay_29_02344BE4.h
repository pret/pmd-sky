#ifndef PMDSKY_OVERLAY_29_02344BE4_H
#define PMDSKY_OVERLAY_29_02344BE4_H

#include "dungeon_mode.h"
#include "item.h"
#include "move.h"

void GenerateStandardItem(struct item* item, enum item_id item_id, s32 sticky);
void GenerateCleanItem(struct item *item, enum item_id item_id);

#endif
