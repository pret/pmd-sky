#include "main_02054BE0.h"
#include "enums.h"

extern s16 GetMonsterGender(s16 monster_id);

s16 GetSecondFormIfValid(s16 id)
{
    s16 ret = GetMonsterGender(id);
    if (ret == 1)
    {
        if (GetMonsterGender(id + MONSTER_GENDER_ID_OFFSET) == 2)
            return id + MONSTER_GENDER_ID_OFFSET;
    }
    return id;
}

s16 FemaleToMaleForm(s16 monster_id)
{
    s16 gender = GetMonsterGender(monster_id);
    if (gender == 2 && monster_id >= MONSTER_GENDER_ID_OFFSET)
    {
        s16 gender = GetMonsterGender(monster_id - MONSTER_GENDER_ID_OFFSET);
        if (gender == 1)
        {
            return monster_id - MONSTER_GENDER_ID_OFFSET;
        }
    }
    return monster_id;
}
