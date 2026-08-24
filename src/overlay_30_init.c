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

extern u8 OVERLAY30_JP_STRING_1[0xC]; // みさき様 
extern u8 OVERLAY30_JP_STRING_2[0xC]; // やよい様

s32 NoteSaveBase(s32);           
s32 WriteQuickSaveInfo(s32, s32);
void sub_02003B94();             
void sub_02003BC8();             
void sub_02029F88(s32, s32, s32);
void sub_02029FBC();             
s32 sub_02048DC4(s32);           
void sub_02034D0C(void);
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
struct trap* GetTrapInfo(struct entity*);
void ov30_023831E8(void *, struct entity*);
void ov30_02385D74(void *, s32);
void ov30_02385DD4(void *, u8);
void ov30_02385D54(void*, u8);                             /* extern */
void memset(void*, s32, s32);                                 /* extern */
void ov30_02384268(void*, void*);                          /* extern */
void ov30_02385D94(void*, s32);                            /* extern */
void ov30_02385DB4(void*, s32);                            /* extern */
void ov30_02385DF8(void*, void*);                          /* extern */
void ov30_02385EB8(void*, void*, s32);                       /* extern */

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

void ov30_02382E94(void *buffer)
{
    u8 zeroes[7];
    bool32 var_r1;
    struct trap* trap;
    struct entity* entity;

    for(int index1 = 0; index1 < 7; index1++)
    {
       zeroes[index1] = -1;
    }
    ov30_02385CE0(buffer, OVERLAY30_JP_STRING_1);
    for(int index2 = 0; index2 < 0x40; index2++)
    {
        entity = DUNGEON_PTR->trap_ptrs[index2];
        var_r1 = FALSE;
        if ((entity != NULL) && (entity->type == ENTITY_TRAP)) {
            trap = GetTrapInfo(entity);
            ov30_02385C54(buffer, &trap->id, 1);
            ov30_02385C54(buffer, &trap->team, 1);
            ov30_02385C54(buffer, &trap->flags, 1);
            ov30_02385C54(buffer, &trap->field_0x3, 1);
            ov30_02385C54(buffer, &entity->is_visible, 1);
            ov30_02385C54(buffer, &entity->pos.x, 1);
            ov30_02385C54(buffer, &entity->pos.y, 1);
            var_r1 = TRUE;
        }
        if (var_r1 == FALSE) {
            ov30_02385C54(buffer, &zeroes, 7);
        }
    }
}

void ov30_02382FB8(void *buffer)
{
    u8 sp1;
    u8 sp0;
    struct entity* entity;

    entity = &DUNGEON_PTR->entities[148];
    ov30_02385CE0(buffer, OVERLAY30_JP_STRING_1);
    if (entity == NULL) {
        return;
    }
    if (entity->type == ENTITY_HIDDEN_STAIRS) {
        sp1 = 1;
        ov30_02385C54(buffer, (void*)&sp1, 1);
        ov30_02385C54(buffer, &entity->is_visible, 1);
        ov30_02385C54(buffer, &entity->pos.x, 1);
        ov30_02385C54(buffer, &entity->pos.y, 1);
    }
    else 
    {
        sp0 = 0;
        ov30_02385C54(buffer, (void*)&sp0, 1);
        ov30_02385C54(buffer, (void*)&sp0, 1);
        ov30_02385C54(buffer, (void*)&sp0, 1);
        ov30_02385C54(buffer, (void*)&sp0, 1);
    }
}

