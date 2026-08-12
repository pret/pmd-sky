#include "overlay_25.h"
#include "main_0200C4FC.h"
#include "item.h"


extern void CloseDialogueBox(s8);                             
extern void ClosePortraitBox(s8);                             
extern void CloseScrollBox(s8);                               
extern void CloseTextBox2(s8);                                
extern void CloseSimpleMenu(s8);                              
extern void CloseTextBox(s8);                                 
extern s32 GetMoneyCarried();                              
extern s32 GetNbItemsInBag();                              
extern void GetPressedButtons(void *, u16*);                       
extern s32 GetSimpleMenuResult__0202B870(s8);              
extern void HidePortraitBox(s8);                              
extern s32 IsDialogueBoxActive(s8);                        
extern s32 IsScrollBoxActive(s8);                          
extern void PlaySeByIdVolumeWrapper(s32);                     
extern void ShowDialogueBox(s8);                              
extern void ShowStringIdInDialogueBox(s8, s32, s32, void*);   
extern s32 ov11_0230B724();                                
extern void ov11_0230B8C0(void*);                             
extern void ov11_0230B9BC();                                  
extern s32 ov11_0230BA64();                                
extern void ov11_0230BCF8();                                  
extern s32 ov11_0230BD28();                                
extern void ov25_0238A694(s32);                               
extern void sub_02017C74(s32, s32);                             
extern void sub_0202836C(s8);                                 
extern void sub_0202F2C4(s8);                                 

extern void AddItemToBagNoHeld(struct item*);                          
extern void AddMoneyCarried(s32);                               
extern s8 CreateDialogueBox(s8);                            
extern s8 CreatePortraitBox(s32, s32, s32);                      
extern s8 CreateScrollBoxSingle(void*, s32, s32, s32, void*, s32, void*); 
extern s8 CreateSimpleMenuFromStringIds(void*, s32, s32, void*, s32); 
extern s8 CreateTextBox(void*, void*);                           
extern void InitPortraitParamsWithMonsterId(void*, s32);        
extern void InitPreprocessorArgs(void*);                         
extern s32 IsThrownItem(s16);                              
extern void ItemToBulkItem(struct bulk_item* bulk, struct item* item);
extern void MaybeGetColoredFormattedItemName(void*, struct item*, void*); 
extern int PreprocessString(char *output,int output_size,char *format,u16 flags,struct preprocessor_args *args);
extern void RemoveItemByIdAndStackNoHole(void*);                 
extern void SetPortraitEmotion(void*, s8);                    
extern void SetPortraitLayout(void*, s32);                      
extern void ShowPortraitInPortraitBox(s8, void*);             
extern void SwapShopInventoryManager(s32, s32);                   
extern void ov11_022DC504();                                  
extern void ov11_0230C910();
extern void* MemAlloc(s32, s32);                               
extern void MemFree(void *ptr);
extern BOOL IsScriptMenuReturnDisabled();                   
extern void ReturnScriptMenuResult(s32);                        
extern void ReturnScriptMenuResultZero(void);                     
extern void UpdateWindow(char *);                                  
extern void sub_02027B1C(char *);                                   
extern void AppendStandardStringToMission(char *, s32, s32, s32);      
extern void DrawTextInWindow(char *, s32, s32, void*);                    

extern s32 APPRAISAL_MAIN_MENU_ITEMS;
extern s32 APPRAISAL_MENU_ITEMS_CONFIRM;
extern s32 APPRAISAL_SUBMENU_ITEMS;
extern s32 APPRAISAL_WINDOW_PARAMS_1;
extern s32 APPRAISAL_WINDOW_PARAMS_5;
extern s32 APPRAISAL_WINDOW_PARAMS_6;
extern s32 APPRAISAL_WINDOW_PARAMS_7;
extern s32 APPRAISAL_WINDOW_PARAMS_8;
extern s32 OVERLAY25_UNKNOWN_STRUCT__NA_238B498;
extern s32 ov25_0238B5A4;
extern s32 ov25_0238B5B0;

extern struct overlay_25* OVERLAY25_UNKNOWN_POINTER__NA_238B5E0;


