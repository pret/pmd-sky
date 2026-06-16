#include "overlay_13_EntryOverlay13.h"
#include "main_02001188.h"

extern void* MemAlloc(u32 len, u32 flags);
void sub_0201F2E4(void);
void InitMenu(const u8 *);
extern void ReturnScriptMenuResult(u32);
void ReturnScriptMenuResultZero(void);
BOOL IsScriptMenuReturnDisabled(void);
void PersonalityTestMainManager(void);

struct Overlay13Main
{
    // size: 0x428
    u8 unk0;
    u8 unk1;
    u8 fill2[0x6 - 2];
    s8 unk6;
    u8 unk7[0x20 - 0x7];
    u32 unk20;
    u8 fill24[0x426 - 0x24];
    u16 unk426;
};

extern struct Overlay13Main *PERSONALITY_TEST_PTR;

extern const u8 OVERLAY13_LOAD_ENTRY[];

void EntryOverlay13(void)
{
    sub_0201F2E4();
    PERSONALITY_TEST_PTR = MemAlloc(sizeof(struct Overlay13Main), 8);
    PERSONALITY_TEST_PTR->unk0 = 0;
    PERSONALITY_TEST_PTR->unk20 = 0;
    PERSONALITY_TEST_PTR->unk6 = 0xFE;
    InitMenu(OVERLAY13_LOAD_ENTRY);
}

void ExitOverlay13(void)
{
    if(PERSONALITY_TEST_PTR)
    {
        sub_0201F2E4();
        MemFree(PERSONALITY_TEST_PTR);
        PERSONALITY_TEST_PTR = NULL;
    }
}

u32 PersonalityTestFrameUpdate(void) {
    switch(PERSONALITY_TEST_PTR->unk0)
    {
        case 0:
            ReturnScriptMenuResultZero();
            PERSONALITY_TEST_PTR->unk0 = 0xD;
            break;
        case 1:
            if(IsScriptMenuReturnDisabled())
            {
                ReturnScriptMenuResult(1);
                PERSONALITY_TEST_PTR->unk0 = 0xC;
                PERSONALITY_TEST_PTR->unk1 = 0xD;
            }
            break;
        case 2:
             if(IsScriptMenuReturnDisabled())
            {
                ReturnScriptMenuResult(0x19);
                PERSONALITY_TEST_PTR->unk0 = 0xC;
                PERSONALITY_TEST_PTR->unk1 = 0xD;
            }
            break;
        case 0xF:
             if(IsScriptMenuReturnDisabled())
            {
                ReturnScriptMenuResult(0x1d);
                PERSONALITY_TEST_PTR->unk0 = 0xC;
                PERSONALITY_TEST_PTR->unk1 = 0xD;
            }
            break;
        case 0xE:
             if(IsScriptMenuReturnDisabled())
            {
                ReturnScriptMenuResult(0x1c);
                PERSONALITY_TEST_PTR->unk0 = 0xC;
                PERSONALITY_TEST_PTR->unk1 = 0xD;
            }
            break;
        case 0x11:
             if(IsScriptMenuReturnDisabled())
            {
                ReturnScriptMenuResult(0x1f);
                PERSONALITY_TEST_PTR->unk0 = 0xC;
                PERSONALITY_TEST_PTR->unk1 = 0xD;
            }
            break;
        case 0x12:
             if(IsScriptMenuReturnDisabled())
            {
                ReturnScriptMenuResult(0x20);
                PERSONALITY_TEST_PTR->unk0 = 0xC;
                PERSONALITY_TEST_PTR->unk1 = 0xD;
            }
            break;
        case 3:
             if(IsScriptMenuReturnDisabled())
            {
                ReturnScriptMenuResult(0x18);
                PERSONALITY_TEST_PTR->unk0 = 0xC;
                PERSONALITY_TEST_PTR->unk1 = 0xD;
            }
            break;
       case 8:
             if(IsScriptMenuReturnDisabled())
            {
                ReturnScriptMenuResult(0x15);
                PERSONALITY_TEST_PTR->unk0 = 0xC;
                PERSONALITY_TEST_PTR->unk1 = 0xD;
            }
        case 9:
             if(IsScriptMenuReturnDisabled())
            {
                ReturnScriptMenuResult(0x16);
                PERSONALITY_TEST_PTR->unk0 = 0xC;
                PERSONALITY_TEST_PTR->unk1 = 0xD;
            }
        case 7:
             if(IsScriptMenuReturnDisabled())
            {
                ReturnScriptMenuResult(PERSONALITY_TEST_PTR->unk426 + 0x5);
                PERSONALITY_TEST_PTR->unk0 = 0xC;
                PERSONALITY_TEST_PTR->unk1 = 0xD;
            }
            break;
       case 4:
             if(IsScriptMenuReturnDisabled())
            {
                ReturnScriptMenuResult(0x2);
                PERSONALITY_TEST_PTR->unk0 = 0xC;
                PERSONALITY_TEST_PTR->unk1 = 0xD;
            }
            break;
        case 0x10:
             if(IsScriptMenuReturnDisabled())
            {
                ReturnScriptMenuResult(0x1e);
                PERSONALITY_TEST_PTR->unk0 = 0xC;
                PERSONALITY_TEST_PTR->unk1 = 0xD;
            }
            break;
        case 5:
             if(IsScriptMenuReturnDisabled())
            {
                ReturnScriptMenuResult(0x3);
                PERSONALITY_TEST_PTR->unk0 = 0xC;
                PERSONALITY_TEST_PTR->unk1 = 0xD;
            }
        case 6:
             if(IsScriptMenuReturnDisabled())
            {
                ReturnScriptMenuResult(0x4);
                PERSONALITY_TEST_PTR->unk0 = 0xC;
                PERSONALITY_TEST_PTR->unk1 = 0xD;
            }
        case 12:
            if(IsScriptMenuReturnDisabled())
            {
                PERSONALITY_TEST_PTR->unk0 = PERSONALITY_TEST_PTR->unk1;
                PERSONALITY_TEST_PTR->unk1 = 0xD;
            }
            break;
        case 10:
            break;
        case 11:
            break;
        case 0xD:
            PersonalityTestMainManager();
            break;
        case 0x13:
            ReturnScriptMenuResult(-1);
            return 4;
    }
    return 1;
}
