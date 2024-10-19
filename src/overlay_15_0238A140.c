#include "overlay_15_0238A140.h"

extern unkBankStruct* OVERLAY15_UNKNOWN_POINTER__NA_238B180;

extern void* MemAlloc(u32 len, u32 flags);
extern void InitPreprocessorArgs(preprocessor_args*);
extern u32 CreateDialogueBox(u32);
extern u32 CreatePortraitBox(u32, u32, u32);
extern void InitPortraitParamsWithMonsterId(portrait_params**, enum monster_id);
extern void SetPortraitLayout(portrait_params**, u32);
extern void SetPortraitEmotion(portrait_params**, u32);
extern void ShowPortraitInPortraitBox(u32, portrait_params**);
extern void ov15_0238A4E8(u32);

u16 ov15_0238A140(void)
{
    void* memPtr = MemAlloc(0xEC, 8);

    OVERLAY15_UNKNOWN_POINTER__NA_238B180 = memPtr;

    InitPreprocessorArgs((preprocessor_args*)(&OVERLAY15_UNKNOWN_POINTER__NA_238B180->unk88));
    OVERLAY15_UNKNOWN_POINTER__NA_238B180->unk80 = CreateDialogueBox(0);

    OVERLAY15_UNKNOWN_POINTER__NA_238B180->unk81 = CreatePortraitBox(0, 3, 1);

    OVERLAY15_UNKNOWN_POINTER__NA_238B180->unk68 = 0xFE;

    OVERLAY15_UNKNOWN_POINTER__NA_238B180->unk10 = 0;
    OVERLAY15_UNKNOWN_POINTER__NA_238B180->unk88 = MONSTER_DUSKULL;
    OVERLAY15_UNKNOWN_POINTER__NA_238B180->unkAC = 0x270F;
    OVERLAY15_UNKNOWN_POINTER__NA_238B180->unkD4 = MONSTER_DUSKULL;
    OVERLAY15_UNKNOWN_POINTER__NA_238B180->unk0 = 0;

    InitPortraitParamsWithMonsterId(&OVERLAY15_UNKNOWN_POINTER__NA_238B180->unkDC, MONSTER_DUSKULL);
    SetPortraitLayout(&OVERLAY15_UNKNOWN_POINTER__NA_238B180->unkDC,0);
    SetPortraitEmotion(&OVERLAY15_UNKNOWN_POINTER__NA_238B180->unkDC,0);
    ShowPortraitInPortraitBox(OVERLAY15_UNKNOWN_POINTER__NA_238B180->unk81, &OVERLAY15_UNKNOWN_POINTER__NA_238B180->unkDC);
    ov15_0238A4E8(0);
    return 1;
}
