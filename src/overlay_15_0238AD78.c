#include "overlay_15_0238AD78.h"

extern unkStruct_ov15_0238AD78* DUSKULL_BANK_STRUCT_PTR;

extern void AppendStandardStringToMission(u32, u32, u32, u16);
extern void DigitInputMenuDrawDigits(u32*);

void BankUpdateDigitInputMenuDisplay(u8 r0) {
    #ifdef JAPAN
    u32 uVar1 = r0 != 0 ? 12873 : 12874;
    #else
    u32 uVar1 = r0 != 0 ? 900 : 901;
    #endif

    AppendStandardStringToMission(DUSKULL_BANK_STRUCT_PTR->unk68, 2, 0, uVar1);
    DigitInputMenuDrawDigits(&DUSKULL_BANK_STRUCT_PTR->unk54);
    return;
}