void ov30_02383084(void *buffer)
{
    ov30_02385CE0(buffer, OVERLAY30_JP_STRING_1);
    ov30_02385D74(buffer, DUNGEON_PTR->monster_unique_id_counter);
    ov30_02385D74(buffer, DUNGEON_PTR->monster_unique_wrap_counter);
    ov30_02385DD4(buffer, DUNGEON_PTR->plus_is_active[0]);
    ov30_02385DD4(buffer, DUNGEON_PTR->plus_is_active[1]);
    ov30_02385DD4(buffer, DUNGEON_PTR->minus_is_active[0]);
    ov30_02385DD4(buffer, DUNGEON_PTR->minus_is_active[1]);
    ov30_02385DD4(buffer, DUNGEON_PTR->decoy_is_active);
    ov30_02385DD4(buffer, DUNGEON_PTR->mew_cannot_spawn);
    ov30_02385DD4(buffer, DUNGEON_PTR->shaymin_sky_form_loaded);
    ov30_02385D14(buffer, DUNGEON_PTR->deoxys_floor_id);
    for(int var_r6 = 0; var_r6 < MAX_TEAM_MEMBERS; var_r6++)
    {
        ov30_023831E8(buffer, DUNGEON_PTR->monster_slots.party_members[var_r6]);
    }
    for(int var_r6_2 = 0; var_r6_2 < DUNGEON_MAX_WILD_POKEMON; var_r6_2++)
    {
        ov30_023831E8(buffer, DUNGEON_PTR->monster_slots.wild_pokemon[var_r6_2]);
    }
}

