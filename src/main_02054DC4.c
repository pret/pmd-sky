#include "main_02054DC4.h"
#include "util.h"
#include "main_02054AA4.h"
#include "main_02054BE0.h"

extern s16 GetBaseFormCastformDeoxysCherrim(s16 monster_id);
extern s16 GetDexNumber(s16 monster_id);

bool32 DexNumbersEqual(s16 monster1, s16 monster2) {
    s16 base_form_1 = FemaleToMaleForm(monster1);
    s16 base_form_2 = FemaleToMaleForm(monster2);
    s16 true_base_1 = GetBaseFormCastformDeoxysCherrim(base_form_1);
    s16 true_base_2 = GetBaseFormCastformDeoxysCherrim(base_form_2);
    if (true_base_1 == true_base_2) return TRUE;
    else if (IsUnown(true_base_1) && IsUnown(true_base_2)) return FALSE;
    else return GetDexNumber(true_base_1) == GetDexNumber(true_base_2);
}
