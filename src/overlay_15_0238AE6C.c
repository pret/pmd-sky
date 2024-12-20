#include "overlay_15_0238AE6C.h"

extern unkStruct_ov15_0238AE6C* OVERLAY15_UNKNOWN_POINTER__NA_238B180;

extern u16 ov15_0238A140(void);
extern void ov15_0238AD78(u8);
extern void Debug_Print0(const char* fmt);
extern void MemFree(void*);

void ov15_0238AE6C(void)
{
    ov15_0238AD78(OVERLAY15_UNKNOWN_POINTER__NA_238B180->unkD8);
}

s32 ov15_0238AE88(void)
{
    ov15_0238A140();
    return 1;
}

const char ov15_0238B11C[] = "mes not close\n";
const char ov15_0238B12C[] = "sub not close\n";
const char ov15_0238B13C[] = "select not close\n";
const char ov15_0238B150[] = "Input not close\n";

void ov15_0238AE98(void)
{
    if (OVERLAY15_UNKNOWN_POINTER__NA_238B180 == NULL) {
        return;
    }
    if (OVERLAY15_UNKNOWN_POINTER__NA_238B180->unk80 != -2) {
        Debug_Print0(ov15_0238B11C);
    }
    if (OVERLAY15_UNKNOWN_POINTER__NA_238B180->unk82 != -2) {
        Debug_Print0(ov15_0238B12C);
    }
    if (OVERLAY15_UNKNOWN_POINTER__NA_238B180->unk83 != -2) {
        Debug_Print0(ov15_0238B13C);
    }
    if (OVERLAY15_UNKNOWN_POINTER__NA_238B180->unk84 != -2) {
        Debug_Print0(ov15_0238B150);
    }
    MemFree(OVERLAY15_UNKNOWN_POINTER__NA_238B180);
    OVERLAY15_UNKNOWN_POINTER__NA_238B180 = NULL;
}
