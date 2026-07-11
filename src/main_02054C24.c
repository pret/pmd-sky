#include "main_02054C24.h"

extern enum monster_id FemaleToMaleForm(enum monster_id);
extern enum monster_id GetBaseFormBurmyWormadamShellosGastrodonCherrim(enum monster_id);
extern s16 GetDexNumber(enum monster_id);
extern bool8 IsDeoxys(enum monster_id monster_id);
extern bool8 IsUnown(enum monster_id);

enum monster_id GetBaseFormCastformDeoxysCherrim(enum monster_id monster_id)
{
    if (IsDeoxys(monster_id)) {
        return MONSTER_DEOXYS_NORMAL;
    }
    if ((u32) (u16) (s16) (monster_id + 0xFFFFFE85) <= 3U) {
        return MONSTER_CASTFORM_NORMAL;
    }
    if ((u32) (u16) (s16) (monster_id - MONSTER_CASTFORM_NORMAL_SECONDARY) <= 3U) {
        return MONSTER_CASTFORM_NORMAL_SECONDARY;
    }
    if ((u32) (u16) (s16) (monster_id - MONSTER_CHERRIM_OVERCAST) <= 1U) {
        return MONSTER_CHERRIM_OVERCAST;
    }
    if ((u32) (u16) (s16) (monster_id + 0xFFFFFBDC) <= 1U) {
        return MONSTER_CHERRIM_OVERCAST_SECONDARY;
    }
    return monster_id;
}

bool8 BaseFormsEqual(enum monster_id monster1, enum monster_id monster2)
{
    monster1 = FemaleToMaleForm(monster1);
    monster2 = FemaleToMaleForm(monster2);
    
    monster1 = GetBaseFormCastformDeoxysCherrim(monster1);
    monster2 = GetBaseFormCastformDeoxysCherrim(monster2);
    
    if (monster1 == monster2) {
        return TRUE;
    }
    
    if (IsUnown(monster1) && IsUnown(monster2)) {
        return FALSE;
    }
    
    enum monster_id monster1Base = GetBaseFormBurmyWormadamShellosGastrodonCherrim(monster1);
    enum monster_id monster2Base = GetBaseFormBurmyWormadamShellosGastrodonCherrim(monster2);

    if ((monster1Base == MONSTER_BURMY_SANDY && monster2Base == MONSTER_BURMY_SANDY) || 
        (monster1Base == MONSTER_WORMADAM_SANDY && monster2Base == MONSTER_WORMADAM_SANDY) || 
        (monster1Base == MONSTER_SHELLOS_EAST && monster2Base == MONSTER_SHELLOS_EAST) || 
        (monster1Base == MONSTER_GASTRODON_EAST && monster2Base == MONSTER_GASTRODON_EAST)) {
        return FALSE;
    }

    if (GetDexNumber(monster1) == GetDexNumber(monster2)) {
        return TRUE;
    }
    
    return FALSE;
}
