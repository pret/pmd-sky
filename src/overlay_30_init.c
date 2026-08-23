#include "overlay_30.h"
#include "dungeon.h"
#include "overlay_29_022E1610.h"

extern struct dungeon *DUNGEON_PTR;

struct Overlay30Main {
    s32 state;
    s32 unk4;
    s32 unk8;
    u8 unkC;
    s8 isGameModeRescue; // GAME_MODE_RESCUE
};

extern struct Overlay30Main* ov30_023860A0;

extern s32 ReadQuickSaveInfo(s32, s32);
extern s32 sub_02034DA8();
extern void sub_02034EB4(s32, s32, s32);
extern void* MemAlloc(u32 len, u32 flags);
extern void MemFree(void *);

#ifdef JAPAN
    #define SAVE_CHECKSUM 0x20111122
#else
    #define SAVE_CHECKSUM 0x21061522
#endif

#define SAVE_VALID 1
#define SAVE_INVALID_CHECKSUM 4

void ov30_02382820(s32 arg0, s32 arg1, s32 isGameModeRescue)
{

    ov30_023860A0 = MemAlloc(sizeof(struct Overlay30Main), 5);
    ov30_023860A0->unk4 = arg0;
    ov30_023860A0->unk8 = arg1;
    ov30_023860A0->unkC = 0;
    ov30_023860A0->isGameModeRescue = isGameModeRescue;
    ov30_023860A0->state = 0;
}

s32 ov30_02382874(void)
{
    s32 saveStatus;

    switch (ov30_023860A0->state) {
        default:
        case 2:
            break;
        case 0:
            saveStatus = ReadQuickSaveInfo(ov30_023860A0->unk4, ov30_023860A0->unk8);
            if ((saveStatus == 0) && (*(u32*)(ov30_023860A0->unk4 + (ov30_023860A0->unk8 - 4)) != SAVE_CHECKSUM)) {
                saveStatus = SAVE_INVALID_CHECKSUM;
            }
            if (saveStatus == 0) {
                ov30_023860A0->unkC = 1;
                ov30_023860A0->state = 3;
            } else if (saveStatus == SAVE_VALID) {
#ifdef JAPAN
                sub_02034EB4(0x40C, 0x4D8, 0);
#else
                sub_02034EB4(0x40C, 0x247, 0);
#endif
                ov30_023860A0->state = 2;
            } else {
#ifdef JAPAN
                sub_02034EB4(0x61C, 0x4DE, 0);
#else
                sub_02034EB4(0x61C, 0x24D, 0);
#endif
                ov30_023860A0->state = 1;
            }
            break;
        case 1:
            if (sub_02034DA8() == 0) {
                ov30_023860A0->state = 3;
            }
            break;
        case 3:
            return 0;
    }
    return 1;
}

u8 ov30_0238298C(void)
{
    return ov30_023860A0->unkC;
}

void ov30_023829A0(void)
{
    if(ov30_023860A0 != NULL)
    {
        MemFree(ov30_023860A0);
        ov30_023860A0 = NULL;
    }
}

struct Overlay30Other
{
    s32 unk0;
    s32 unk4;
    s32 unk8;
    u8 unkC;
    s32 unk10;
};

extern struct Overlay30Other* ov30_023860A4;

// https://decomp.me/scratch/WMpFO
// 98.65% matching - Seth