s32 ov25_0238A140(void)
{
    u16 sp0;
    s32 temp_r0_4;

    switch (OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->state) {                              
        case 0:                                         
        case 1:                                         
            if (IsDialogueBoxActive(OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk138) == 0) {
                ov25_0238A694(0x1A);
                ShowDialogueBox(OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk138);
            }
            break;
        case 12:                                        
        case 13:                                        
            switch (ov11_0230BA64()) {                          
                case 2:                                     
                    OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->state = 0x1F;
                    OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk4 = 1;
                    break;
                case 3:                                     
                    ov11_0230B8C0(&OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unkC);
                    ov25_0238A694(0xE);
                    /* fallthrough */
                default:                                    
                    if (ov11_0230BD28() != 0) {
                        GetPressedButtons(0, &sp0);
                        if (sp0 & 8) {
                            sub_02017C74(0x3F02, 0x100);
                            ov11_0230B8C0(&OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unkC);
                            ov25_0238B380();
                            OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk4 = 0xF;
                            OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->state = 0x1F;
                        }
                    }
                    break;
            }
            break;
        case 14:                                        
            switch (GetSimpleMenuResult__0202B870(OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk13A)) {                       
                case 7:                                     
                    OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk4 = 0x10;
                    ov25_0238B380();
                    OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->state = 0x1F;
                    break;
                case 6:                                     
                    ov25_0238B380();
                    OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk4 = 0xF;
                    OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->state = 0x1F;
                    break;
                case 1:                                     
                    ov25_0238B380();
                    OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->state = 0xD;
                    ov11_0230BCF8();
                    break;
            }
            break;
        case 15:                                        
            if (IsScrollBoxActive(OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk13B) == 0) {
                CloseScrollBox(OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk13B);
                OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk13B = -2;
                ov25_0238A694(0xD);
            }
            
            break;
        case 16:                                        
        case 29:                                        
            switch (GetSimpleMenuResult__0202B870(OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk13A)) {                        
                case 4:                                     
                    ov25_0238B380();
                    if (GetMoneyCarried() < 0x96) {
                        ov25_0238A694(9);
                    } else {
                        ov25_0238A694(0x11);
                        PlaySeByIdVolumeWrapper(0x1308);
                    }
                    break;
                case 1:                                     
                case 5:                                     
                    ov25_0238B380();
                    ov25_0238A694(0x12);
                    break;
            }
            break;
        case 4:                                         
            return 3;
        case 25:                                        
            if (IsDialogueBoxActive(OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk138) == 0) {
                ShowDialogueBox(OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk138);
                OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->state = 0x20;
                sub_0202F2C4(OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk138);
                HidePortraitBox(OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk139);
            }
            break;
        case 26:                                        
            temp_r0_4 = GetSimpleMenuResult__0202B870(OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk13A);
            if (temp_r0_4 != 1) {
                OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk14 = temp_r0_4;
            }
            switch (temp_r0_4) {                        
                case 7:                                     
                    ov25_0238B380();
                    if (GetNbItemsInBag() == 0) {
                        ov25_0238A694(5);
                    } else if (ov11_0230B724() == 0) {
                        ov25_0238A694(6);
                    } else {
                        ov25_0238A694(0xA);
                    }
                    break;
                case 6:                                     
                    ov25_0238B380();
                    ov25_0238A694(2);
                    break;
                case 1:                                     
                    ov25_0238B380();
                    ov25_0238A694(3);
                    break;
            }
            break;
        case 30:                                        
            OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk8++;
            switch (OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk8) {                       
                case 2:                                    
                    break;
                case 1:                                    
                    sub_0202836C(OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk13C);
                    CloseTextBox2(OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk13C);
                    ov11_0230B9BC();
                    break;
                case 3:                                    
                    ov25_0238A694(OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk4);
                    OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk8 = 0;
                    break;
            }
            break;
        case 31:                                        
            OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk8++;
            switch (OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk8) {                       
                case 2:                                     
                    break;
                case 1:                                     
                    ov11_0230B9BC();
                    break;
                case 3:                                     
                    ov25_0238A694(OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk4);
                    OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk8 = 0;
                    break;
            }
            break;
        case 19:                                        
            OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk4 = 0x14;
#ifdef JAPAN
            ShowStringIdInDialogueBox(OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk138, 0x3008, 0x32C6, &OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk28);
#else
            ShowStringIdInDialogueBox(OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk138, 0x3008, 0x3E2, &OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk28);
#endif
            
            OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->state = 0x1B;
            break;
        case 20:                                        
            OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk50 = 4;
            OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk4 = 1;
#ifdef JAPAN
            ShowStringIdInDialogueBox(OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk138, 0x3018, 0x32C7, &OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk28);
#else
            ShowStringIdInDialogueBox(OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk138, 0x3018, 0x3E3, &OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk28);
#endif
            OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->state = 0x1B;
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
        case 17:                                        
        case 18:                                        
        case 21:                                        
        case 22:                                        
        case 23:                                        
        case 24:                                        
        case 27:                                        
        case 28:                                        
            if (IsDialogueBoxActive(OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk138) == 0) {
                ShowDialogueBox(OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk138);
                ov25_0238A694(OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk4);
            }
            break;
    }
    return 0;
}

