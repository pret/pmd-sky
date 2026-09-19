#include "main_02062A58.h"



#include "main_02054BE0.h"
#include "main_0204D188.h"
#include "enums.h"
extern s16 GetBaseForm(s16 id);
extern bool8 IsMonsterMissionAllowed(s16 id);
extern bool8 IsMonsterMissionAllowedStory(s16 id);
bool8 CanMonsterBeUsedForMissionWrapper(s16 id)
{
    return CanMonsterBeUsedForMission(id, TRUE);
}

bool8 CanMonsterBeUsedForMission(s16 id, bool8 flag)
{
    s16 m;

    m = FemaleToMaleForm(id);
    if (!HasMonsterBeenAttackedInDungeons(m)) {
        return FALSE;
    }
    if (m != GetBaseForm(m)) {
        return FALSE;
    }
    if (flag) {
        if (!IsMonsterMissionAllowed(m)) {
            return FALSE;
        }
    }
    if (!IsMonsterMissionAllowedStory(m)) {
        return FALSE;
    }
    return TRUE;
}

bool8 sub_02062AD0(s16 id)
{
    return IsMonsterMissionAllowedStory(FemaleToMaleForm(GetBaseForm(id)));
}
