#include "main_02054DC4.h"
#include "main_020527A8.h"
#include "util.h"
#include "main_020526EC.h"
#include "main_02054AA4.h"
#include "main_02054BE0.h"

extern s16 GetBaseFormCastformDeoxysCherrim(s16 monster_id);

bool32 DexNumbersEqual(s16 monster1, s16 monster2) {
    s16 base_form_1 = FemaleToMaleForm(monster1);
    s16 base_form_2 = FemaleToMaleForm(monster2);
    s16 true_base_1 = GetBaseFormCastformDeoxysCherrim(base_form_1);
    s16 true_base_2 = GetBaseFormCastformDeoxysCherrim(base_form_2);
    if (true_base_1 == true_base_2) return TRUE;
    else if (IsUnown(true_base_1) && IsUnown(true_base_2)) return FALSE;
    else return GetDexNumber(true_base_1) == GetDexNumber(true_base_2);
}

u8 GendersEqual(s16 monster1, s16 monster2)
{
    return GetMonsterGender(monster1) == GetMonsterGender(monster2);
}

u8 GendersEqualNotGenderless(s16 monster1, s16 monster2) 
{

    if ((GetMonsterGender(monster1) != 3) && (GetMonsterGender(monster2) != 3))
        if(GetMonsterGender(monster1) == GetMonsterGender(monster2))
            return TRUE;
    return FALSE;
}

u8 GendersNotEqualNotGenderless(s16 monster1, s16 monster2) 
{

    if ((GetMonsterGender(monster1) != 3) && (GetMonsterGender(monster2) != 3))
        if(GetMonsterGender(monster1) != GetMonsterGender(monster2))
            return TRUE;
    return FALSE;
}

u8 sub_02054F18(s32 _arg0)
{
    s32 arg0 = (u16) _arg0;

    if ((u32) (u16) (arg0 + 0xFDEA) <= 2U) {
        return TRUE;
    } else {
        return FALSE;
    }
}
