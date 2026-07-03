#include "overlay_15_0238A140.h"

extern unkBankStruct* DUSKULL_BANK_STRUCT_PTR;

extern void* MemAlloc(u32 len, u32 flags);
extern void InitPreprocessorArgs(preprocessor_args*);
extern u32 CreateDialogueBox(u32);
extern u32 CreatePortraitBox(u32, u32, u32);
extern void InitPortraitParamsWithMonsterId(portrait_params**, enum monster_id);
extern void SetPortraitLayout(portrait_params**, u32);
extern void SetPortraitEmotion(portrait_params**, u32);
extern void ShowPortraitInPortraitBox(u32, portrait_params**);
extern void DuskullBankSubcaseManager2(u32);

u16 InitDuskullBankStruct(void)
{
    void* memPtr = MemAlloc(0xEC, 8);

    DUSKULL_BANK_STRUCT_PTR = memPtr;

    InitPreprocessorArgs((preprocessor_args*)(&DUSKULL_BANK_STRUCT_PTR->unk88));
    DUSKULL_BANK_STRUCT_PTR->unk80 = CreateDialogueBox(0);

    DUSKULL_BANK_STRUCT_PTR->unk81 = CreatePortraitBox(0, 3, 1);

    DUSKULL_BANK_STRUCT_PTR->unk68 = 0xFE;

    DUSKULL_BANK_STRUCT_PTR->unk10 = 0;
    DUSKULL_BANK_STRUCT_PTR->unk88 = MONSTER_DUSKULL;
    DUSKULL_BANK_STRUCT_PTR->unkAC = 0x270F;
    DUSKULL_BANK_STRUCT_PTR->unkD4 = MONSTER_DUSKULL;
    DUSKULL_BANK_STRUCT_PTR->unk0 = 0;

    InitPortraitParamsWithMonsterId(&DUSKULL_BANK_STRUCT_PTR->unkDC, MONSTER_DUSKULL);
    SetPortraitLayout(&DUSKULL_BANK_STRUCT_PTR->unkDC,0);
    SetPortraitEmotion(&DUSKULL_BANK_STRUCT_PTR->unkDC,0);
    ShowPortraitInPortraitBox(DUSKULL_BANK_STRUCT_PTR->unk81, &DUSKULL_BANK_STRUCT_PTR->unkDC);
    DuskullBankSubcaseManager2(0);
    return 1;
}
