#include "main_0205283C.h"
#include "monster_data.h"

u8 GetShadowSize(s16 monster_id)
{
    return MONSTER_DATA_TABLE_PTR->entries[monster_id].shadow_size;
}

s16 GetSpeedStatus(s16 monster_id)
{
    return MONSTER_DATA_TABLE_PTR->entries[monster_id].base_movement_speed;
}
