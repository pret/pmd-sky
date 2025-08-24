#include "main_020526EC.h"
#include "monster_data.h"

u16 GetSpriteIndex__020526EC(s16 monster_id)
{
    return MONSTER_DATA_TABLE_PTR->entries[monster_id].sprite_index;
}

u16 GetSpriteIndex__02052708(s16 monster_id)
{
    return MONSTER_DATA_TABLE_PTR->entries[monster_id].sprite_index;
}

u16 GetSpriteIndex__02052724(s16 monster_id)
{
    return MONSTER_DATA_TABLE_PTR->entries[monster_id].sprite_index;
}

s16 GetDexNumber(s16 monster_id)
{
    return MONSTER_DATA_TABLE_PTR->entries[monster_id].pokedex_number;
}
