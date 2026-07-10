#include "overlay_13_EntryOverlay13.h"
#include "overlay_13_0238BDA8.h"
#include "main_02001188.h"

extern void* MemAlloc(u32 len, u32 flags);
void sub_0201F2E4(void);
void InitMenu(const u8 *);
extern void ReturnScriptMenuResult(u32);
void ReturnScriptMenuResultZero(void);
BOOL IsScriptMenuReturnDisabled(void);
void PersonalityTestMainManager(void);

extern struct personality_test *PERSONALITY_TEST_PTR;

extern const u8 OVERLAY13_LOAD_ENTRY[];

void EntryOverlay13(void)
{
    sub_0201F2E4();
    PERSONALITY_TEST_PTR = MemAlloc(sizeof(struct personality_test), 8);
    PERSONALITY_TEST_PTR->outer_state = 0;
    PERSONALITY_TEST_PTR->state = QUIZ_INIT;
    PERSONALITY_TEST_PTR->debug_window_id = 0xFE;
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
    switch(PERSONALITY_TEST_PTR->outer_state)
    {
        case 0:
            ReturnScriptMenuResultZero();
            PERSONALITY_TEST_PTR->outer_state = 0xD;
            break;
        case 1:
            if(IsScriptMenuReturnDisabled())
            {
                ReturnScriptMenuResult(1);
                PERSONALITY_TEST_PTR->outer_state = 0xC;
                PERSONALITY_TEST_PTR->next_outer_state = 0xD;
            }
            break;
        case 2:
             if(IsScriptMenuReturnDisabled())
            {
                ReturnScriptMenuResult(0x19);
                PERSONALITY_TEST_PTR->outer_state = 0xC;
                PERSONALITY_TEST_PTR->next_outer_state = 0xD;
            }
            break;
        case 0xF:
             if(IsScriptMenuReturnDisabled())
            {
                ReturnScriptMenuResult(0x1d);
                PERSONALITY_TEST_PTR->outer_state = 0xC;
                PERSONALITY_TEST_PTR->next_outer_state = 0xD;
            }
            break;
        case 0xE:
             if(IsScriptMenuReturnDisabled())
            {
                ReturnScriptMenuResult(0x1c);
                PERSONALITY_TEST_PTR->outer_state = 0xC;
                PERSONALITY_TEST_PTR->next_outer_state = 0xD;
            }
            break;
        case 0x11:
             if(IsScriptMenuReturnDisabled())
            {
                ReturnScriptMenuResult(0x1f);
                PERSONALITY_TEST_PTR->outer_state = 0xC;
                PERSONALITY_TEST_PTR->next_outer_state = 0xD;
            }
            break;
        case 0x12:
             if(IsScriptMenuReturnDisabled())
            {
                ReturnScriptMenuResult(0x20);
                PERSONALITY_TEST_PTR->outer_state = 0xC;
                PERSONALITY_TEST_PTR->next_outer_state = 0xD;
            }
            break;
        case 3:
             if(IsScriptMenuReturnDisabled())
            {
                ReturnScriptMenuResult(0x18);
                PERSONALITY_TEST_PTR->outer_state = 0xC;
                PERSONALITY_TEST_PTR->next_outer_state = 0xD;
            }
            break;
       case 8:
             if(IsScriptMenuReturnDisabled())
            {
                ReturnScriptMenuResult(0x15);
                PERSONALITY_TEST_PTR->outer_state = 0xC;
                PERSONALITY_TEST_PTR->next_outer_state = 0xD;
            }
        case 9:
             if(IsScriptMenuReturnDisabled())
            {
                ReturnScriptMenuResult(0x16);
                PERSONALITY_TEST_PTR->outer_state = 0xC;
                PERSONALITY_TEST_PTR->next_outer_state = 0xD;
            }
        case 7:
             if(IsScriptMenuReturnDisabled())
            {
                ReturnScriptMenuResult(PERSONALITY_TEST_PTR->aura_color + 0x5);
                PERSONALITY_TEST_PTR->outer_state = 0xC;
                PERSONALITY_TEST_PTR->next_outer_state = 0xD;
            }
            break;
       case 4:
             if(IsScriptMenuReturnDisabled())
            {
                ReturnScriptMenuResult(0x2);
                PERSONALITY_TEST_PTR->outer_state = 0xC;
                PERSONALITY_TEST_PTR->next_outer_state = 0xD;
            }
            break;
        case 0x10:
             if(IsScriptMenuReturnDisabled())
            {
                ReturnScriptMenuResult(0x1e);
                PERSONALITY_TEST_PTR->outer_state = 0xC;
                PERSONALITY_TEST_PTR->next_outer_state = 0xD;
            }
            break;
        case 5:
             if(IsScriptMenuReturnDisabled())
            {
                ReturnScriptMenuResult(0x3);
                PERSONALITY_TEST_PTR->outer_state = 0xC;
                PERSONALITY_TEST_PTR->next_outer_state = 0xD;
            }
        case 6:
             if(IsScriptMenuReturnDisabled())
            {
                ReturnScriptMenuResult(0x4);
                PERSONALITY_TEST_PTR->outer_state = 0xC;
                PERSONALITY_TEST_PTR->next_outer_state = 0xD;
            }
        case 12:
            if(IsScriptMenuReturnDisabled())
            {
                PERSONALITY_TEST_PTR->outer_state = PERSONALITY_TEST_PTR->next_outer_state;
                PERSONALITY_TEST_PTR->next_outer_state = 0xD;
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
