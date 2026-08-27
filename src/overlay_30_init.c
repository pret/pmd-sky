#include "overlay_30.h"
#include "dungeon.h"
#include "overlay_29_022E1610.h"
#include "overlay_29_02344AF8.h"
#include "dungeon_map_access.h"

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
void ov30_02385C3C(void*, void*, s32);  
void ov30_02385C54(void*, void*, s32);
void ov30_02385CDC(void*);            
void ov30_02385CE0(void*, void*);     
void ov30_02385D14(void*, u16);       
void ov30_02385D34(void*, s16);       
struct trap* GetTrapInfo(struct entity*);
void ov30_02385D74(void *, s32);
void ov30_02385DD4(void *, u8);
void ov30_02385D54(void*, u8);                             /* extern */
void memset(void*, s32, s32);                                 /* extern */
void ov30_02385D94(void*, s32);                            /* extern */
void ov30_02385DB4(void*, s32);                            /* extern */
void ov30_02385DF8(void*, void*);                          /* extern */
void ov30_02385EB8(void*, void*, s32);                       /* extern */
void ov30_02385E20(void *, void *);
void ov30_02385E48(void *, void *);
void ov30_02385E90(void *, void *);

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

void ov30_023831E8(void *buffer, struct entity* entity)
{
    struct monster monster;
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
    struct monster* monster_ptr;
    s32 var_r5;
    bool8 valid_entity;
    bool8 valid_entity_type;

    sp18 = 0;
    sp14 = 1;
    ov30_02385D54(buffer, 0xAA);
    ov30_02385D54(buffer, 0x55);
    if (entity == NULL) {
        valid_entity = FALSE;
    } else {
        if (entity->type != ENTITY_NOTHING) {
            valid_entity_type = TRUE;
        } else {
            valid_entity_type = FALSE;
        }
        valid_entity = valid_entity_type;
    }
    if (valid_entity) {
        monster_ptr = (struct monster *)entity->info;
        ov30_02385C54(buffer, &sp14, 1);
        ov30_02385C54(buffer, &entity->pos.x, 1);
        ov30_02385C54(buffer, &entity->pos.y, 1);
        ov30_02385C54(buffer, &entity->is_visible, 1);
        ov30_02385C54(buffer, &entity->spawn_genid, 2);
    } else {
        memset(&monster, 0, sizeof(struct monster));
        monster_ptr = &monster;
        ov30_02385C54(buffer, &sp18, 1);
        ov30_02385C54(buffer, &sp18, 1);
        ov30_02385C54(buffer, &sp18, 1);
        ov30_02385C54(buffer, &sp18, 1);
        ov30_02385C54(buffer, &sp18, 2);
    }
    ov30_02385D14(buffer, monster_ptr->flags);
    spC = monster_ptr->apparent_id;
    ov30_02385C54(buffer, (s32* ) &spC, 2);
    spA = monster_ptr->id;
    ov30_02385C54(buffer, (s32* ) &spA, 2);
    ov30_02385DD4(buffer, monster_ptr->is_not_team_member);
    ov30_02385DD4(buffer, monster_ptr->is_team_leader);
    ov30_02385DD4(buffer, monster_ptr->is_ally);
    ov30_02385D54(buffer, monster_ptr->shopkeeper);
    ov30_02385D54(buffer, monster_ptr->level);
    ov30_02385D54(buffer, (u8) monster_ptr->team_index);
    ov30_02385D54(buffer, monster_ptr->joined_at);
    ov30_02385D54(buffer, monster_ptr->joined_at_floor);
    ov30_02385D34(buffer, monster_ptr->iq);
    ov30_02385D34(buffer, monster_ptr->hp);
    ov30_02385D34(buffer, monster_ptr->max_hp_stat);
    ov30_02385D34(buffer, monster_ptr->max_hp_boost);
    ov30_02385D34(buffer, monster_ptr->field_0x14);
    ov30_02385D54(buffer, monster_ptr->offensive_stats[0]);
    ov30_02385D54(buffer, monster_ptr->offensive_stats[1]);
    ov30_02385D54(buffer, monster_ptr->defensive_stats[0]);
    ov30_02385D54(buffer, monster_ptr->defensive_stats[1]);
    ov30_02385D74(buffer, monster_ptr->exp);
    ov30_02385D34(buffer, monster_ptr->stat_modifiers.offensive_stages[0]);
    ov30_02385D34(buffer, monster_ptr->stat_modifiers.offensive_stages[1]);
    ov30_02385D34(buffer, monster_ptr->stat_modifiers.defensive_stages[0]);
    ov30_02385D34(buffer, monster_ptr->stat_modifiers.defensive_stages[1]);
    ov30_02385D34(buffer, monster_ptr->stat_modifiers.hit_chance_stages[0]);
    ov30_02385D34(buffer, monster_ptr->stat_modifiers.hit_chance_stages[1]);
    ov30_02385D34(buffer, monster_ptr->stat_modifiers.flash_fire_boost);
    ov30_02385DB4(buffer, monster_ptr->stat_modifiers.offensive_multipliers[0]);
    ov30_02385DB4(buffer, monster_ptr->stat_modifiers.offensive_multipliers[1]);
    ov30_02385DB4(buffer, monster_ptr->stat_modifiers.defensive_multipliers[0]);
    ov30_02385DB4(buffer, monster_ptr->stat_modifiers.defensive_multipliers[1]);
    ov30_02385C54(buffer, &monster_ptr->action.direction, 1);
    ov30_02385C54(buffer, &monster_ptr->action.item_target_position.x, 1);
    ov30_02385C54(buffer, &monster_ptr->action.item_target_position.y, 1);
    sp7 = monster_ptr->types[0];
    ov30_02385C54(buffer, (s32* ) &sp7, 1);
    sp6 = monster_ptr->types[1];
    ov30_02385C54(buffer, (s32* ) &sp6, 1);
    sp5 = monster_ptr->abilities[0];
    ov30_02385C54(buffer, (s32* ) &sp5, 1);
    sp4 = monster_ptr->abilities[1];
    ov30_02385C54(buffer, (s32* ) &sp4, 1);
    ov30_02384268(buffer, &monster_ptr->held_item);
    sp8 = monster_ptr->previous_held_item_id;
    ov30_02385C54(buffer, (s32* ) &sp8, 2);

    for(var_r5 = 0; var_r5 < NUM_PREV_POS; var_r5++)
    {
        ov30_02385DF8(buffer, &monster_ptr->prev_pos[var_r5]);
    }

    ov30_02385C54(buffer, &monster_ptr->ai_target.ai_objective, 1);
    ov30_02385DD4(buffer, monster_ptr->ai_target.ai_not_next_to_target);
    ov30_02385DD4(buffer, monster_ptr->ai_target.ai_targeting_enemy);
    ov30_02385DD4(buffer, monster_ptr->ai_target.ai_turning_around);
    ov30_02385D14(buffer, monster_ptr->ai_target.ai_target_spawn_genid);
    ov30_02385DF8(buffer, &monster_ptr->ai_target.ai_target_pos);
    
    ov30_02385C54(buffer, &monster_ptr->iq_skill_menu_flags, 0x45);
    ov30_02385C54(buffer, &monster_ptr->iq_skill_flags, 0x45);
    
    sp3 = monster_ptr->tactic;
    ov30_02385C54(buffer, (s32* ) &sp3, 1);
    ov30_02385D34(buffer, monster_ptr->hidden_power_base_power);
    sp2 = monster_ptr->hidden_power_type;
    ov30_02385C54(buffer, (s32* ) &sp2, 1);
    ov30_02385D74(buffer, monster_ptr->unique_id);
    ov30_02385D74(buffer, monster_ptr->wrap_pair_unique_id);
    ov30_02385D74(buffer, monster_ptr->bide_damage_tally);
    ov30_02385C54(buffer, &monster_ptr->sleep_class_status.sleep, 1);
    ov30_02385D54(buffer, monster_ptr->sleep_class_status.sleep_turns);
    ov30_02385C54(buffer, &monster_ptr->burn_class_status.burn, 1);
    ov30_02385D54(buffer, monster_ptr->burn_class_status.burn_turns);
    ov30_02385D54(buffer, monster_ptr->burn_class_status.burn_damage_countdown);
    ov30_02385D54(buffer, monster_ptr->burn_class_status.badly_poisoned_damage_count);
    ov30_02385C54(buffer, &monster_ptr->frozen_class_status.freeze, 1);
    ov30_02385D54(buffer, monster_ptr->frozen_class_status.freeze_turns);
    ov30_02385D54(buffer, monster_ptr->frozen_class_status.freeze_damage_countdown);
    ov30_02385D74(buffer, monster_ptr->frozen_class_status.constriction_animation);
    ov30_02385C54(buffer, &monster_ptr->cringe_class_status.cringe, 1);
    ov30_02385D54(buffer, monster_ptr->cringe_class_status.cringe_turns);
    ov30_02385C54(buffer, &monster_ptr->bide_class_status.bide, 1);
    ov30_02385D54(buffer, monster_ptr->bide_class_status.bide_turns);
    ov30_02385D54(buffer, monster_ptr->bide_class_status.bide_move_slot);
    ov30_02385C54(buffer, &monster_ptr->reflect_class_status.reflect, 1);
    ov30_02385D54(buffer, monster_ptr->reflect_class_status.reflect_turns);
    ov30_02385D54(buffer, monster_ptr->reflect_class_status.reflect_damage_countdown);

    ov30_02385C54(buffer, &monster_ptr->curse_class_status.curse, 1);
    ov30_02385DD4(buffer, monster_ptr->curse_class_status.curse_applier_non_team_member_flag);
    ov30_02385DD4(buffer, monster_ptr->curse_class_status.dec);
    ov30_02385D54(buffer, monster_ptr->curse_class_status.curse_turns);
    ov30_02385D54(buffer, monster_ptr->curse_class_status.curse_damage_countdown);

    ov30_02385C54(buffer, &monster_ptr->leech_seed_class_status.leech_seed, 1);
    ov30_02385D74(buffer, monster_ptr->leech_seed_class_status.statuses_applier_id);
    ov30_02385D54(buffer, monster_ptr->leech_seed_class_status.leech_seed_source_monster_index);
    ov30_02385D54(buffer, monster_ptr->leech_seed_class_status.leech_seed_turns);
    ov30_02385D54(buffer, monster_ptr->leech_seed_class_status.leech_seed_damage_countdown);
    
    ov30_02385C54(buffer, &monster_ptr->sure_shot_class_status.sure_shot, 1);
    ov30_02385D54(buffer, monster_ptr->sure_shot_class_status.sure_shot_turns);

    ov30_02385C54(buffer, &monster_ptr->long_toss_class_status.status, 1);


    ov30_02385C54(buffer, &monster_ptr->invisible_class_status.status, 1);
    ov30_02385D54(buffer, monster_ptr->invisible_class_status.turns);
    ov30_02385C54(buffer, &monster_ptr->blinker_class_status.blinded, 1);
    ov30_02385D54(buffer, monster_ptr->blinker_class_status.blinded_turns);
    ov30_02385C54(buffer, &monster_ptr->muzzled, 1);
    ov30_02385D54(buffer, monster_ptr->muzzled_turns);
    ov30_02385C54(buffer, &monster_ptr->miracle_eye, 1);
    ov30_02385D54(buffer, monster_ptr->miracle_eye_turns);
    ov30_02385C54(buffer, &monster_ptr->magnet_rise, 1);
    ov30_02385D54(buffer, monster_ptr->magnet_rise_turns);
    ov30_02385DD4(buffer, monster_ptr->power_ears);
    ov30_02385DD4(buffer, monster_ptr->scanning);
    ov30_02385DD4(buffer, monster_ptr->stair_spotter);
    ov30_02385DD4(buffer, monster_ptr->pickup_flag);
#ifndef JAPAN
    ov30_02385DD4(buffer, monster_ptr->in_action);
#endif
    ov30_02385DD4(buffer, monster_ptr->grudge);
    ov30_02385D54(buffer, monster_ptr->exp_yield);
    ov30_02385DD4(buffer, monster_ptr->exposed);
    ov30_02385DD4(buffer, monster_ptr->type_changed);
    ov30_02385DD4(buffer, monster_ptr->boss_flag);
    ov30_02385D54(buffer, monster_ptr->terrified);
    ov30_02385D54(buffer, monster_ptr->terrified_turns);
    ov30_02385DD4(buffer, monster_ptr->use_held_item);
    ov30_02385D54(buffer, monster_ptr->perish_song_turns);
    ov30_02385D54(buffer, monster_ptr->no_slip_cap_counter);
    ov30_02385D54(buffer, monster_ptr->field_0x10a);
    sp1 = monster_ptr->two_turn_move_invincible;
    ov30_02385C54(buffer, (s32* ) &sp1, 1);
    sp0 = monster_ptr->decoy_ai_tracker;
    ov30_02385C54(buffer, (s32* ) &sp0, 1);
    sp10 = monster_ptr->speed_stage;
    ov30_02385C54(buffer, &sp10, 4);
    ov30_02385EB8(buffer, monster_ptr->speed_up_counters, 5);
    ov30_02385EB8(buffer, monster_ptr->speed_down_counters, 5);
    ov30_02385D54(buffer, monster_ptr->stockpile_stage);
    ov30_02385D54(buffer, monster_ptr->field_0x11f);
    ov30_02385D54(buffer, (u8) monster_ptr->random_movement);

    // moves
    for(int move_index = 0; move_index < MAX_MON_MOVES; move_index++)
    {
        struct move *move = &monster_ptr->moves.moves[move_index];
        ov30_02385D54(buffer, monster_ptr->moves.moves[move_index].flags0);
        ov30_02385D54(buffer, monster_ptr->moves.moves[move_index].flags2);
        ov30_02385C54(buffer, &move->id, 2);
        ov30_02385D54(buffer, monster_ptr->moves.moves[move_index].pp);
        ov30_02385D54(buffer, monster_ptr->moves.moves[move_index].ginseng);
    }
    
    ov30_02385D54(buffer, monster_ptr->moves.struggle_move_flags);
    ov30_02385D34(buffer, monster_ptr->belly.integer);
    ov30_02385D34(buffer, monster_ptr->belly.fractional);
    ov30_02385D34(buffer, monster_ptr->max_belly.integer);
    ov30_02385D34(buffer, monster_ptr->max_belly.fractional);
    ov30_02385DD4(buffer, monster_ptr->ai_ally_skip);
    ov30_02385DD4(buffer, monster_ptr->ai_next_to_target);
    ov30_02385DD4(buffer, monster_ptr->waiting);
    ov30_02385DD4(buffer, monster_ptr->famished);
    ov30_02385DD4(buffer, monster_ptr->already_acted);
    ov30_02385DD4(buffer, monster_ptr->should_evolve);
    ov30_02385DD4(buffer, monster_ptr->using_charged_move);
    ov30_02385DD4(buffer, monster_ptr->hit_grudge_monster);
    ov30_02385DD4(buffer, monster_ptr->field_0x156);
    ov30_02385D14(buffer, monster_ptr->state_flags);
    ov30_02385D14(buffer, monster_ptr->prev_state_flags);
    ov30_02385DD4(buffer, monster_ptr->apply_flash_fire_boost);
    ov30_02385D54(buffer, monster_ptr->rollout_hit_counter);
    ov30_02385DD4(buffer, monster_ptr->memento_warp_flag);
    ov30_02385DD4(buffer, monster_ptr->overheat_special_attack_drop_flag);
    ov30_02385DD4(buffer, monster_ptr->display_shadow);
    ov30_02385D54(buffer, monster_ptr->sleep_talk_direction);
    ov30_02385D54(buffer, monster_ptr->snore_direction);
    ov30_02385D54(buffer, monster_ptr->field_0x179);
    ov30_02385D54(buffer, monster_ptr->field_0x17a);
    ov30_02385D54(buffer, monster_ptr->field_0x17b);
    ov30_02385D54(buffer, monster_ptr->field_0x17c);
    ov30_02385DF8(buffer, &monster_ptr->target_pos);
    ov30_02385DB4(buffer, monster_ptr->field_0x188);
    ov30_02385D14(buffer, monster_ptr->contact_ability_trigger_bitflags);
    ov30_02385D94(buffer, monster_ptr->exclusive_item_trigger_bitflags);
    ov30_02385D14(buffer, monster_ptr->field_0x190);
    ov30_02385D34(buffer, monster_ptr->hp_fractional);
    ov30_02385D34(buffer, monster_ptr->mobile_turn_timer);
    ov30_02385D74(buffer, monster_ptr->unk_exp_tracker);
    ov30_02385D54(buffer, monster_ptr->monster_behavior);
    ov30_02385D54(buffer, monster_ptr->practice_swinger_flag);
    ov30_02385D54(buffer, monster_ptr->anger_point_flag);
    ov30_02385D34(buffer, monster_ptr->field_0x168);
    ov30_02385D34(buffer, monster_ptr->bide_move_id);
    ov30_02385D54(buffer, monster_ptr->force_turn);

    for(int var_r4 = 0; var_r4 < 5; var_r4++)
    {
        ov30_02385D54(buffer, monster_ptr->unk16B[var_r4]);
    }
}