#ifdef JAPAN
    #define OV25_0238A694_OFFSET 0x2EE4
#else
    #define OV25_0238A694_OFFSET 0
#endif

void ov25_0238A694(s32 state) {
    struct preprocessor_args args;
    struct bulk_item bulkItem;
    struct item item;

    OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->state = state;
    switch (OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->state) {
        case 0:
            OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk4C = 0x96;
            OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk138 = CreateDialogueBox(0);
            ShowStringIdInDialogueBox(OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk138, 0x3008, 0x3D7 + OV25_0238A694_OFFSET, &OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk28);
            OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk139 = CreatePortraitBox(0, 3, 1);
            InitPortraitParamsWithMonsterId(&OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk140, 0xB2);
            SetPortraitLayout(&OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk140, 0);
            SetPortraitEmotion(&OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk140,  OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk20);
            ShowPortraitInPortraitBox(OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk139, &OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk140);
            break;
        case 26:
            OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk13D = CreateTextBox(&APPRAISAL_WINDOW_PARAMS_1, &ov25_0238B414);
            OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk13A = CreateSimpleMenuFromStringIds(&APPRAISAL_WINDOW_PARAMS_5, 0x300013, 0, &APPRAISAL_MAIN_MENU_ITEMS, 4);
            break;
        case 1:
            ov25_0238B380();
            OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk20 = 0;
            SetPortraitEmotion(&OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk140,  OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk20);
            ShowPortraitInPortraitBox(OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk139, &OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk140);
            ShowStringIdInDialogueBox(OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk138, 0x3008, 0x3DD + OV25_0238A694_OFFSET, &OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk28);
            break;
        case 2:
            ov25_0238B380();
            OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk4 = 1;
            OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk20 = 0;
            SetPortraitEmotion(&OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk140,  OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk20);
            ShowPortraitInPortraitBox(OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk139, &OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk140);
#ifdef JAPAN
            ShowStringIdInDialogueBox(OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk138, 0x3018, 0x3018 + 0x2B0, &OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk28);
#else
            ShowStringIdInDialogueBox(OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk138, 0x3018, 0x3E4, &OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk28);
#endif
            break;
        case 3:
            ov25_0238B380();
            OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk4 = 4;
            SetPortraitEmotion(&OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk140,  OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk20);
            ShowPortraitInPortraitBox(OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk139, &OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk140);
            ShowStringIdInDialogueBox(OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk138, 0x3018, 0x3E5 + OV25_0238A694_OFFSET, &OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk28);
            break;
        case 5:
            ov25_0238B380();
            OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk4 = 1;
            OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk20 = 0;
            SetPortraitEmotion(&OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk140,  OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk20);
            ShowPortraitInPortraitBox(OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk139, &OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk140);
#ifdef JAPAN
            ShowStringIdInDialogueBox(OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk138, 0x3018, 0x3018 + 0x2A4, &OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk28);
#else
            ShowStringIdInDialogueBox(OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk138, 0x3018, 0x3D8, &OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk28);
#endif
            break;
        case 6:
            ov25_0238B380();
            OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk4 = 1;
            OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk20 = 0;
            SetPortraitEmotion(&OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk140,  OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk20);
            ShowPortraitInPortraitBox(OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk139, &OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk140);
            ShowStringIdInDialogueBox(OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk138, 0x3018, 0x3D9 + OV25_0238A694_OFFSET, &OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk28);
            break;
        case 7:
            ov25_0238B380();
            OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk4 = 1;
            OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk20 = 0;
            SetPortraitEmotion(&OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk140,  OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk20);
            ShowPortraitInPortraitBox(OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk139, &OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk140);
            ShowStringIdInDialogueBox(OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk138, 0x3018, 0x3D9 + OV25_0238A694_OFFSET, &OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk28);
            break;
        case 8:
            ov25_0238B380();
            OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk4 = 1;
            OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk20 = 0;
            SetPortraitEmotion(&OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk140,  OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk20);
            ShowPortraitInPortraitBox(OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk139, &OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk140);
#ifdef JAPAN
            ShowStringIdInDialogueBox(OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk138, 0x3018, 0x3018 + 0x2AC, &OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk28);
#else
            ShowStringIdInDialogueBox(OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk138, 0x3018, 0x3E0, &OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk28);
#endif
            
            break;
        case 9:
            ov25_0238B380();
            OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk4C = 0x96;
            OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk4 = 1;
            OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk20 = 0;
            SetPortraitEmotion(&OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk140,  OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk20);
            ShowPortraitInPortraitBox(OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk139, &OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk140);
#ifdef JAPAN
            ShowStringIdInDialogueBox(OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk138, 0x3018, 0x3018 + 0x2AC, &OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk28);
#else
            ShowStringIdInDialogueBox(OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk138, 0x3018, 0x3E0, &OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk28);
#endif
            break;
        case 10:
            ov25_0238B380();
            OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk4 = 0xC;
            OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->state = 0x19;
            OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk20 = 0;
            SetPortraitEmotion(&OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk140,  OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk20);
            ShowPortraitInPortraitBox(OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk139, &OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk140);
            break;
        case 11:
            OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk4 = 0xD;
            OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->state = 0x19;
            OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk20 = 0;
            SetPortraitEmotion(&OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk140,  OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk20);
            ShowPortraitInPortraitBox(OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk139, &OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk140);
            ShowStringIdInDialogueBox(OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk138, 0x3008, 0x3DD + OV25_0238A694_OFFSET, &OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk28);
            break;
        case 18:
            OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk4 = 0xD;
            OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->state = 0x1B;
            OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk20 = 0;
            SetPortraitEmotion(&OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk140,  OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk20);
            ShowPortraitInPortraitBox(OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk139, &OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk140);
            ShowStringIdInDialogueBox(OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk138, 0x3018, 0x3DF + OV25_0238A694_OFFSET, &OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk28);
            break;
        case 12:
            ShowDialogueBox(OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk138);
            sub_0202F2C4(OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk138);
            HidePortraitBox(OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk139);
            SwapShopInventoryManager(1, 0);
            break;
        case 13:
            ShowDialogueBox(OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk138);
            sub_0202F2C4(OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk138);
            HidePortraitBox(OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk139);
            SwapShopInventoryManager(1, 0);
            break;
        case 14:
            OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk4C = 0x96;
            OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk13A = CreateSimpleMenuFromStringIds(&APPRAISAL_WINDOW_PARAMS_6, 0x13, 0, &APPRAISAL_SUBMENU_ITEMS, 3);
            break;
        case 15:
            OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk28 = OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unkE;
            OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk38 = OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unkC;
            OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk4C = OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unkE;
            PreprocessString(OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk78, 0x400, (char *)&ov25_0238B5A4, 0xC402, (struct preprocessor_args *)&OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk28);
            InitPreprocessorArgs(&args);
            args.strings[0] = OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk78;

#ifdef EUROPE
            OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk13B = CreateScrollBoxSingle(&APPRAISAL_WINDOW_PARAMS_8, 0x1013, 0, 0x33E, &args, (s32) (u16) (OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unkC + 0x29D3), &OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk28);
#elif defined (JAPAN)
            OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk13B = CreateScrollBoxSingle(&APPRAISAL_WINDOW_PARAMS_8, 0x1013, 0, 0x3203, &args, (s32) (u16) (OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unkC + 0x41CE), &OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk28);
#else
            OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk13B = CreateScrollBoxSingle(&APPRAISAL_WINDOW_PARAMS_8, 0x1013, 0, 0x33E, &args, (s32) (u16) (OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unkC + 0x29D1), &OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk28);
#endif
            
            
            break;
        case 16:
            OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk20 = 0;
            SetPortraitEmotion(&OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk140,  OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk20);
            OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->state = 0x1B;
            OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk4 = 0x1D;
            ShowPortraitInPortraitBox(OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk139, &OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk140);
            OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk3C = OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unkC;
            OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk50 = OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unkE;
#ifdef JAPAN
            ShowStringIdInDialogueBox(OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk138, 0x3008, 0x32C0, &OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk28);
#else
            ShowStringIdInDialogueBox(OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk138, 0x3008, 0x3DC, &OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk28);
#endif
            
            break;
        case 29:
            OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk13D = CreateTextBox(&APPRAISAL_WINDOW_PARAMS_1, &ov25_0238B414);
            OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk13A = CreateSimpleMenuFromStringIds(&APPRAISAL_WINDOW_PARAMS_7, 0x80000013, 0, &APPRAISAL_MENU_ITEMS_CONFIRM, 2);
            break;
        case 19:
            OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk24 = 7;
            break;
        case 20:
            OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk24 = 8;
            break;
        case 21:
            OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk24 = 8;
            OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk4 = 1;
            break;
        case 17:
            AddMoneyCarried(-150);
            item.id = OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unkC;
            item.quantity = OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unkE;
            item.flags = ITEM_FLAG_EXISTS;
            ItemToBulkItem(&bulkItem, &item);
            RemoveItemByIdAndStackNoHole(&bulkItem);
    
            item.id = OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unkE;
            item.quantity = 0;
            if (IsThrownItem(item.id) != 0) {
                item.quantity = 10;
            } else {
                if (item.id == ITEM_TM_USED_TM) {
                    item.id = ITEM_PLAIN_SEED;
                }
                if (( item.id >= ITEM_GORGEOUS_BOX_1) && ( item.id <= ITEM_SINISTER_BOX_3)) {
                    item.id = ITEM_PLAIN_SEED;
                }
                if (item.id == ITEM_POKE) {
                    item.id = ITEM_PLAIN_SEED;
                }
            }
            item.flags = ITEM_FLAG_EXISTS;
            AddItemToBagNoHeld(&item);
            ov11_022DC504();
            OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk4 = 0x13;
            OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk24 = 6;
            MaybeGetColoredFormattedItemName(&OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unkB8, &item, &OVERLAY25_UNKNOWN_STRUCT__NA_238B498);
            OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk60 = (&OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unkB8);
            OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk3C = item.id;
            OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk50 = OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unkE;
            SetPortraitEmotion(&OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk140,  OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk20);
            ShowPortraitInPortraitBox(OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk139, &OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk140);
            ShowStringIdInDialogueBox(OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk138, 0x3018, 0x3E1 + OV25_0238A694_OFFSET, &OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk28);
            break;
    
         default:
            break;
    }
}

