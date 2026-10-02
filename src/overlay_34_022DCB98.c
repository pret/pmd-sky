#include "overlay_34_022DCB98.h"
#include "debug.h"
#include "main_02001188.h"
#include "main_0200BC54.h"
#include "main_0200BD2C.h"
#include "main_0202A66C.h"
#include "main_0202AAA8.h"
#include "main_0202AB40.h"
#include "main_0202F180.h"

// TODO: types aren't final.. this is just prelimary moving them to src/rodata from asm
const u8 ov34_022DCFF4[] = {0x42, 0x41, 0x43, 0x4B, 0x2F, 0x6E, 0x5F, 0x6C, 0x6F, 0x67, 0x6F, 0x2E, 0x62, 0x67, 0x70, 0x00};

#ifdef NORTH_AMERICA
const u8 ov34_022DD004[] = {0x42, 0x41, 0x43, 0x4B, 0x2F, 0x77, 0x5F, 0x65, 0x73, 0x72, 0x62, 0x2E, 0x62, 0x67, 0x70, 0x00};
#endif


struct Overlay34_22DD084_sub {
    u8 parent_menu_id;
    s8 dialogue_box_id;
    u32 unk4;
};

struct Overlay34_22DD084 {
    struct Overlay34_22DD084_sub *unk0;
    s32 unk4;
};


extern struct Overlay34_22DD084 OVERLAY34_UNKNOWN_POINTER__NA_22DD08C;
extern struct Overlay34_22DD084 OVERLAY34_UNKNOWN_POINTER__NA_22DD084;
extern struct unk_0202A5CC START_MENU_ITEMS_CONFIRM;
extern struct unk_0202A5CC DUNGEON_DEBUG_MENU_ITEMS;
extern u32 OVERLAY34_UNKNOWN_STRUCT__NA_22DD03C;
extern u32 OVERLAY34_UNKNOWN_STRUCT__NA_22DD014;

extern void sub_02008F3C(s32, s32);
extern s8 CreateDialogueBox(s8);   
extern void CloseDialogueBox(s8);
void ov34_022DC718(s32);
s32 InitMenu(u32*);

typedef struct {
    u8 field_0;
    u8 field_01;
    u8 unk_02[2];
    u32 field_04;
    u32 field_08;
    u32 field_C;
} UNK_ov34_022DD0B0;


extern UNK_ov34_022DD0B0 ov34_022DD0B0;
extern struct screen_fade ov34_022DD104;
extern struct screen_fade ov34_022DD0C0;

extern void sub_0200BB74(struct screen_fade *, s32, s32);
extern void sub_0200BB60(struct screen_fade *, s32);

void ov34_022DC9CC(void)
{
    u32 action = ov34_022DD0B0.field_08;

    if (action == 0) goto state_0;
    if (action == 1) goto state_1;
    if (action == 2) goto state_2;
    if (action == 3) goto state_3;
    goto state_end;

state_1:
    sub_0200BB60(&ov34_022DD104, ov34_022DD0B0.field_04);
    goto state_end;

state_2:
    sub_0200BB74(&ov34_022DD104, 1, ov34_022DD0B0.field_04);
    goto state_end;

state_3:
    sub_0200BB74(&ov34_022DD104, 2, ov34_022DD0B0.field_04);

state_end:
    ov34_022DD0B0.field_08 = 0;
    ov34_022DD0B0.field_01 = 1;
    return;

state_0:
    ov34_022DD0B0.field_01 = (ov34_022DD104.status != 0);
    return;
}

void ov34_022DCA70(void)
{
    BOOL isFinished = TRUE;

    if (ov34_022DD0B0.field_0 != 0) {
        if (GetFadeStatus(&ov34_022DD104) == 0) {
            sub_0200BB74(&ov34_022DD104, 1, ov34_022DD0B0.field_C);
            isFinished = FALSE;
        } else if (HandleFadesVeneer(&ov34_022DD104) != 0) {
            isFinished = FALSE;
        }
        ov34_022DCB64(ov34_022DD104.delta_brightness);

        if (GetFadeStatus(&ov34_022DD0C0) == 0) {
            sub_0200BB74(&ov34_022DD0C0, 1, ov34_022DD0B0.field_C);
            isFinished = FALSE;
        } else if (HandleFadesVeneer(&ov34_022DD0C0) != 0) {
            isFinished = FALSE;
        }
        ov34_022DCB98(ov34_022DD0C0.delta_brightness);

        if (isFinished != 0) {
            ov34_022DD0B0.field_0 = FALSE;
        }
    } else {
        HandleFadesVeneer(&ov34_022DD104);
        ov34_022DCB64(ov34_022DD104.delta_brightness);
        
        HandleFadesVeneer(&ov34_022DD0C0);
        ov34_022DCB98(ov34_022DD0C0.delta_brightness);
    }
}