void ov30_02383C70(void *buffer)
{
    struct position pos;
    struct weather* weather;
    void* gravity;

    int tile_index_x;
    int tile_index_y;

    ov30_02385CE0(buffer, OVERLAY30_JP_STRING_1);
    ov30_02385DD4(buffer, DUNGEON_PTR->gen_info.force_create_monster_house);
    ov30_02385DD4(buffer, DUNGEON_PTR->gen_info.locked_door_opened);
    ov30_02385DD4(buffer, DUNGEON_PTR->gen_info.kecleon_shop_spawned);
    ov30_02385DD4(buffer, DUNGEON_PTR->gen_info.unk_one_room_flag);
    ov30_02385DD4(buffer, DUNGEON_PTR->gen_info.dough_seed_extra_poke_flag);
    ov30_02385D54(buffer, DUNGEON_PTR->gen_info.monster_house_room);
    ov30_02385D54(buffer, DUNGEON_PTR->gen_info.unk_fixed_room_static_monster_tracker);
    ov30_02385D54(buffer, DUNGEON_PTR->gen_info.hidden_stairs_type);
    ov30_02385D54(buffer, DUNGEON_PTR->gen_info.hidden_floor_type);
    ov30_02385D34(buffer, DUNGEON_PTR->gen_info.tileset_id);
    ov30_02385D34(buffer, DUNGEON_PTR->gen_info.music_table_idx);
    ov30_02385D34(buffer, DUNGEON_PTR->gen_info.staircase_visual_idx);
    ov30_02385D34(buffer, DUNGEON_PTR->gen_info.fixed_room_id);
    ov30_02385D34(buffer, DUNGEON_PTR->gen_info.floor_generation_attempts);

    for(tile_index_y = 0; tile_index_y < DUNGEON_MAX_SIZE_Y; tile_index_y++)
    {
        for(tile_index_x = 0; tile_index_x < DUNGEON_MAX_SIZE_X; tile_index_x++)
        {
            ov30_023842B0(buffer, &DUNGEON_PTR->gen_info.tiles[tile_index_y][tile_index_x]);
        }
    }
    
    ov30_02385DF8(buffer, &DUNGEON_PTR->gen_info.team_spawn_pos);
    ov30_02385DF8(buffer, &DUNGEON_PTR->gen_info.stairs_pos);
    
    pos = DUNGEON_PTR->gen_info.hidden_stairs_pos;
    if (pos.x == -1) {
        pos.x = 0xFF;
    }
    if (pos.y == -1) {
        pos.y = 0xFF;
    }
    ov30_02385DF8(buffer, &pos);
    
    for(int var_r5 = 0; var_r5 < 8; var_r5++)
    {
        ov30_02385E20(buffer, &DUNGEON_PTR->gen_info.individual_team_spawn_positions[var_r5]);
    }
    
    for(int var_r5_2 = 0; var_r5_2 < 8; var_r5_2++)
    {
        ov30_02385D54(buffer, DUNGEON_PTR->unk_team_direction_array[var_r5_2]);
    }
    
    ov30_02385E48(buffer, &DUNGEON_PTR->kecleon_shop_min_x);
    ov30_02385E48(buffer, &DUNGEON_PTR->fixed_room_min_x);
    ov30_02385E90(buffer, &DUNGEON_PTR->fixed_room_width);

    for(tile_index_y = 0; tile_index_y < 8; tile_index_y++)
    {
        for(tile_index_x = 0; tile_index_x < 8; tile_index_x++)
        {
            ov30_023842B0(buffer, &DUNGEON_PTR->fixed_room_tiles[tile_index_y][tile_index_x]);
            ov30_02385D34(buffer, DUNGEON_PTR->field_0xd260[tile_index_y][tile_index_x]);
        }
    }
    
    weather = &DUNGEON_PTR->weather;
    ov30_02385C54(buffer, &weather->weather, 1);
    ov30_02385C54(buffer, &weather->natural_weather, 1);
    
    for(int weather_index = 0; weather_index < 8; weather_index++)
    {
        ov30_02385D14(buffer, (weather->weather_turns[weather_index]));
        ov30_02385D14(buffer, (weather->artificial_permaweather_turns[weather_index]));
    }
    
    ov30_02385D54(buffer, weather->weather_damage_counter);
    ov30_02385D54(buffer, weather->mud_sport_turns);
    ov30_02385D54(buffer, weather->water_sport_turns);
    ov30_02385DD4(buffer, weather->nullify_weather);
    
    gravity = &DUNGEON_PTR->gravity;
    ov30_02385C54(buffer, gravity, 1);
    ov30_02385C54(buffer, gravity + 1, 1);
    
    ov30_02385D34(buffer, DUNGEON_PTR->victory_counter);
}

