#ifndef PMDSKY_MAIN_02052B28_H
#define PMDSKY_MAIN_02052B28_H

#include "util.h"

s32 GetIqGroup(s16 monster_id);
u8 GetSpawnThreshold(s16 monster_id);
bool8 NeedsItemToSpawn(s16 monster_id);
s16 GetExclusiveItem(s16 monster_id, s32 item_index);

#endif //PMDSKY_MAIN_02052B28_H