void ov34_022DCB64(s32 arg0)
{
    if (Debug_GetDebugFlag(DEBUG_FLAG_NO_SCREEN_FADE) != 0) {
        sub_02008F3C(0, 0);
        return;
    }
    sub_02008F3C(0, arg0);
}

void ov34_022DCB98(s32 arg0)
{
    if (Debug_GetDebugFlag(DEBUG_FLAG_NO_SCREEN_FADE) != 0) {
        sub_02008F3C(1, 0);
        return;
    }
    sub_02008F3C(1, arg0);
}

void ov34_022DCBCC(void)
{
    if (InitMenu(&OVERLAY34_UNKNOWN_STRUCT__NA_22DD014) != 0) {
        OVERLAY34_UNKNOWN_POINTER__NA_22DD084.unk4 = 0;
    }
}

s32 ov34_022DCBF4(void)
{
    s32 sp0[0x26];

    OVERLAY34_UNKNOWN_POINTER__NA_22DD084.unk0 = MemAlloc(8, 8);
    sp0[0] = 1;
    OVERLAY34_UNKNOWN_POINTER__NA_22DD084.unk0->parent_menu_id = CreateParentMenuFromStringIds(0, 0x31, &sp0, &START_MENU_ITEMS_CONFIRM);
    OVERLAY34_UNKNOWN_POINTER__NA_22DD084.unk0->dialogue_box_id = CreateDialogueBox(0);
#ifdef JAPAN
    ShowStringIdInDialogueBox(OVERLAY34_UNKNOWN_POINTER__NA_22DD084.unk0->dialogue_box_id, 0x408, 0x4E6, 0);
#else
    ShowStringIdInDialogueBox(OVERLAY34_UNKNOWN_POINTER__NA_22DD084.unk0->dialogue_box_id, 0x408, 0x255, 0);
#endif
    OVERLAY34_UNKNOWN_POINTER__NA_22DD084.unk0->unk4 = 0;
    OVERLAY34_UNKNOWN_POINTER__NA_22DD084.unk4 = 0;
    return 1;
}

void ov34_022DCC94(void)
{
    if (OVERLAY34_UNKNOWN_POINTER__NA_22DD084.unk0 == NULL) {
        return;
    }
    CloseParentMenu((s8)OVERLAY34_UNKNOWN_POINTER__NA_22DD084.unk0->parent_menu_id);
    CloseDialogueBox(OVERLAY34_UNKNOWN_POINTER__NA_22DD084.unk0->dialogue_box_id);
    MemFree(OVERLAY34_UNKNOWN_POINTER__NA_22DD084.unk0);
    OVERLAY34_UNKNOWN_POINTER__NA_22DD084.unk0 = NULL;
}

s32 ov34_022DCCE0(void)
{
    s32 var_r0;

    switch (OVERLAY34_UNKNOWN_POINTER__NA_22DD084.unk0->unk4) {
        case 0:
            if (CheckParentMenuField0x1A0((s8)OVERLAY34_UNKNOWN_POINTER__NA_22DD084.unk0->parent_menu_id) == 0) {
                OVERLAY34_UNKNOWN_POINTER__NA_22DD084.unk4 = GetSimpleMenuResult__0202AEA4((s8)OVERLAY34_UNKNOWN_POINTER__NA_22DD084.unk0->parent_menu_id);
                sub_0202F334(OVERLAY34_UNKNOWN_POINTER__NA_22DD084.unk0->dialogue_box_id);
                OVERLAY34_UNKNOWN_POINTER__NA_22DD084.unk0->unk4 = 1;
            }
            break;
        case 1:
            if (IsParentMenuActive((s8)OVERLAY34_UNKNOWN_POINTER__NA_22DD084.unk0->parent_menu_id) == 0) {
                if (IsDialogueBoxActive(OVERLAY34_UNKNOWN_POINTER__NA_22DD084.unk0->dialogue_box_id) == 0) {
                    OVERLAY34_UNKNOWN_POINTER__NA_22DD084.unk0->unk4 = 2;
                }
            }
            break;
        case 2:
            OVERLAY34_UNKNOWN_POINTER__NA_22DD084.unk0->unk4 = 3;

            switch(OVERLAY34_UNKNOWN_POINTER__NA_22DD084.unk4)
            {
                case 2:
                    var_r0 = 2;
                    break;
                default:
                    var_r0 = 1;
                    break;
            }

            if (var_r0 != 0) {
                ov34_022DC718(var_r0);
            }
            return 4;
        default:
            break;
    }
    return 1;
}