void ov30_0238409C(void *buffer)
{
    ov30_02385CE0(buffer, OVERLAY30_JP_STRING_1);
    ov30_02385D54(buffer, DUNGEON_PTR->display_data.field_0x20);
    ov30_02385D54(buffer, DUNGEON_PTR->display_data.visibility_range);
    ov30_02385DD4(buffer, DUNGEON_PTR->display_data.blinded);
    ov30_02385DD4(buffer, DUNGEON_PTR->display_data.luminous);
    ov30_02385DD4(buffer, DUNGEON_PTR->display_data.natural_lighting);
    ov30_02385DD4(buffer, DUNGEON_PTR->display_data.can_see_enemies);
    ov30_02385DD4(buffer, DUNGEON_PTR->display_data.field_0x33);
    ov30_02385DD4(buffer, DUNGEON_PTR->display_data.can_see_items);
    ov30_02385DD4(buffer, DUNGEON_PTR->display_data.field_0x32);
    ov30_02385DD4(buffer, DUNGEON_PTR->display_data.field_0x34);
    ov30_02385DD4(buffer, DUNGEON_PTR->display_data.can_see_traps);
    ov30_02385DD4(buffer, DUNGEON_PTR->display_data.hallucinating);
    ov30_02385DD4(buffer, DUNGEON_PTR->display_data.can_see_stairs);
    ov30_02385DD4(buffer, DUNGEON_PTR->display_data.field_0x2C);
}

