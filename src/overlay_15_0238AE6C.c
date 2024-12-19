#include "overlay_15_0238AE6C.h"

extern unkStruct_ov15_0238AE6C* OVERLAY15_UNKNOWN_POINTER__NA_238B180;

extern u16 ov15_0238A140(void);
extern void ov15_0238AD78(u8);
extern void Debug_Print0(const char* fmt);
extern void MemFree(void*);

//TODO change these array literals into proper string representation and pass to Debug_Print0

// "mes not close\n" with null termination and padding
static const char ov15_0238B11C[] = {
    0x6D, 0x65, 0x73, 0x20, // "mes "
    0x6E, 0x6F, 0x74, 0x20, // "not "
    0x63, 0x6C, 0x6F, 0x73, // "clos"
    0x65, 0x0A, 0x00, 0x00  // "e\n" + padding
};

// "sub not close\n" with null termination and padding
static const char ov15_0238B12C[] = {
    0x73, 0x75, 0x62, 0x20, // "sub "
    0x6E, 0x6F, 0x74, 0x20, // "not "
    0x63, 0x6C, 0x6F, 0x73, // "clos"
    0x65, 0x0A, 0x00, 0x00  // "e\n" + padding
};

// "select not close\n" with null termination and padding
static const char ov15_0238B13C[] = {
    0x73, 0x65, 0x6C, 0x65, // "sele"
    0x63, 0x74, 0x20, 0x6E, // "ct n"
    0x6F, 0x74, 0x20, 0x63, // "ot c"
    0x6C, 0x6F, 0x73, 0x65, // "lose"
    0x0A, 0x00, 0x00, 0x00  // "\n" + padding
};

// "Input not close\n" with null termination and padding
static const char ov15_0238B150[] = {
    0x49, 0x6E, 0x70, 0x75, // "Inpu"
    0x74, 0x20, 0x6E, 0x6F, // "t no"
    0x74, 0x20, 0x63, 0x6C, // "t cl"
    0x6F, 0x73, 0x65, 0x0A, // "ose\n"
    0x00, 0x00, 0x00, 0x00  // Null termination + padding
};

void ov15_0238AE6C(void)
{
    ov15_0238AD78(OVERLAY15_UNKNOWN_POINTER__NA_238B180->unkD8);
}

s32 ov15_0238AE88(void)
{
    ov15_0238A140();
    return 1;
}

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
