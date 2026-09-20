#include "main_02048B48.h"
#include "main_02048BB4.h"

extern struct unk_020AFF38 _020AFF38[];

extern const char _0209CD4C[];

extern s32 _022AAE70;

extern void Debug_Print0(const char *fmt, s32 a, s32 b);

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

void sub_02048B74(void)
{
    Debug_Print0(_0209CD4C, _020AFF38[0].field_0x4, 0);
    _020AFF38[0].field_0x4 = 0;
    _022AAE70 = -1;
}