void ov30_02384208(void *buffer)
{
    ov30_02385D34(buffer, DUNGEON_PTR->field_0x2cb02);
    ov30_02385D34(buffer, DUNGEON_PTR->field_0x2cb04);
    ov30_02385D34(buffer, DUNGEON_PTR->dungeon_music_playing_id);
}

void ov30_02384268(void *buffer, struct item *item)
{
    ov30_02385C54(buffer, &item->flags, 1);
    ov30_02385C54(buffer, &item->held_by, 1);
    ov30_02385C54(buffer, &item->quantity, 2);
    ov30_02385C54(buffer, &item->id, 2);
}

void ov30_023842B0(void *buffer, struct tile* tile)
{
    ov30_02385D14(buffer, tile->terrain_flags);
    ov30_02385D14(buffer, tile->spawn_or_visibility_flags.spawn);
    ov30_02385C54(buffer, &tile->room, 1);
    ov30_02385C54(buffer, &tile->field_0x6, 1);
}

#ifndef EUROPE
void ov29_022FB920();
#else
void ov29_022FB920(s32);
#endif

void ov30_02384C6C(void*);
void ov30_02384CD4(void*);
void ov30_02385C8C(void*, void *, s32);
void ov30_02385CA4(void*, void*, s32);
void ov30_02385CF0(void*, u8*);
s16 ov30_02385EC4(void*);
s16 ov30_02385EDC(void*);
void SpawnItem(void*, struct item*, s32);
void MemZero(void*, s32);
s8 ov30_02385EF4(void *);                                /* extern */
s8 ov30_02385F54(void *);                                /* extern */
void ov30_02385F7C(void *, struct position*);
void ov30_02385FB0(void *, void*);                          /* extern */
void ov30_02385FE4(void *, void*);                          /* extern */
void ov30_02386040(void *, void*);                          /* extern */
void BindTrapToTile(struct tile*, struct trap*, s32);
struct trap *SpawnTrap(u8, struct position*, u8, s32);
void ov29_02338768(struct position*);
s32 ov30_02385F0C(void *);
void ov30_02384E28(void *, s32, s32);

