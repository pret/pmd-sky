#include "main_020527A8.h"
#include "monster_data.h"

u8 GetMonsterGender(s16 monster_id)
{
    return MONSTER_DATA_TABLE_PTR.field_0x0->entries[monster_id].gender;
}

u8 GetBodySize(s16 monster_id)
{
    return MONSTER_DATA_TABLE_PTR.field_0x0->entries[monster_id].body_size;
}

u8 GetSpriteSize(s16 monster_id)
{
    s32 raw = monster_id % 600;
    s16 mod = raw;
    u8 size = MONSTER_SPRITE_DATA[mod].sprite_size;
    if (size == 0) {
        return 0;
    }
    if (size <= 6) {
        return 6;
    }
    return MONSTER_SPRITE_DATA[raw].sprite_size;
}

u32 GetSpriteFileSize(s16 monster_id)
{
    s32 raw = monster_id % 600;
    return MONSTER_SPRITE_DATA[raw].sprite_file_size << 9;
}
