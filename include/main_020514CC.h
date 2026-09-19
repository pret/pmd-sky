#ifndef PMDSKY_MAIN_020514CC_H
#define PMDSKY_MAIN_020514CC_H
#include "util.h"
#include "dungeon.h"

bool32 IsDojoDungeon(u8 dungeon_id);
bool32 IsFutureDungeon(u8 dungeon_id);
bool32 IsSpecialEpisodeDungeon(u8 dungeon_id);
s32 RetrieveFromItemList1(struct dungeon_floor_pair *pair, s32 list_idx);
bool8 IsForbiddenFloor(struct dungeon_floor_pair *pair);

#endif //PMDSKY_MAIN_020514CC_H