void ov30_023842F4(void *buffer, s32 arg1)
{
    u8 sp4[0xA];
    u32 sp0;

    ov30_02385C8C(&sp4, buffer, arg1);
    ov30_02385CA4(&sp4, &sp0, 4);
    ov30_02385CF0(&sp4, OVERLAY30_JP_STRING_1);
    ov30_02385CA4(&sp4, &DUNGEON_PTR->id, 0xAC);
    ov30_02385CF0(&sp4, OVERLAY30_JP_STRING_1);

    DUNGEON_PTR->highest_enemy_level = ov30_02385EDC(&sp4);

    for(int var_r4 = 0; var_r4 < 0x10; var_r4++)
    {
        DUNGEON_PTR->spawn_table_entries_chosen[var_r4] = ov30_02385EC4(&sp4);
    }

    ov30_02384400(&sp4);
    ov30_023848A0(&sp4);
    ov30_02384A20(&sp4);
    ov30_02384A94(&sp4);
    ov30_02384B84(&sp4);
    ov30_02384C6C(&sp4);
    ov30_02384CD4(&sp4);
    ov30_02385CF0(&sp4, OVERLAY30_JP_STRING_2);
    ov30_02385CDC(&sp4);
#ifdef EUROPE
    ov29_022FB920(0);
#else
    ov29_022FB920();
#endif
}