void ov30_023831E8(void *arg0, struct entity* arg1)
{
    struct monster sp1C;
    s32 sp18;
    s32 sp14;
    s32 sp10;
    s16 spC;
    s16 spA;
    s16 sp8;
    u8 sp7;
    u8 sp6;
    u8 sp5;
    u8 sp4;
    u8 sp3;
    u8 sp2;
    u8 sp1;
    u8 sp0;
    struct monster* var_r6;
    s32 var_r5;
    u8 var_r0;
    u8 var_r0_2;

    sp18 = 0;
    sp14 = 1;
    ov30_02385D54(arg0, 0xAA);
    ov30_02385D54(arg0, 0x55);
    if (arg1 == NULL) {
        var_r0 = 0;
    } else {
        if (arg1->type != 0) {
            var_r0_2 = 1;
        } else {
            var_r0_2 = 0;
        }
        var_r0 = var_r0_2;
    }
    if (var_r0 != 0) {
        var_r6 = (struct monster *)arg1->info;
        ov30_02385C54(arg0, &sp14, 1);
        ov30_02385C54(arg0, &arg1->pos.x, 1);
        ov30_02385C54(arg0, &arg1->pos.y, 1);
        ov30_02385C54(arg0, &arg1->is_visible, 1);
        ov30_02385C54(arg0, &arg1->spawn_genid, 2);
    } else {
        memset(&sp1C, 0, sizeof(struct monster));
        var_r6 = &sp1C;
        ov30_02385C54(arg0, &sp18, 1);
        ov30_02385C54(arg0, &sp18, 1);
        ov30_02385C54(arg0, &sp18, 1);
        ov30_02385C54(arg0, &sp18, 1);
        ov30_02385C54(arg0, &sp18, 2);
    }
    ov30_02385D14(arg0, var_r6->flags);
    spC = var_r6->apparent_id;
    ov30_02385C54(arg0, (s32* ) &spC, 2);
    spA = var_r6->id;
    ov30_02385C54(arg0, (s32* ) &spA, 2);
    ov30_02385DD4(arg0, var_r6->is_not_team_member);
    ov30_02385DD4(arg0, var_r6->is_team_leader);
    ov30_02385DD4(arg0, var_r6->is_ally);
    ov30_02385D54(arg0, var_r6->shopkeeper);
    ov30_02385D54(arg0, var_r6->level);
    ov30_02385D54(arg0, (u8) var_r6->team_index);
    ov30_02385D54(arg0, var_r6->joined_at);
    ov30_02385D54(arg0, var_r6->joined_at_floor);
    ov30_02385D34(arg0, var_r6->iq);
    ov30_02385D34(arg0, var_r6->hp);
    ov30_02385D34(arg0, var_r6->max_hp_stat);
    ov30_02385D34(arg0, var_r6->max_hp_boost);
    ov30_02385D34(arg0, var_r6->field_0x14);
    ov30_02385D54(arg0, var_r6->offensive_stats[0]);
    ov30_02385D54(arg0, var_r6->offensive_stats[1]);
    ov30_02385D54(arg0, var_r6->defensive_stats[0]);
    ov30_02385D54(arg0, var_r6->defensive_stats[1]);
    ov30_02385D74(arg0, var_r6->exp);
    ov30_02385D34(arg0, var_r6->stat_modifiers.offensive_stages[0]);
    ov30_02385D34(arg0, var_r6->stat_modifiers.offensive_stages[1]);
    ov30_02385D34(arg0, var_r6->stat_modifiers.defensive_stages[0]);
    ov30_02385D34(arg0, var_r6->stat_modifiers.defensive_stages[1]);
    ov30_02385D34(arg0, var_r6->stat_modifiers.hit_chance_stages[0]);
    ov30_02385D34(arg0, var_r6->stat_modifiers.hit_chance_stages[1]);
    ov30_02385D34(arg0, var_r6->stat_modifiers.flash_fire_boost);
    ov30_02385DB4(arg0, var_r6->stat_modifiers.offensive_multipliers[0]);
    ov30_02385DB4(arg0, var_r6->stat_modifiers.offensive_multipliers[1]);
    ov30_02385DB4(arg0, var_r6->stat_modifiers.defensive_multipliers[0]);
    ov30_02385DB4(arg0, var_r6->stat_modifiers.defensive_multipliers[1]);
    ov30_02385C54(arg0, &var_r6->action.direction, 1);
    ov30_02385C54(arg0, &var_r6->action.item_target_position.x, 1);
    ov30_02385C54(arg0, &var_r6->action.item_target_position.y, 1);
    sp7 = var_r6->types[0];
    ov30_02385C54(arg0, (s32* ) &sp7, 1);
    sp6 = var_r6->types[1];
    ov30_02385C54(arg0, (s32* ) &sp6, 1);
    sp5 = var_r6->abilities[0];
    ov30_02385C54(arg0, (s32* ) &sp5, 1);
    sp4 = var_r6->abilities[1];
    ov30_02385C54(arg0, (s32* ) &sp4, 1);
    ov30_02384268(arg0, &var_r6->held_item);
    sp8 = var_r6->previous_held_item_id;
    ov30_02385C54(arg0, (s32* ) &sp8, 2);

    for(var_r5 = 0; var_r5 < NUM_PREV_POS; var_r5++)
    {
        ov30_02385DF8(arg0, &var_r6->prev_pos[var_r5]);
    }

    ov30_02385C54(arg0, &var_r6->ai_target.ai_objective, 1);
    ov30_02385DD4(arg0, var_r6->ai_target.ai_not_next_to_target);
    ov30_02385DD4(arg0, var_r6->ai_target.ai_targeting_enemy);
    ov30_02385DD4(arg0, var_r6->ai_target.ai_turning_around);
    ov30_02385D14(arg0, var_r6->ai_target.ai_target_spawn_genid);
    ov30_02385DF8(arg0, &var_r6->ai_target.ai_target_pos);
    
    ov30_02385C54(arg0, &var_r6->iq_skill_menu_flags, 0x45);
    ov30_02385C54(arg0, &var_r6->iq_skill_flags, 0x45);
    
    sp3 = var_r6->tactic;
    ov30_02385C54(arg0, (s32* ) &sp3, 1);
    ov30_02385D34(arg0, var_r6->hidden_power_base_power);
    sp2 = var_r6->hidden_power_type;
    ov30_02385C54(arg0, (s32* ) &sp2, 1);
    ov30_02385D74(arg0, var_r6->unique_id);
    ov30_02385D74(arg0, var_r6->wrap_pair_unique_id);
    ov30_02385D74(arg0, var_r6->bide_damage_tally);
    ov30_02385C54(arg0, &var_r6->sleep_class_status.sleep, 1);
    ov30_02385D54(arg0, var_r6->sleep_class_status.sleep_turns);
    ov30_02385C54(arg0, &var_r6->burn_class_status.burn, 1);
    ov30_02385D54(arg0, var_r6->burn_class_status.burn_turns);
    ov30_02385D54(arg0, var_r6->burn_class_status.burn_damage_countdown);
    ov30_02385D54(arg0, var_r6->burn_class_status.badly_poisoned_damage_count);
    ov30_02385C54(arg0, &var_r6->frozen_class_status.freeze, 1);
    ov30_02385D54(arg0, var_r6->frozen_class_status.freeze_turns);
    ov30_02385D54(arg0, var_r6->frozen_class_status.freeze_damage_countdown);
    ov30_02385D74(arg0, var_r6->frozen_class_status.constriction_animation);
    ov30_02385C54(arg0, &var_r6->cringe_class_status.cringe, 1);
    ov30_02385D54(arg0, var_r6->cringe_class_status.cringe_turns);
    ov30_02385C54(arg0, &var_r6->bide_class_status.bide, 1);
    ov30_02385D54(arg0, var_r6->bide_class_status.bide_turns);
    ov30_02385D54(arg0, var_r6->bide_class_status.bide_move_slot);
    ov30_02385C54(arg0, &var_r6->reflect_class_status.reflect, 1);
    ov30_02385D54(arg0, var_r6->reflect_class_status.reflect_turns);
    ov30_02385D54(arg0, var_r6->reflect_class_status.reflect_damage_countdown);

    ov30_02385C54(arg0, &var_r6->curse_class_status.curse, 1);
    ov30_02385DD4(arg0, var_r6->curse_class_status.curse_applier_non_team_member_flag);
    ov30_02385DD4(arg0, var_r6->curse_class_status.dec);
    ov30_02385D54(arg0, var_r6->curse_class_status.curse_turns);
    ov30_02385D54(arg0, var_r6->curse_class_status.curse_damage_countdown);

    ov30_02385C54(arg0, &var_r6->leech_seed_class_status.leech_seed, 1);
    ov30_02385D74(arg0, var_r6->leech_seed_class_status.statuses_applier_id);
    ov30_02385D54(arg0, var_r6->leech_seed_class_status.leech_seed_source_monster_index);
    ov30_02385D54(arg0, var_r6->leech_seed_class_status.leech_seed_turns);
    ov30_02385D54(arg0, var_r6->leech_seed_class_status.leech_seed_damage_countdown);
    
    ov30_02385C54(arg0, &var_r6->sure_shot_class_status.sure_shot, 1);
    ov30_02385D54(arg0, var_r6->sure_shot_class_status.sure_shot_turns);

    ov30_02385C54(arg0, &var_r6->long_toss_class_status.status, 1);


    ov30_02385C54(arg0, &var_r6->invisible_class_status.status, 1);
    ov30_02385D54(arg0, var_r6->invisible_class_status.turns);
    ov30_02385C54(arg0, &var_r6->blinker_class_status.blinded, 1);
    ov30_02385D54(arg0, var_r6->blinker_class_status.blinded_turns);
    ov30_02385C54(arg0, &var_r6->muzzled, 1);
    ov30_02385D54(arg0, var_r6->muzzled_turns);
    ov30_02385C54(arg0, &var_r6->miracle_eye, 1);
    ov30_02385D54(arg0, var_r6->miracle_eye_turns);
    ov30_02385C54(arg0, &var_r6->magnet_rise, 1);
    ov30_02385D54(arg0, var_r6->magnet_rise_turns);
    ov30_02385DD4(arg0, var_r6->power_ears);
    ov30_02385DD4(arg0, var_r6->scanning);
    ov30_02385DD4(arg0, var_r6->stair_spotter);
    ov30_02385DD4(arg0, var_r6->pickup_flag);
#ifndef JAPAN
    ov30_02385DD4(arg0, var_r6->in_action);
#endif
    ov30_02385DD4(arg0, var_r6->grudge);
    ov30_02385D54(arg0, var_r6->exp_yield);
    ov30_02385DD4(arg0, var_r6->exposed);
    ov30_02385DD4(arg0, var_r6->type_changed);
    ov30_02385DD4(arg0, var_r6->boss_flag);
    ov30_02385D54(arg0, var_r6->terrified);
    ov30_02385D54(arg0, var_r6->terrified_turns);
    ov30_02385DD4(arg0, var_r6->use_held_item);
    ov30_02385D54(arg0, var_r6->perish_song_turns);
    ov30_02385D54(arg0, var_r6->no_slip_cap_counter);
    ov30_02385D54(arg0, var_r6->field_0x10a);
    sp1 = var_r6->two_turn_move_invincible;
    ov30_02385C54(arg0, (s32* ) &sp1, 1);
    sp0 = var_r6->decoy_ai_tracker;
    ov30_02385C54(arg0, (s32* ) &sp0, 1);
    sp10 = var_r6->speed_stage;
    ov30_02385C54(arg0, &sp10, 4);
    ov30_02385EB8(arg0, var_r6->speed_up_counters, 5);
    ov30_02385EB8(arg0, var_r6->speed_down_counters, 5);
    ov30_02385D54(arg0, var_r6->stockpile_stage);
    ov30_02385D54(arg0, var_r6->field_0x11f);
    ov30_02385D54(arg0, (u8) var_r6->random_movement);

    // moves
    for(int move_index = 0; move_index < MAX_MON_MOVES; move_index++)
    {
        struct move *move = &var_r6->moves.moves[move_index];
        ov30_02385D54(arg0, var_r6->moves.moves[move_index].flags0);
        ov30_02385D54(arg0, var_r6->moves.moves[move_index].flags2);
        ov30_02385C54(arg0, &move->id, 2);
        ov30_02385D54(arg0, var_r6->moves.moves[move_index].pp);
        ov30_02385D54(arg0, var_r6->moves.moves[move_index].ginseng);
    }
    
    ov30_02385D54(arg0, var_r6->moves.struggle_move_flags);
    ov30_02385D34(arg0, var_r6->belly.integer);
    ov30_02385D34(arg0, var_r6->belly.fractional);
    ov30_02385D34(arg0, var_r6->max_belly.integer);
    ov30_02385D34(arg0, var_r6->max_belly.fractional);
    ov30_02385DD4(arg0, var_r6->ai_ally_skip);
    ov30_02385DD4(arg0, var_r6->ai_next_to_target);
    ov30_02385DD4(arg0, var_r6->waiting);
    ov30_02385DD4(arg0, var_r6->famished);
    ov30_02385DD4(arg0, var_r6->already_acted);
    ov30_02385DD4(arg0, var_r6->should_evolve);
    ov30_02385DD4(arg0, var_r6->using_charged_move);
    ov30_02385DD4(arg0, var_r6->hit_grudge_monster);
    ov30_02385DD4(arg0, var_r6->field_0x156);
    ov30_02385D14(arg0, var_r6->state_flags);
    ov30_02385D14(arg0, var_r6->prev_state_flags);
    ov30_02385DD4(arg0, var_r6->apply_flash_fire_boost);
    ov30_02385D54(arg0, var_r6->rollout_hit_counter);
    ov30_02385DD4(arg0, var_r6->memento_warp_flag);
    ov30_02385DD4(arg0, var_r6->overheat_special_attack_drop_flag);
    ov30_02385DD4(arg0, var_r6->display_shadow);
    ov30_02385D54(arg0, var_r6->sleep_talk_direction);
    ov30_02385D54(arg0, var_r6->snore_direction);
    ov30_02385D54(arg0, var_r6->field_0x179);
    ov30_02385D54(arg0, var_r6->field_0x17a);
    ov30_02385D54(arg0, var_r6->field_0x17b);
    ov30_02385D54(arg0, var_r6->field_0x17c);
    ov30_02385DF8(arg0, &var_r6->target_pos);
    ov30_02385DB4(arg0, var_r6->field_0x188);
    ov30_02385D14(arg0, var_r6->contact_ability_trigger_bitflags);
    ov30_02385D94(arg0, var_r6->exclusive_item_trigger_bitflags);
    ov30_02385D14(arg0, var_r6->field_0x190);
    ov30_02385D34(arg0, var_r6->hp_fractional);
    ov30_02385D34(arg0, var_r6->mobile_turn_timer);
    ov30_02385D74(arg0, var_r6->unk_exp_tracker);
    ov30_02385D54(arg0, var_r6->monster_behavior);
    ov30_02385D54(arg0, var_r6->practice_swinger_flag);
    ov30_02385D54(arg0, var_r6->anger_point_flag);
    ov30_02385D34(arg0, var_r6->field_0x168);
    ov30_02385D34(arg0, var_r6->bide_move_id);
    ov30_02385D54(arg0, var_r6->force_turn);

    for(int var_r4 = 0; var_r4 < 5; var_r4++)
    {
        ov30_02385D54(arg0, var_r6->unk16B[var_r4]);
    }
}

