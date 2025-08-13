#include "main_02054BE0.h"
#include "main_020527A8.h"
#include "enums.h"
#include "util.h"

bool8 IsDeoxys(s16 monster_id)
{
    return (u16)(s16)(monster_id - MONSTER_DEOXYS_NORMAL) <= 3;
}

s16 GetSecondFormIfValid(s16 id)
{
    u8 ret = GetMonsterGender(id);
    if (ret == 1)
    {
        if (GetMonsterGender(id + MONSTER_GENDER_ID_OFFSET) == 2)
            return id + MONSTER_GENDER_ID_OFFSET;
    }
    return id;
}

s16 FemaleToMaleForm(s16 monster_id)
{
    u8 gender = GetMonsterGender(monster_id);
    if (gender == 2 && monster_id >= MONSTER_GENDER_ID_OFFSET)
    {
        u8 gender = GetMonsterGender(monster_id - MONSTER_GENDER_ID_OFFSET);
        if (gender == 1)
        {
            return monster_id - MONSTER_GENDER_ID_OFFSET;
        }
    }
    return monster_id;
}