void ov30_02384400(void *buffer) {
   
    struct weather* weather;
    void* temp_r4_2;
    s32 tile_index_y;
    s32 tile_index_x;

    ov30_02385CF0(buffer, OVERLAY30_JP_STRING_1);
    DUNGEON_PTR->gen_info.force_create_monster_house = ov30_02385F54(buffer);
    DUNGEON_PTR->gen_info.locked_door_opened = ov30_02385F54(buffer);
    DUNGEON_PTR->gen_info.kecleon_shop_spawned = ov30_02385F54(buffer);
    DUNGEON_PTR->gen_info.unk_one_room_flag = ov30_02385F54(buffer);
    DUNGEON_PTR->gen_info.dough_seed_extra_poke_flag = ov30_02385F54(buffer);
    DUNGEON_PTR->gen_info.monster_house_room = ov30_02385EF4(buffer);
    DUNGEON_PTR->gen_info.unk_fixed_room_static_monster_tracker = ov30_02385EF4(buffer);
    DUNGEON_PTR->gen_info.hidden_stairs_type = (enum hidden_stairs_type) ov30_02385EF4(buffer);
    DUNGEON_PTR->gen_info.hidden_floor_type = (enum hidden_stairs_type) ov30_02385EF4(buffer);
    
    DUNGEON_PTR->gen_info.tileset_id = ov30_02385EDC(buffer);
    DUNGEON_PTR->gen_info.music_table_idx = ov30_02385EDC(buffer);
    DUNGEON_PTR->gen_info.staircase_visual_idx = ov30_02385EDC(buffer);
    DUNGEON_PTR->gen_info.fixed_room_id = (enum fixed_room_id) ov30_02385EDC(buffer);
    DUNGEON_PTR->gen_info.floor_generation_attempts = ov30_02385EDC(buffer);

    for(tile_index_x = 0; tile_index_x < DUNGEON_MAX_SIZE_Y; tile_index_x++)
    {
        for(tile_index_y = 0; tile_index_y < DUNGEON_MAX_SIZE_X; tile_index_y++)
        {
            ov30_0238483C(buffer, &DUNGEON_PTR->gen_info.tiles[tile_index_x][tile_index_y]);
        }
    }
    
    ov30_02385F7C(buffer, &DUNGEON_PTR->gen_info.team_spawn_pos);
    ov30_02385F7C(buffer, &DUNGEON_PTR->gen_info.stairs_pos);
    ov30_02385F7C(buffer, &DUNGEON_PTR->gen_info.hidden_stairs_pos);
    

    if (DUNGEON_PTR->gen_info.hidden_stairs_pos.x == 0xFF) {
        DUNGEON_PTR->gen_info.hidden_stairs_pos.x = -1;
    }
    if (DUNGEON_PTR->gen_info.hidden_stairs_pos.y == 0xFF) {
        DUNGEON_PTR->gen_info.hidden_stairs_pos.y = -1;
    }

    for(int var_r5_2 = 0; var_r5_2 < 8; var_r5_2++)
    {
        ov30_02385FB0(buffer, &DUNGEON_PTR->gen_info.individual_team_spawn_positions[var_r5_2]);
    }

    for(int var_r5_2 = 0; var_r5_2 < 8; var_r5_2++)
    {
        DUNGEON_PTR->unk_team_direction_array[var_r5_2] = (enum direction_id) ov30_02385EF4(buffer);
    }
    
    ov30_02385FE4(buffer, &DUNGEON_PTR->kecleon_shop_min_x);
    ov30_02385FE4(buffer, &DUNGEON_PTR->fixed_room_min_x);
    ov30_02386040(buffer, &DUNGEON_PTR->fixed_room_width);
    


    for(tile_index_x = 0; tile_index_x < 8; tile_index_x++)
    {
        for(tile_index_y = 0; tile_index_y < 8; tile_index_y++)
        {
            ov30_0238483C(buffer, &DUNGEON_PTR->fixed_room_tiles[tile_index_x][tile_index_y]);
            DUNGEON_PTR->field_0xd260[tile_index_x][tile_index_y] = ov30_02385EDC(buffer);
        }
    }

    
    // weather
    weather = &DUNGEON_PTR->weather;
    memset(weather, 0, sizeof(struct weather));
    ov30_02385CA4(buffer, &weather->weather, 1);
    ov30_02385CA4(buffer, &weather->natural_weather, 1);


    for(int weather_index = 0; weather_index < 8; weather_index++)
    {
        weather->weather_turns[weather_index] = ov30_02385EC4(buffer);
        weather->artificial_permaweather_turns[weather_index] = ov30_02385EC4(buffer);
    }
    
    weather->weather_damage_counter = ov30_02385EF4(buffer);
    weather->mud_sport_turns = ov30_02385EF4(buffer);
    weather->water_sport_turns = ov30_02385EF4(buffer);
    weather->nullify_weather = ov30_02385F54(buffer);
    
    temp_r4_2 = &DUNGEON_PTR->gravity;
    MemZero(temp_r4_2, 2);
    ov30_02385CA4(buffer, temp_r4_2, 1);
    ov30_02385CA4(buffer, temp_r4_2 + 1, 1);
    DUNGEON_PTR->victory_counter = ov30_02385EDC(buffer);
}

