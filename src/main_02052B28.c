#include "main_02052B28.h"
#include "monster_data.h"

s32 GetIqGroup(s16 monster_id)
{
    return MONSTER_DATA_TABLE_PTR->entries[monster_id].iq_group;
}

u8 GetSpawnThreshold(s16 monster_id)
{
    return MONSTER_DATA_TABLE_PTR->entries[monster_id].spawn_threshold;
}

bool8 NeedsItemToSpawn(s16 monster_id)
{
    return MONSTER_DATA_TABLE_PTR->entries[monster_id].flags & 0b10000000 ? TRUE : FALSE;
}

s16 GetExclusiveItem(s16 monster_id, s32 item_index)
{
    return MONSTER_DATA_TABLE_PTR->entries[monster_id].exclusive_item[item_index % 4];
}
