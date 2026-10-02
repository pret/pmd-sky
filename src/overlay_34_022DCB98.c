#include "overlay_34_022DCB98.h"
#include "debug.h"
#include "main_02001188.h"
#include "main_020027E8.h"
#include "main_0200BC54.h"
#include "main_0200BD2C.h"
#include "main_0201BCCC.h"
#include "main_0202A66C.h"
#include "main_0202AAA8.h"
#include "main_0202AB40.h"
#include "main_0202F180.h"
#include "nitro.h"

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
s32 InitMenu(u32*);


struct Overlay_34_022DD0A0 {
    s32 unk0;
    u32 unk4;
    u32 unk8;
    u32 unkC;
};

extern struct Overlay_34_022DD0A0 ov34_022DD0A0;

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

extern u8 OVERLAY34_UNKNOWN_POINTER__NA_22DD080;

extern void sub_0200BB74(struct screen_fade *, s32, s32);
extern void sub_0200BB60(struct screen_fade *, s32);
extern s32 sub_02008F4C(s32);   
extern void sub_0200B894(struct screen_fade*, s32);  
extern void sub_0200B8D4(struct screen_fade*, s32);  
extern void sub_0200B8B8(struct screen_fade*); 

extern void sub_02028E40(void);
extern u32 Sys_IsMailboxPending(void);
extern void Task_AbortSync(void);
extern void sub_0201DD48(void);
extern void sub_0201F464(void);
extern void sub_02008F84(void);
extern void sub_02017A80(void);
extern u32 Sys_WaitForVBlank(void);
extern void sub_0201DDFC(void);
extern void GraphicsEngine_SetState(u32); 
extern void sub_02008F64(u32, u32);
extern void GraphicsEngine_ApplyState(void);
extern void sub_0201DE10(void);
extern void sub_02028E88(void);
extern void sub_02051C24(void);
extern void sub_02028A64(u32);

u32 ov34_022DC5B0(void)
{
    sub_0201BF64(); 
    sub_02028E40();

    if (Sys_IsMailboxPending()) {
        ov34_022DC9CC();
        Task_AbortSync();
    }

    ov34_022DCA70();
    sub_0201DD48(); 
    sub_0201F464(); 

    if (OVERLAY34_UNKNOWN_POINTER__NA_22DD080 == 0) {
        sub_0201DDFC(); 
    }

    sub_02008F84();
    sub_0201BE28(); 
    sub_02017A80(); 
    
    u32 ret_val = Sys_WaitForVBlank();

    if (OVERLAY34_UNKNOWN_POINTER__NA_22DD080 != 0 && ov34_022DD0A0.unk8 != 1) {
        
        if (ov34_022DD0A0.unk8 == 2) {
            sub_02008F3C(0, 0x100);
            sub_02008F3C(1, 0x100);
            GraphicsEngine_SetState(0);
        } else if (ov34_022DD0A0.unk8 == 3) {
#ifdef NORTH_AMERICA
            sub_02008F3C(0, 0);
#else
            sub_02008F3C(0, 0x100);
#endif
            sub_02008F3C(1, 0);
            GraphicsEngine_SetState(0);
        } else {
#ifdef NORTH_AMERICA
            sub_02008F3C(0, -0x100);
#else
            sub_02008F3C(0, 0);
#endif
            sub_02008F3C(1, -0x100);
            GraphicsEngine_SetState(0);
            sub_02008F64(0, 2);
            sub_02008F64(0, 3);
            sub_02008F64(1, 2);
            sub_02008F64(1, 3);
        }
    }

    GraphicsEngine_ApplyState();
    sub_02028A64(ret_val);
    GroupOamAttributesBothScreens(); 
    sub_0201BE84(); 
    G3X_Reset();
    sub_0201DE10(); 
    sub_02028E88();

    if (ov34_022DD0A0.unk8 != 3) {
        sub_02051C24();
    }

    sub_0201BF4C(); 

    OVERLAY34_UNKNOWN_POINTER__NA_22DD080 = 0;

    return ret_val;
}

bool8 ov34_022DC718(s32 arg0)
{
    if (ov34_022DD0A0.unk0 == 0) {
        ov34_022DD0A0.unk0 = arg0;
        return TRUE;
    }
    return FALSE;
}

bool8 ov34_022DC738(void)
{
    return ov34_022DC718(1);
}

void ov34_022DC748(void)
{
    sub_0200B894(&ov34_022DD104, 1);
    sub_0200B894(&ov34_022DD0C0, 1);
    ov34_022DC798();
    ov34_022DC810();
}

void ov34_022DC778(void)
{
    sub_0200B8B8(&ov34_022DD104);
    sub_0200B8B8(&ov34_022DD0C0);
}

void ov34_022DC798(void) 
{
    ov34_022DD0B0.field_0 = 0;
    ov34_022DD0B0.field_C = 0;
    ov34_022DD0B0.field_08 = 0;
    ov34_022DD0B0.field_01 = 1;
    
    if (sub_02008F4C(0) == 0x100) {
        sub_0200B8D4(&ov34_022DD104, 2);
        return;
    }
    if (sub_02008F4C(0) == -0x100) {
        sub_0200B8D4(&ov34_022DD104, 1);
        return;
    }
    sub_0200B8D4(&ov34_022DD104, 0);
}

void ov34_022DC810(void)
{
    if (sub_02008F4C(1) == 0x100) {
        sub_0200B8D4(&ov34_022DD0C0, 2);
        return;
    }
    if (sub_02008F4C(1) == -0x100) {
        sub_0200B8D4(&ov34_022DD0C0, 1);
        return;
    }
    sub_0200B8D4(&ov34_022DD0C0, 0);
}

void ov34_022DC86C(s32 arg0)
{
    if (sub_02002878(2) == 0) {
        ov34_022DD0B0.field_08 = 1;
        ov34_022DD0B0.field_04 = arg0;
        ov34_022DD0B0.field_01 = 1;
    } else {
        sub_0200BB60(&ov34_022DD104, arg0);
        ov34_022DD0B0.field_01 = 1;
    }
}

void ov34_022DC8B8(s32 arg0)
{
    if (sub_02002878(2) == 0) {
        ov34_022DD0B0.field_08 = 2;
        ov34_022DD0B0.field_04 = arg0;
        ov34_022DD0B0.field_01 = 1;
    } else {
        sub_0200BB74(&ov34_022DD104, 1, arg0);
        ov34_022DD0B0.field_01 = 1;
    }
}

#ifdef NORTH_AMERICA
void ov34_022DC908(s32 arg0) {
    if (sub_02002878(2) == 0) {
        ov34_022DD0B0.field_08 = 3;
        ov34_022DD0B0.field_04 = arg0;
        ov34_022DD0B0.field_01 = 1;
    } else {
        sub_0200BB74(&ov34_022DD104, 2, arg0);
        ov34_022DD0B0.field_01 = 1;
    }
}
#endif // NORTH_AMERICA

void ov34_022DC958(s32 r1)
{
    sub_0200BB60(&ov34_022DD0C0, r1);
}


void ov34_022DC970(s32 r2)
{
    sub_0200BB74(&ov34_022DD0C0, 2, r2);
}

bool8 ov34_022DC98C(void)
{
    if (ov34_022DD0B0.field_0 != 0) {
        return 1;
    }
    return sub_0200BD14(&ov34_022DD104);
}

bool8 ov34_022DC9B8(void)
{
    return sub_0200BD14(&ov34_022DD0C0);
}

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
