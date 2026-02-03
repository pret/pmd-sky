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

bool8 CanEvolve(s16 monster_id)
{
    return MONSTER_DATA_TABLE_PTR->entries[monster_id].flags & 0b01000000 ? TRUE : FALSE;
}

s16 GetMonsterPreEvolution(s16 monster_id)
{
    return MONSTER_DATA_TABLE_PTR->entries[monster_id].evolution_param.pre_evolution_idx;
}

u8 GetBaseOffensiveStat(s16 monster_id, u8 stat_idx)
{
    return MONSTER_DATA_TABLE_PTR->entries[monster_id].base_atk[stat_idx];
}

u8 GetBaseDefensiveStat(s16 monster_id, u8 stat_idx)
{
    return MONSTER_DATA_TABLE_PTR->entries[monster_id].base_def[stat_idx];
}

enum type_id GetType(s16 monster_id, u8 type_idx)
{
    return MONSTER_DATA_TABLE_PTR->entries[monster_id].types[type_idx];
}

enum ability_id GetAbility(s16 monster_id, u8 ability_idx)
{
    return MONSTER_DATA_TABLE_PTR->entries[monster_id].abilities[ability_idx];
}

s16 GetRecruitRate2(s16 monster_id)
{
    return MONSTER_DATA_TABLE_PTR->entries[monster_id].recruit_rate_2;
}

s16 GetRecruitRate1(s16 monster_id)
{
    return MONSTER_DATA_TABLE_PTR->entries[monster_id].recruit_rate_1;
}