s32 ov25_0238B134(void)
{
    OVERLAY25_UNKNOWN_POINTER__NA_238B5E0 = MemAlloc(sizeof(struct overlay_25), 6);
    OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk14 = 0;
    OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk18 = 0;
    OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk1C = 0;
    OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk13D = -2;
    OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk24 = 0;
    InitPreprocessorArgs((struct preprocessor_args *) &OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk28);
    OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk74 = 0xB2;
    OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk28 = 0xB2;
    OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk8 = 0;
    ov11_0230C910();
    OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk20 = 0;
    ov25_0238A694(0);
    return 1;
}

void ov25_0238B1CC(void)
{
    if(OVERLAY25_UNKNOWN_POINTER__NA_238B5E0)
    {
        MemFree(OVERLAY25_UNKNOWN_POINTER__NA_238B5E0);
        OVERLAY25_UNKNOWN_POINTER__NA_238B5E0 = NULL;
    }
}

s32 ov25_0238B1F8(void)
{

    switch (OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk24) {
        default:
        case 5:
            break;
        case 0:
            OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk24 = 4;
            ReturnScriptMenuResultZero();
            break;
        case 1:
            if (ov25_0238A140() == 3) {
                OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk24 = 2;
                sub_0202F2C4(OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk138);
                HidePortraitBox(OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk139);
                sub_0202836C(OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk138);
            }
            break;
        case 6:
            if (IsScriptMenuReturnDisabled()) {
                ReturnScriptMenuResult(1);
                OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk24 = 4;
            }
            break;
        case 7:
            if (IsScriptMenuReturnDisabled()) {
                ReturnScriptMenuResult(2);
                OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk24 = 4;
            }
            break;
        case 8:
            if (IsScriptMenuReturnDisabled()) {
                ReturnScriptMenuResult(3);
                OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk24 = 4;
            }
            break;
        case 2:
            OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk24 = 3;
            CloseDialogueBox(OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk138);
            ClosePortraitBox(OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk139);
            break;
        case 4:
            if (IsScriptMenuReturnDisabled()) {
                OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk24 = 1;
            }
            break;
        case 3:
            ReturnScriptMenuResult(-1);
            return 4;
    }
    return 1;
}

void ov25_0238B380(void) 
{
    if (OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk13A != -2) {
        sub_0202836C(OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk13A);
        CloseSimpleMenu(OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk13A);
        OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk13A = -2;
    }
    if (OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk13D != -2) {
        sub_0202836C(OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk13D);
        CloseTextBox(OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk13D);
        OVERLAY25_UNKNOWN_POINTER__NA_238B5E0->unk13D = -2;
    }
}

void ov25_0238B414(char *output)
{
   
    struct preprocessor_args args;
    char buffer[0x400];

    sub_02027B1C(output);
    args.number_vals[0] = GetMoneyCarried();
    PreprocessString(buffer, 0x100, (char *)&ov25_0238B5B0, 0xC402, &args);
#ifdef JAPAN
    AppendStandardStringToMission(output, 4, 2, 0x42C);
#else
    AppendStandardStringToMission(output, 4, 2, 0x225);
#endif
    DrawTextInWindow(output, 0x10, 0x10, buffer);
    UpdateWindow(output);
}