asm void ov30_023829CC(s32 arg0, s32 arg1, s8 arg2)
{
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r0, #0x14
	mov r1, #5
	mov r4, r2
	bl MemAlloc
	ldr r1, =ov30_023860A4
	ldr r3, =SAVE_CHECKSUM 
	str r0, [r1]
	str r6, [r0, #4]
	ldr r0, [r1]
	mov r2, #0
	str r5, [r0, #8]
	ldr r0, [r1]
	strb r4, [r0, #0xc]
	ldr ip, [r1]
	ldr r0, [ip, #8]
	ldr ip, [ip, #4]
	sub r0, r0, #4
	str r3, [ip, r0]
	ldr r0, [r1]
	str r2, [r0]
	ldmia sp!, {r4, r5, r6, pc}
}

s32 NoteSaveBase(s32);           
s32 WriteQuickSaveInfo(s32, s32);
void sub_02003B94();             
void sub_02003BC8();             
void sub_02029F88(s32, s32, s32);
void sub_02029FBC();             
s32 sub_02048DC4(s32);           
void sub_02034D0C();  

s32 ov30_02382A34(void)
{
    switch (ov30_023860A4->unk0) {                              
        default:                                        
        case 4:                                         
            break;
        case 0:                                         
            if (ov30_023860A4->unkC != 0) {
#ifndef JAPAN
                sub_02034EB4(0x408, 0x241, 0);
#else
                sub_02034EB4(0x408, 0x408 + 0xCA, 0);
#endif
            } else {
#ifndef JAPAN
                sub_02034EB4(0x408, 0x242, 0);
#else
                sub_02034EB4(0x408, 0x408 + 0xCB, 0);
#endif
            }
            ov30_023860A4->unk0 = 1;
            break;
        case 1:                                         
            if (sub_02034DA8() == 0) {
                sub_02029F88(0xE0, 0x88, 1);
                sub_02003B94();
                sub_02048DC4(0xF1209);
                ov30_023860A4->unk10 = WriteQuickSaveInfo(ov30_023860A4->unk4, ov30_023860A4->unk8);
                ov30_023860A4->unk0 = 2;
                return 1;
            }
            break;
        case 2:                                         
            if (ov30_023860A4->unk10 == 0) {
                ov30_023860A4->unk10 = NoteSaveBase(2);
                if (ov30_023860A4->unk10 == 0) {
                    ov30_023860A4->unk10 = sub_02048DC4(0xF1207);
                }
            }
            sub_02003BC8();
            sub_02029FBC();
            switch (ov30_023860A4->unk10) 
            {                   
                case 0:                                    
#ifndef JAPAN
                    sub_02034EB4(0x41C, 0x244, 0);
#else
                    sub_02034EB4(0x41C, 0x41C + 0xB9, 0);
#endif
                    ov30_023860A4->unk0 = 3;
                    break;
                case 1:                                    
#ifndef JAPAN
                    sub_02034EB4(0x40C, 0x238, 0);
#else
                    sub_02034EB4(0x40C, 0x40C + 0xBD, 0);
#endif
                    ov30_023860A4->unk0 = 4;
                    break;
                default:                                   
#ifndef JAPAN
                    sub_02034EB4(0x41C, 0x239, 0);
#else
                    sub_02034EB4(0x41C, 0x41C + 0xAE, 0);
#endif
                    ov30_023860A4->unk0 = 3;
                    break;
            }
            break;
        case 3:                                         
            if (sub_02034DA8() == 0) {
                ov30_023860A4->unk0 = 5;
            }
            break;
        case 5:                                         
            if (ov30_023860A4->unk10 == 0) {
                return 2;
            } else {
                return 3;
            }
    }
    return 0;
}

void ov30_02382C30(void)
{
    if (ov30_023860A4 != NULL) {
        sub_02034D0C();
        MemFree(ov30_023860A4);
        ov30_023860A4 = NULL;
    }
}

extern u8 OVERLAY30_JP_STRING_1[0xC]; // みさき様 
extern u8 OVERLAY30_JP_STRING_2[0xC]; // やよい様 

void ov30_02382D80(void*);            
void ov30_02382E94(void*);            
void ov30_02382FB8(void*);            
void ov30_02383084(void*);            
void ov30_02383C70(void*);            
void ov30_0238409C(void*);            
void ov30_02384208(void*);            
void ov30_02385C3C(void*, void*, s32);  
void ov30_02385C54(void*, void*, s32);
void ov30_02385CDC(void*);            
void ov30_02385CE0(void*, void*);     
void ov30_02385D14(void*, u16);       
void ov30_02385D34(void*, s16);       

void WriteQuicksaveData(void *buffer, s32 size) 
{
    u8 sp4[0xC];
    s32 sp0;
    s32 index;

    ov30_02385C3C(&sp4, buffer, size);
    sp0 = 0;
    ov30_02385C54(&sp4, &sp0, 4);
    ov30_02385CE0(&sp4, OVERLAY30_JP_STRING_1);
    ov30_02385C54(&sp4, &DUNGEON_PTR->id, 0xAC);
    ov30_02385CE0(&sp4, OVERLAY30_JP_STRING_1);
    ov30_02385D34(&sp4, DUNGEON_PTR->highest_enemy_level);
    for(index = 0; index < 0x10; index++)
    {
        ov30_02385D14(&sp4, DUNGEON_PTR->spawn_table_entries_chosen[index]);
       
    }
    ov30_02383C70(&sp4);
    ov30_0238409C(&sp4);
    ov30_02384208(&sp4);
    ov30_02382D80(&sp4);
    ov30_02382E94(&sp4);
    ov30_02382FB8(&sp4);
    ov30_02383084(&sp4);
    ov30_02385CE0(&sp4, OVERLAY30_JP_STRING_2);
    ov30_02385CDC(&sp4);
}

void ov30_02382D80(void *buffer)
{
    u8 zeros[5];
    bool32 valid_item;
    struct item* item;
    struct entity* entity;

    for(int index1 = 0; index1 < 5; index1++)
    {
       zeros[index1] = 0;
    }
    ov30_02385CE0(buffer, OVERLAY30_JP_STRING_1);
    for(int index2 = 0; index2 < 0x40; index2++)
    {
        valid_item = FALSE;
        entity = DUNGEON_PTR->item_ptrs[index2];
        if ((entity != NULL) && (entity->type == ENTITY_ITEM)) {
            item = GetItemInfo(entity);
            ov30_02385C54(buffer, &item->flags, 1);
            ov30_02385C54(buffer, &item->held_by, 1);
            ov30_02385C54(buffer, &item->quantity, 2);
            ov30_02385C54(buffer, &item->id, 2);
            ov30_02385C54(buffer, &entity->pos.x, 1);
            ov30_02385C54(buffer, &entity->pos.y, 1);
            valid_item = TRUE;
        }
        if (valid_item == FALSE) {
            ov30_02385C54(buffer, &zeros, 8);
        }
    }
}