void ov30_0238483C(void *buffer, struct tile* tile)
{
    memset(tile, 0, sizeof(struct tile));
    tile->terrain_flags = ov30_02385EC4(buffer);
    tile->spawn_or_visibility_flags.spawn = ov30_02385EC4(buffer);
    ov30_02385CA4(buffer, &tile->room, 1);
    ov30_02385CA4(buffer, &tile->field_0x6, 1);
    tile->monster = NULL;
    tile->object = NULL;
}


void ov30_023848A0(void *buffer)
{
    ov30_02385CF0(buffer, OVERLAY30_JP_STRING_1);

    DUNGEON_PTR->display_data.camera_target = NULL;
    DUNGEON_PTR->display_data.field_0x20 = ov30_02385EF4(buffer);
    DUNGEON_PTR->display_data.visibility_range = ov30_02385EF4(buffer);
    DUNGEON_PTR->display_data.blinded = ov30_02385F54(buffer);
    DUNGEON_PTR->display_data.luminous = ov30_02385F54(buffer);
    DUNGEON_PTR->display_data.natural_lighting = ov30_02385F54(buffer);
    DUNGEON_PTR->display_data.can_see_enemies = ov30_02385F54(buffer);
    DUNGEON_PTR->display_data.field_0x33 = ov30_02385F54(buffer);
    DUNGEON_PTR->display_data.can_see_items = ov30_02385F54(buffer);
    DUNGEON_PTR->display_data.field_0x32 = ov30_02385F54(buffer);
    DUNGEON_PTR->display_data.field_0x34 = ov30_02385F54(buffer);
    DUNGEON_PTR->display_data.can_see_traps = ov30_02385F54(buffer);
    DUNGEON_PTR->display_data.hallucinating = ov30_02385F54(buffer);
    DUNGEON_PTR->display_data.can_see_stairs = ov30_02385F54(buffer);
    DUNGEON_PTR->display_data.field_0x2C = ov30_02385F54(buffer);
}

