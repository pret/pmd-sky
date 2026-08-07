#include "overlay_24.h"
#include "main_02001188.h"
#include "main_020251AC.h"

extern u32 CreateDialogueBox(u32);
extern void CloseSimpleMenu(s32);
extern void sub_0202836C(s32); 
extern void HidePortraitBox(s8);
extern void ClosePortraitBox(s8);
extern void CloseDialogueBox(s8);
extern void ReturnScriptMenuResultZero(void);
extern void sub_0202F2C4(s8);

s8 GetAdventureLogCompleted(s32);
s32 GetEggSpecies();
void GetNameRaw(unsigned char *, s32); 
void GetNameWithGender(unsigned char*, s32, char color_id);
s8 GetUnkGameState0x13a6();   
extern void InitPreprocessorArgs(void* args);
void* MemAlloc(s32, s32);       
s16 ReturnEggExclusiveItem(s32);
void SetUnkGameState0x13a6(s32);
void StrcpyName(const unsigned char*, const unsigned char*);
void sub_02025304_JP(const unsigned char*, const unsigned char*);
void ov24_0238A610(s32);

extern u8* strcpy(u8* dest, const u8* src);

s32 ov24_0238C1D4(void)
{
    OVERLAY24_UNKNOWN_POINTER__NA_238C600 = MemAlloc(sizeof(struct overlay_24), 6);
    OVERLAY24_UNKNOWN_POINTER__NA_238C600->unk1C = 0;
    OVERLAY24_UNKNOWN_POINTER__NA_238C600->unk1F4 = 0;
    OVERLAY24_UNKNOWN_POINTER__NA_238C600->unk28C = -2;
    OVERLAY24_UNKNOWN_POINTER__NA_238C600->unk28D = -2;
    GetNameRaw(OVERLAY24_UNKNOWN_POINTER__NA_238C600->unk52, GetEggSpecies());
#ifdef JAPAN
    sub_02025304_JP(OVERLAY24_UNKNOWN_POINTER__NA_238C600->unk166, OVERLAY24_UNKNOWN_POINTER__NA_238C600->unk52);
#else
    StrcpyName(OVERLAY24_UNKNOWN_POINTER__NA_238C600->unk166, OVERLAY24_UNKNOWN_POINTER__NA_238C600->unk52);
#endif
    strcpy(OVERLAY24_UNKNOWN_POINTER__NA_238C600->unk22, OVERLAY24_UNKNOWN_POINTER__NA_238C600->unk52);
    StrcpySimple(OVERLAY24_UNKNOWN_POINTER__NA_238C600->unk42, OVERLAY24_UNKNOWN_POINTER__NA_238C600->unk166);
    GetNameWithGender(OVERLAY24_UNKNOWN_POINTER__NA_238C600->unk66, GetEggSpecies(), 0x4E);
    InitPreprocessorArgs((void *)&OVERLAY24_UNKNOWN_POINTER__NA_238C600->unk1F8);
    OVERLAY24_UNKNOWN_POINTER__NA_238C600->unk244 = 0x71;
    OVERLAY24_UNKNOWN_POINTER__NA_238C600->unk1F8 = 0x71;
    OVERLAY24_UNKNOWN_POINTER__NA_238C600->unkC = 0;
    OVERLAY24_UNKNOWN_POINTER__NA_238C600->unk2A4 = 0;
    if (GetEggSpecies() == 0) {
        OVERLAY24_UNKNOWN_POINTER__NA_238C600->unk20 = GetAdventureLogCompleted(8);
        OVERLAY24_UNKNOWN_POINTER__NA_238C600->unk21 = 0;
        SetUnkGameState0x13a6(1);
    } else {
        OVERLAY24_UNKNOWN_POINTER__NA_238C600->unk20 = GetUnkGameState0x13a6();
        OVERLAY24_UNKNOWN_POINTER__NA_238C600->unk21 = 1;
        OVERLAY24_UNKNOWN_POINTER__NA_238C600->unk16 = ReturnEggExclusiveItem(GetEggSpecies());
    }
    ov24_0238A610(0);
    return 1;
}


void ov24_0238C340(void)
{
    if(OVERLAY24_UNKNOWN_POINTER__NA_238C600 != NULL)
    {
        MemFree(OVERLAY24_UNKNOWN_POINTER__NA_238C600);
        OVERLAY24_UNKNOWN_POINTER__NA_238C600 = NULL;
    }
}

s32 ov24_0238C36C(void)
{
    switch (OVERLAY24_UNKNOWN_POINTER__NA_238C600->unk1F4)
    {
        case 0:
            OVERLAY24_UNKNOWN_POINTER__NA_238C600->unk1F4 = 1;
            break;
        case 1:
            if (ov24_0238A140() == 3) {
                OVERLAY24_UNKNOWN_POINTER__NA_238C600->unk1F4 = 2;
                if (OVERLAY24_UNKNOWN_POINTER__NA_238C600->unk28C != -2) {
                    sub_0202F2C4(OVERLAY24_UNKNOWN_POINTER__NA_238C600->unk28C);
                    sub_0202836C(OVERLAY24_UNKNOWN_POINTER__NA_238C600->unk28C);
                }
                HidePortraitBox(OVERLAY24_UNKNOWN_POINTER__NA_238C600->unk28D);
            }
            break;
        case 2:
            OVERLAY24_UNKNOWN_POINTER__NA_238C600->unk1F4 = 3;
            if (OVERLAY24_UNKNOWN_POINTER__NA_238C600->unk28C != -2) {
                CloseDialogueBox(OVERLAY24_UNKNOWN_POINTER__NA_238C600->unk28C);
                OVERLAY24_UNKNOWN_POINTER__NA_238C600->unk28C = -2;
            }
            ClosePortraitBox(OVERLAY24_UNKNOWN_POINTER__NA_238C600->unk28D);
            OVERLAY24_UNKNOWN_POINTER__NA_238C600->unk28D = -2;
            break;
        case 3:
            ReturnScriptMenuResultZero();
            return 4;
        default:
            break;       
    }
    return 1;
}

void ov24_0238C47C(void)
{
   if(OVERLAY24_UNKNOWN_POINTER__NA_238C600->unk28F != -2)
   {
       sub_0202836C(OVERLAY24_UNKNOWN_POINTER__NA_238C600->unk28F);
       CloseSimpleMenu(OVERLAY24_UNKNOWN_POINTER__NA_238C600->unk28F);
       OVERLAY24_UNKNOWN_POINTER__NA_238C600->unk28F = -2;
   }
}


void ov24_0238C4CC(void)
{
   if(OVERLAY24_UNKNOWN_POINTER__NA_238C600->unk28C == -2)
   {
        OVERLAY24_UNKNOWN_POINTER__NA_238C600->unk28C = CreateDialogueBox(0);
   }
}
