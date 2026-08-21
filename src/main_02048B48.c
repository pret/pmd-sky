#include "main_02048B48.h"

extern void InitOptions(void);

extern void InitScriptVariableValues(void);

extern void sub_02052C74(void);

extern void sub_0200CABC(void);

extern void StoreDefaultTeamData(void);

extern void ResetGlobalProgress(void);

extern void sub_0205B478(void);

extern void sub_0205C75C(void);

extern void ClearCroagunkItems(void);

void sub_02048B48(void)
{
    InitOptions();
    InitScriptVariableValues();
    sub_02052C74();
    sub_0200CABC();
    StoreDefaultTeamData();
    ResetGlobalProgress();
    sub_0205B478();
    sub_0205C75C();
    ClearCroagunkItems();
}