void ov34_022DCDCC(void)
{
    if (InitMenu(&OVERLAY34_UNKNOWN_STRUCT__NA_22DD03C) != 0) {
        OVERLAY34_UNKNOWN_POINTER__NA_22DD08C.unk4 = 0;
    }
}

s32 ov34_022DCDF4(void)
{
    s32 sp0[0x26];

    OVERLAY34_UNKNOWN_POINTER__NA_22DD08C.unk0 = MemAlloc(8, 8);
    OVERLAY34_UNKNOWN_POINTER__NA_22DD08C.unk0->parent_menu_id = CreateParentMenuFromStringIds(0, 0x11, &sp0, &DUNGEON_DEBUG_MENU_ITEMS);
    OVERLAY34_UNKNOWN_POINTER__NA_22DD08C.unk0->dialogue_box_id = CreateDialogueBox(0);
#ifdef EUROPE
     ShowStringIdInDialogueBox(OVERLAY34_UNKNOWN_POINTER__NA_22DD08C.unk0->dialogue_box_id, 0x408, 0x3D1E, 0);
#elif defined(JAPAN)
     ShowStringIdInDialogueBox(OVERLAY34_UNKNOWN_POINTER__NA_22DD08C.unk0->dialogue_box_id, 0x408, 0x50E, 0);
#else
     ShowStringIdInDialogueBox(OVERLAY34_UNKNOWN_POINTER__NA_22DD08C.unk0->dialogue_box_id, 0x408, 0x3D1C, 0);
#endif
   
    OVERLAY34_UNKNOWN_POINTER__NA_22DD08C.unk0->unk4 = 0;
    OVERLAY34_UNKNOWN_POINTER__NA_22DD08C.unk4 = 0;
    return 1;
}

void ov34_022DCE8C(void)
{
    if (OVERLAY34_UNKNOWN_POINTER__NA_22DD08C.unk0 == NULL) {
        return;
    }
    CloseParentMenu((s8)OVERLAY34_UNKNOWN_POINTER__NA_22DD08C.unk0->parent_menu_id);
    CloseDialogueBox(OVERLAY34_UNKNOWN_POINTER__NA_22DD08C.unk0->dialogue_box_id);
    MemFree(OVERLAY34_UNKNOWN_POINTER__NA_22DD08C.unk0);
    OVERLAY34_UNKNOWN_POINTER__NA_22DD08C.unk0 = NULL;
}

s32 ov34_022DCED8(void)
{

    switch (OVERLAY34_UNKNOWN_POINTER__NA_22DD08C.unk0->unk4) {                           
        case 0:                                         
            if (CheckParentMenuField0x1A0((s8)OVERLAY34_UNKNOWN_POINTER__NA_22DD08C.unk0->parent_menu_id) == 0) {
                OVERLAY34_UNKNOWN_POINTER__NA_22DD08C.unk4 = GetSimpleMenuResult__0202AEA4((s8)OVERLAY34_UNKNOWN_POINTER__NA_22DD08C.unk0->parent_menu_id);
                sub_0202F334(OVERLAY34_UNKNOWN_POINTER__NA_22DD08C.unk0->dialogue_box_id);
                OVERLAY34_UNKNOWN_POINTER__NA_22DD08C.unk0->unk4 = 1;
            }
            break;
        default:                                        
            break;
        case 1:                                         
            if (IsParentMenuActive((s8)OVERLAY34_UNKNOWN_POINTER__NA_22DD08C.unk0->parent_menu_id) == 0) {
                if (IsDialogueBoxActive(OVERLAY34_UNKNOWN_POINTER__NA_22DD08C.unk0->dialogue_box_id) == 0) {
                    OVERLAY34_UNKNOWN_POINTER__NA_22DD08C.unk0->unk4 = 2;
                }
            }
            break;
        case 2:                                         
            OVERLAY34_UNKNOWN_POINTER__NA_22DD08C.unk0->unk4 = 3;
            s32 var_r0 = 0;
            switch (OVERLAY34_UNKNOWN_POINTER__NA_22DD08C.unk4) { 
                default:                                    
                    break;
                case 2:                                     
                    var_r0 = 3;
                    break;
                case 3:                                     
                    var_r0 = 4;
                    break;
                case 4:                                     
                    var_r0 = 5;
                    break;
                case 5:                                     
                    var_r0 = 6;
                    break;
            }
            if (var_r0 != 0) {
                ov34_022DC718(var_r0);
            }
            return 4;
    }
    return 1;
}
