#include "overlay_24.h"

extern void CloseCollectionMenu(s8);                          
extern void CloseDialogueBox(s8);                             
extern void FreeMissionRewardStructMain();                    
extern s32 GetEggHatchTimer();                             
extern s32 GetKeyboardStatus();                            
extern const u8 *GetKeyboardStringResult();                      
extern s32 GetSimpleMenuResult__0202B870(s8);              
extern void HidePortraitBox(s8);                              
extern s32 IsDialogueBoxActive(s8);                        
extern void ShowDialogueBox(s8);                              
extern void StrcpySimple(unsigned char* dest, const unsigned char* src);                         
extern void StrncpySimpleNoPadSafe(u8* dest, const u8* src, u32 n);          
extern void ov11_022DC504();                                  
extern struct overlay_24_unk1E8_sub *ov11_02306C64();                                
extern s32 ov11_02306C9C();                                
extern s32 ov11_0230D220();                                
extern void ov24_0238A610(s32);                               
extern void ov24_0238C47C();                                  
extern void sub_0202836C(s8);                                 
extern void sub_0202F2C4(s8);                                 
extern s32 sub_02037468();                                 
extern s32 sub_02039218();                                 
extern s32 sub_0203931C();                                 
extern s32 sub_0203D538();                                 


s32 ov24_0238A140(void)
{
    s32 menu_result;
    s32 temp_r0_5;
    s32 temp_r1_2;

    switch (OVERLAY24_UNKNOWN_POINTER__NA_238C600->unk0) 
    {                              
        case 0:                                         
        case 1:                                         
            if (IsDialogueBoxActive(OVERLAY24_UNKNOWN_POINTER__NA_238C600->unk28C) == 0) {
                ov24_0238A610(0x1A);
                ShowDialogueBox(OVERLAY24_UNKNOWN_POINTER__NA_238C600->unk28C);
            }
            
            break;
        case 20:                                        
            switch(ov11_02306C9C())
            {
                case 4:
                    ov11_02306C64();
                    ov24_0238A610(0x11);
                    break;
                case 3:
                    OVERLAY24_UNKNOWN_POINTER__NA_238C600->unk1E8 = ov11_02306C64();
                    ov24_0238A610(0x26);
                    break;
            }
            
            break;
        case 14:                                        
        case 29:                                        
            switch (GetSimpleMenuResult__0202B870(OVERLAY24_UNKNOWN_POINTER__NA_238C600->unk28F)) {                        
            case 4:                                     
                ov24_0238C47C();
                ov24_0238A610(0x13);
                break;
            case 1:                                     
            case 5:                                     
                ov24_0238C47C();
                ov24_0238A610(0x11);
                break;
            }
            break;
        case 4:                                         
            ov11_022DC504();
            return 3;
        case 25:                                        
            if ((ov11_0230D220() == 0) && (IsDialogueBoxActive(OVERLAY24_UNKNOWN_POINTER__NA_238C600->unk28C) == 0)) {
                ShowDialogueBox(OVERLAY24_UNKNOWN_POINTER__NA_238C600->unk28C);
                OVERLAY24_UNKNOWN_POINTER__NA_238C600->unk0 = 0x27;
                sub_0202F2C4(OVERLAY24_UNKNOWN_POINTER__NA_238C600->unk28C);
                HidePortraitBox(OVERLAY24_UNKNOWN_POINTER__NA_238C600->unk28D);
            }
            
            break;
        case 26:                                        
            menu_result = GetSimpleMenuResult__0202B870(OVERLAY24_UNKNOWN_POINTER__NA_238C600->unk28F);
            if (menu_result != 1) {
                OVERLAY24_UNKNOWN_POINTER__NA_238C600->unk1C = menu_result;
            }
            switch (menu_result) {                        
                case 7:                                     
                    ov24_0238C47C();
                    switch (GetEggHatchTimer()) {                    
                        case 0:                                 
                            ov24_0238A610(9);
                            break;
                        case 1:                                 
                            ov24_0238A610(7);
                            break;
                        case 2:                                 
                            ov24_0238A610(6);
                            break;
                        default:                                
                            ov24_0238A610(5);
                            break;
                    }
                    break;
                case 6:                                     
                    ov24_0238C47C();
                    ov24_0238A610(2);
                    break;
                case 1:                                     
                    ov24_0238C47C();
                    ov24_0238A610(3);
                    break;
            }
            break;
        case 32:                                        
        case 33:                                        
            if (GetKeyboardStatus() == 3) {
                StrcpySimple(OVERLAY24_UNKNOWN_POINTER__NA_238C600->unk42, GetKeyboardStringResult());
                StrncpySimpleNoPadSafe(OVERLAY24_UNKNOWN_POINTER__NA_238C600->unk22, OVERLAY24_UNKNOWN_POINTER__NA_238C600->unk42, 0x10);
                ov24_0238A610(0x24);
            }
            
            break;
        case 36:                                        
            if (sub_02037468() != 0) {
                ov24_0238A610(0x22);
            }
            
            break;
        case 34:                                        
            temp_r0_5 = sub_0203931C();
            if (temp_r0_5 == 0) {
                OVERLAY24_UNKNOWN_POINTER__NA_238C600->unk4 = 0x10;
                ov24_0238A610(0x23);
            } else if (temp_r0_5 == 1) {
                OVERLAY24_UNKNOWN_POINTER__NA_238C600->unk4 = 0x21;
                ov24_0238A610(0x23);
            }
            
            break;
        case 35:                                        
            if (sub_02039218() != 0) {
                ov24_0238A610(OVERLAY24_UNKNOWN_POINTER__NA_238C600->unk4);
            }
            
            break;
        case 30:                                        
            OVERLAY24_UNKNOWN_POINTER__NA_238C600->unkC++;
            switch (OVERLAY24_UNKNOWN_POINTER__NA_238C600->unkC) 
            {                        
                case 2:                                     
                    break;
                case 1:                                     
                    sub_0202836C(OVERLAY24_UNKNOWN_POINTER__NA_238C600->unk28E);
                    CloseCollectionMenu(OVERLAY24_UNKNOWN_POINTER__NA_238C600->unk28E);
                    break;
                case 3:                                     
                    ov24_0238A610(OVERLAY24_UNKNOWN_POINTER__NA_238C600->unk8);
                    OVERLAY24_UNKNOWN_POINTER__NA_238C600->unkC = 0;
                    break;
            }
            
            break;
        case 23:                                        
            if (IsDialogueBoxActive(OVERLAY24_UNKNOWN_POINTER__NA_238C600->unk28C) == 0) {
                CloseDialogueBox(OVERLAY24_UNKNOWN_POINTER__NA_238C600->unk28C);
                OVERLAY24_UNKNOWN_POINTER__NA_238C600->unk28C = -2;
                ov24_0238A610(0x18);
            }
            
            break;
        case 24:                                        
            switch (sub_0203D538()) 
            {                        
                case -1:                                    
                    FreeMissionRewardStructMain();
                    ov24_0238A610(4);
                    break;
                case 1:                                     
                    FreeMissionRewardStructMain();
                    ov24_0238A610(4);
                    break;
            }
            
            break;
        case 38:                                        
            temp_r1_2 = OVERLAY24_UNKNOWN_POINTER__NA_238C600->unkC;
            OVERLAY24_UNKNOWN_POINTER__NA_238C600->unkC--;
            if (temp_r1_2 == 0) {
                ov24_0238A610(0x1F);
            }
            break;
        default:                                        
        case 2:                                         
        case 3:                                         
        case 5:                                         
        case 6:                                         
        case 7:                                         
        case 8:                                         
        case 9:                                         
        case 10:                                        
        case 11:                                        
        case 12:                                        
        case 13:                                        
        case 15:                                        
        case 16:                                        
        case 17:                                        
        case 18:                                        
        case 19:                                        
        case 21:                                        
        case 22:                                        
        case 27:                                        
        case 28:                                        
        case 31:                                        
        case 37:                                        
            if ((ov11_0230D220() == 0) && (IsDialogueBoxActive(OVERLAY24_UNKNOWN_POINTER__NA_238C600->unk28C) == 0)) {
                ShowDialogueBox(OVERLAY24_UNKNOWN_POINTER__NA_238C600->unk28C);
                ov24_0238A610(OVERLAY24_UNKNOWN_POINTER__NA_238C600->unk8);
            }
            break;
            
    }
    return 0;
}