void ov30_02384A20(void *buffer)
{
    DUNGEON_PTR->field_0x2cb02 = ov30_02385EDC(buffer);
    DUNGEON_PTR->field_0x2cb04 = ov30_02385EDC(buffer);
    DUNGEON_PTR->dungeon_music_playing_id = (enum music_id) ov30_02385EDC(buffer);
    DUNGEON_PTR->field_0x2cb04 = 0x3E7;
}

void ov30_02384A94(void *buffer)
{
    struct item item;
    struct position sp0;
    bool32 var_r0;

    ov29_02344B1C();
    ov30_02385CF0(buffer, OVERLAY30_JP_STRING_1);
    for(int var_r6 = 0; var_r6 < 0x40; var_r6++)
    {
        ov30_02384B24(buffer, &item);
        ov30_02385F7C(buffer, &sp0);
        var_r0 = (item.flags & ITEM_FLAG_EXISTS) ? TRUE : FALSE;
        if (var_r0 & 0xFF) {
            SpawnItem(&sp0, &item, 0);
        }
    }
    ov29_02344B30();
}

void ov30_02384B24(void *buffer, struct item *item)
{
    memset(item, 0, sizeof(struct item));
    ov30_02385CA4(buffer, &item->flags, 1);
    ov30_02385CA4(buffer, &item->held_by, 1);
    ov30_02385CA4(buffer, &item->quantity, 2);
    ov30_02385CA4(buffer, &item->id, 2);
}

void ov30_02384B84(void *buffer)
{
    struct position pos;
    u8 sp3;
    u8 sp2;
    u8 sp1;
    u8 sp0;
    struct trap* trap;
    struct tile* tile;
    s32 temp_r5;

    ov30_02385CF0(buffer, OVERLAY30_JP_STRING_1);
    for(int trap_index = 0; trap_index < 0x40; trap_index++)
    {
        sp3 = 6;
        sp2 = 0;
        sp1 = 0;
        ov30_02385CA4(buffer, &sp3, 1);
        ov30_02385CA4(buffer, &sp2, 1);
        ov30_02385CA4(buffer, &sp1, 1);
        ov30_02385CA4(buffer, &sp0, 1);
        temp_r5 = ov30_02385F54(buffer);
        ov30_02385F7C(buffer, &pos);
        if (sp3 != 0xFF) {
            tile = GetTileSafe(pos.x, pos.y);
            trap = SpawnTrap(sp3, &pos, sp2, 0);
            if (trap != 0) {
                BindTrapToTile(tile, trap, temp_r5);
            }
        }
    }
}

void ov30_02384C6C(void *buffer)
{
    struct position sp0;
    s8 temp_r4;
    s8 temp_r5;

    ov30_02385CF0(buffer, OVERLAY30_JP_STRING_1);
    temp_r5 = ov30_02385F54(buffer);
    temp_r4 = ov30_02385F54(buffer);
    ov30_02385F7C(buffer, &sp0);
    if (temp_r5 != 0) {
        ov29_02338768(&sp0);
        DUNGEON_PTR->entities[148].is_visible = temp_r4;
    }
}

void ov30_02384CD4(void *buffer) 
{
    ov30_02385CF0(buffer, OVERLAY30_JP_STRING_1);
    DUNGEON_PTR->monster_unique_id_counter = ov30_02385F0C(buffer);
    DUNGEON_PTR->monster_unique_wrap_counter = ov30_02385F0C(buffer);
    DUNGEON_PTR->plus_is_active[0] = ov30_02385F54(buffer);
    DUNGEON_PTR->plus_is_active[1] = ov30_02385F54(buffer);
    DUNGEON_PTR->minus_is_active[0] = ov30_02385F54(buffer);
    DUNGEON_PTR->minus_is_active[1] = ov30_02385F54(buffer);
    DUNGEON_PTR->decoy_is_active = ov30_02385F54(buffer);
    DUNGEON_PTR->mew_cannot_spawn = ov30_02385F54(buffer);
    DUNGEON_PTR->shaymin_sky_form_loaded = ov30_02385F54(buffer);
    DUNGEON_PTR->deoxys_floor_id = (enum monster_id) ov30_02385EC4(buffer);    
    
    for(int var_r6 = 0; var_r6 < MAX_TEAM_MEMBERS; var_r6++)
    {
        ov30_02384E28(buffer, 1, var_r6);
    }
    
    for(int var_r6_2 = 0; var_r6_2 < DUNGEON_MAX_WILD_POKEMON; var_r6_2++)
    {
        ov30_02384E28(buffer, 0, var_r6_2);
    }
}
