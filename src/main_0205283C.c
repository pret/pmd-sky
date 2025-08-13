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

enum mobility_type GetMobilityType(s16 monster_id)
{
    return MONSTER_DATA_TABLE_PTR->entries[monster_id].movement_type;
}

u8 GetRegenSpeed(s16 monster_id)
{
    return MONSTER_DATA_TABLE_PTR->entries[monster_id].hp_regeneration << 1;
}

bool8 GetCanMoveFlag(s16 monster_id)
{
    return MONSTER_DATA_TABLE_PTR->entries[monster_id].flags & 0b00010000 ? TRUE : FALSE;
}

u8 GetChanceAsleep(s16 monster_id)
{
    return MONSTER_DATA_TABLE_PTR->entries[monster_id].spawn_asleep_chance;
}

u16 GetWeightMultiplier(s16 monster_id)
{
    return MONSTER_DATA_TABLE_PTR->entries[monster_id].weight;
}

u16 GetSize(s16 monster_id)
{
    return MONSTER_DATA_TABLE_PTR->entries[monster_id].size;
}

u16 GetBaseHp(s16 monster_id)
{
    return MONSTER_DATA_TABLE_PTR->entries[monster_id].base_hp;
}

bool8 CanThrowItems(s16 monster_id)
{
    return MONSTER_DATA_TABLE_PTR->entries[monster_id].flags & 0b00100000 ? TRUE : FALSE;
}
