#include "overlay_15_0238AE6C.h"

extern unkStruct_ov15_0238AE6C* OVERLAY15_UNKNOWN_POINTER__NA_238B180;

extern void ov15_0238AD78(u8);
extern u16 ov15_0238A140(void);
extern void Debug_Print0(const char* fmt);
extern void MemFree(void*);
extern int ov15_0238A234(void);
extern int IsDialogueBoxActive(s8);
extern void HidePortraitBox(int);
extern void sub_0202F2C4(s8);
extern void sub_0202836C(int);
extern void ClosePortraitBox(s8);
extern void CloseDialogueBox(int);
extern void ov11_022E6E68(void);

void ov15_0238AE6C(void) {

    ov15_0238AD78(OVERLAY15_UNKNOWN_POINTER__NA_238B180->unkD8);
}

s32 ov15_0238AE88(void) {

    ov15_0238A140();
    return 1;   
}

const char ov15_0238B11C[] = "mes not close\n";
const char ov15_0238B12C[] = "sub not close\n";
const char ov15_0238B13C[] = "select not close\n";
const char ov15_0238B150[] = "Input not close\n";

void ov15_0238AE98(void) {

    if (OVERLAY15_UNKNOWN_POINTER__NA_238B180 == NULL) 
        return;
    
    if (OVERLAY15_UNKNOWN_POINTER__NA_238B180->unk80 != -2) 
        Debug_Print0(ov15_0238B11C);
    
    if (OVERLAY15_UNKNOWN_POINTER__NA_238B180->unk82 != -2) 
        Debug_Print0(ov15_0238B12C);
    
    if (OVERLAY15_UNKNOWN_POINTER__NA_238B180->unk83 != -2) 
        Debug_Print0(ov15_0238B13C);
    
    if (OVERLAY15_UNKNOWN_POINTER__NA_238B180->unk84 != -2) 
        Debug_Print0(ov15_0238B150);
    
    MemFree(OVERLAY15_UNKNOWN_POINTER__NA_238B180);
    OVERLAY15_UNKNOWN_POINTER__NA_238B180 = NULL;
}

int ov15_0238AF54(void) {

    switch(OVERLAY15_UNKNOWN_POINTER__NA_238B180 -> unk0) {

    case 0:
        OVERLAY15_UNKNOWN_POINTER__NA_238B180 -> unk0 = 1;
        break;
    case 1:
        if (ov15_0238A234() == 3) 
            OVERLAY15_UNKNOWN_POINTER__NA_238B180 -> unk0 = 2;
        break;
    case 2:
        if (IsDialogueBoxActive(OVERLAY15_UNKNOWN_POINTER__NA_238B180 -> unk80) == FALSE) {
            HidePortraitBox(OVERLAY15_UNKNOWN_POINTER__NA_238B180 -> unk81);
            sub_0202F2C4(OVERLAY15_UNKNOWN_POINTER__NA_238B180 -> unk80);
            OVERLAY15_UNKNOWN_POINTER__NA_238B180 -> unk0 = 5;
        }
        break;
    case 4:
        break;
    case 5:
        sub_0202836C(OVERLAY15_UNKNOWN_POINTER__NA_238B180 -> unk80);
        ClosePortraitBox(OVERLAY15_UNKNOWN_POINTER__NA_238B180 -> unk81);
        CloseDialogueBox(OVERLAY15_UNKNOWN_POINTER__NA_238B180 -> unk80);
        OVERLAY15_UNKNOWN_POINTER__NA_238B180 -> unk0 = 3;
        OVERLAY15_UNKNOWN_POINTER__NA_238B180 -> unk80 = 0xfe;
        break;
    case 3:
        ov11_022E6E68();
        return 4; 
    }
    return 1;
}
