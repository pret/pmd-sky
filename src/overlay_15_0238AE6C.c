#include "overlay_15_0238AE6C.h"
#include "main_02001188.h"

extern unkStruct_ov15_0238AE6C* DUSKULL_BANK_STRUCT_PTR;

extern void BankUpdateDigitInputMenuDisplay(u8);
extern u16 InitDuskullBankStruct(void);
extern void Debug_Print0(const char* fmt);
extern int DuskullBankSubcaseManager1(void);
extern int IsDialogueBoxActive(s8);
extern void HidePortraitBox(int);
extern void sub_0202F2C4(s8);
extern void sub_0202836C(int);
extern void ClosePortraitBox(s8);
extern void CloseDialogueBox(int);
extern void ReturnScriptMenuResultZero(void);

void DuskullBankDigitInputDisplayCallback(void) {

    BankUpdateDigitInputMenuDisplay(DUSKULL_BANK_STRUCT_PTR->unkD8);
}

s32 DuskullBankEntryPoint(void) {

    InitDuskullBankStruct();
    return 1;
}

const char BANK_MES_NOT_CLOSE_STR[] = "mes not close\n";
const char BANK_SUB_NOT_CLOSE_STR[] = "sub not close\n";
const char BANK_SELECT_NOT_CLOSE_STR[] = "select not close\n";
const char BANK_INPUT_NOT_CLOSE_STR[] = "Input not close\n";

void DuskullBankDestructor(void) {

    if (DUSKULL_BANK_STRUCT_PTR == NULL)
        return;

    if (DUSKULL_BANK_STRUCT_PTR->unk80 != -2)
        Debug_Print0(BANK_MES_NOT_CLOSE_STR);

    if (DUSKULL_BANK_STRUCT_PTR->unk82 != -2)
        Debug_Print0(BANK_SUB_NOT_CLOSE_STR);

    if (DUSKULL_BANK_STRUCT_PTR->unk83 != -2)
        Debug_Print0(BANK_SELECT_NOT_CLOSE_STR);

    if (DUSKULL_BANK_STRUCT_PTR->unk84 != -2)
        Debug_Print0(BANK_INPUT_NOT_CLOSE_STR);

    MemFree(DUSKULL_BANK_STRUCT_PTR);
    DUSKULL_BANK_STRUCT_PTR = NULL;
}

int DuskullBankFrameUpdate(void) {

    switch(DUSKULL_BANK_STRUCT_PTR -> unk0) {

    case 0:
        DUSKULL_BANK_STRUCT_PTR -> unk0 = 1;
        break;
    case 1:
        if (DuskullBankSubcaseManager1() == 3)
            DUSKULL_BANK_STRUCT_PTR -> unk0 = 2;
        break;
    case 2:
        if (IsDialogueBoxActive(DUSKULL_BANK_STRUCT_PTR -> unk80) == FALSE) {
            HidePortraitBox(DUSKULL_BANK_STRUCT_PTR -> unk81);
            sub_0202F2C4(DUSKULL_BANK_STRUCT_PTR -> unk80);
            DUSKULL_BANK_STRUCT_PTR -> unk0 = 5;
        }
        break;
    case 4:
        break;
    case 5:
        sub_0202836C(DUSKULL_BANK_STRUCT_PTR -> unk80);
        ClosePortraitBox(DUSKULL_BANK_STRUCT_PTR -> unk81);
        CloseDialogueBox(DUSKULL_BANK_STRUCT_PTR -> unk80);
        DUSKULL_BANK_STRUCT_PTR -> unk0 = 3;
        DUSKULL_BANK_STRUCT_PTR -> unk80 = 0xfe;
        break;
    case 3:
        ReturnScriptMenuResultZero();
        return 4;
    }
    return 1;
}
