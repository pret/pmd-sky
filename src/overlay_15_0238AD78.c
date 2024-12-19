#include "overlay_15_0238AD78.h"

extern unkStruct_ov15_0238AD78* OVERLAY15_UNKNOWN_POINTER__NA_238B180;

extern void sub_02026268(u32, u32, u32, u16);
extern void sub_02039B0C(u32*);

void ov15_0238AD78(u8 r0) {
    #ifdef JAPAN
    u32 uVar1 = r0 != 0 ? 12873 : 12874;
    #else
    u32 uVar1 = r0 != 0 ? 900 : 901;
    #endif

    sub_02026268(OVERLAY15_UNKNOWN_POINTER__NA_238B180->unk68, 2, 0, uVar1);
    sub_02039B0C(&OVERLAY15_UNKNOWN_POINTER__NA_238B180->unk54);
    return;
}
