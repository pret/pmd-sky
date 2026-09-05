#include "overlay_30.h"
#include "dungeon.h"
#include "overlay_29_02344AF8.h"
#include "overlay_29_022E1610.h"
#include "overlay_29_022F7364.h"
#include "dungeon_map_access.h"
#include <nitro.h>

extern struct dungeon *DUNGEON_PTR;

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

extern const u8 OVERLAY30_JP_STRING_1[0xC]; // みさき様
extern const u8 OVERLAY30_JP_STRING_2[0xC]; // やよい様

s32 NoteSaveBase(s32);           
s32 WriteQuickSaveInfo(s32, s32);
void sub_02003B94();             
void sub_02003BC8();             
void sub_02029F88(s32, s32, s32);
void sub_02029FBC();             
s32 sub_02048DC4(s32);           
void sub_02034D0C(void);

struct trap* GetTrapInfo(struct entity*);
void memset(void*, s32, s32);                                 /* extern */

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
    struct DataSerializer sp4;
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
    FinishBitSerializer(&sp4);
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
            ov30_02385C54(buffer, zeros, 8);
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
        ov30_02385C54(buffer, &sp1, 1);
        ov30_02385C54(buffer, &entity->is_visible, 1);
        ov30_02385C54(buffer, &entity->pos.x, 1);
        ov30_02385C54(buffer, &entity->pos.y, 1);
    }
    else 
    {
        sp0 = 0;
        ov30_02385C54(buffer, &sp0, 1);
        ov30_02385C54(buffer, &sp0, 1);
        ov30_02385C54(buffer, &sp0, 1);
        ov30_02385C54(buffer, &sp0, 1);
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
    ov30_02385C54(buffer, &spC, 2);
    spA = monster_ptr->id;
    ov30_02385C54(buffer, &spA, 2);
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
    ov30_02385C54(buffer,  &sp7, 1);
    sp6 = monster_ptr->types[1];
    ov30_02385C54(buffer,  &sp6, 1);
    sp5 = monster_ptr->abilities[0];
    ov30_02385C54(buffer,  &sp5, 1);
    sp4 = monster_ptr->abilities[1];
    ov30_02385C54(buffer,  &sp4, 1);
    ov30_02384268(buffer, &monster_ptr->held_item);
    sp8 = monster_ptr->previous_held_item_id;
    ov30_02385C54(buffer,  &sp8, 2);

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
    ov30_02385C54(buffer, &sp3, 1);
    ov30_02385D34(buffer, monster_ptr->hidden_power_base_power);
    sp2 = monster_ptr->hidden_power_type;
    ov30_02385C54(buffer,  &sp2, 1);
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
    ov30_02385C54(buffer, &sp1, 1);
    sp0 = monster_ptr->decoy_ai_tracker;
    ov30_02385C54(buffer, &sp0, 1);
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
    
    ov30_02385E48(buffer, (s32 *)&DUNGEON_PTR->kecleon_shop_min_x);
    ov30_02385E48(buffer, (s32 *)&DUNGEON_PTR->fixed_room_min_x);
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
void SpawnItem(void*, struct item*, s32);
void MemZero(void*, s32);
void BindTrapToTile(struct tile*, struct trap*, s32);
struct trap *SpawnTrap(u8, struct position*, u8, s32);
void ov29_02338768(struct position*);
void ov30_02384E28(void *, s32, s32);

void ov30_023842F4(void *buffer, s32 arg1)
{
    struct DataSerializer sp4;
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
    FinishBitSerializer(&sp4);
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
    
    ov30_02385FE4(buffer, (s32*)&DUNGEON_PTR->kecleon_shop_min_x);
    ov30_02385FE4(buffer, (s32*)&DUNGEON_PTR->fixed_room_min_x);
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
    u32 temp_r5;

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
    u32 temp_r4;
    u32 temp_r5;

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

void UpdateEntityPixelPos(void*, void *);
void UpdateIqSkillsWrapper(void*); 
void ov29_02338F24(s16, s16);
extern struct entity* LEADER_PTR;

// 98.65% matched - Seth
// https://decomp.me/scratch/g3lUO 

asm void ov30_02384E28(void *arg0, s32 arg1, s32 index) 
{
#ifdef JAPAN
#define OV30_02384E28_OFFSET -4
#define OV30_02384E28_OFFSET_2 -1
#else
#define OV30_02384E28_OFFSET 0
#define OV30_02384E28_OFFSET_2 0
#endif
#ifdef JAPAN
	stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
#else
	stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
#endif
	sub sp, sp, #0x258 + OV30_02384E28_OFFSET
	mov r10, r0
	mov r9, r1
	mov r8, r2
	add r0, sp, #0x18
	mov r1, #0
	mov r2, #0x240 + OV30_02384E28_OFFSET
	bl memset
	mov r0, r10
	bl ov30_02385EF4
	mov r0, r10
	bl ov30_02385EF4
	mov r0, r10
	bl ov30_02385EF4
	mov r11, r0
	mov r0, r10
	add r1, sp, #0x14
	bl ov30_02385F7C
	mov r0, r10
	bl ov30_02385F54
	mov r5, r0
	mov r0, r10
	bl ov30_02385EC4
	mov r6, r0
	ldr r1, =LEADER_PTR
	mov r2, #0
	mov r0, r10
	str r2, [r1]
	bl ov30_02385EC4
	strh r0, [sp, #0x18]
	add r0, sp, #0xe
	mov r1, #0
	mov r2, #2
	bl memset
	mov r0, r10
	add r1, sp, #0xe
	mov r2, #2
	bl ov30_02385CA4
	ldrsh r2, [sp, #0xe]
	add r0, sp, #0xc
	mov r1, #0
	strh r2, [sp, #0x1c]
	mov r2, #2
	bl memset
	mov r0, r10
	add r1, sp, #0xc
	mov r2, #2
	bl ov30_02385CA4
	ldrsh r1, [sp, #0xc]
	mov r0, r10
	strh r1, [sp, #0x1a]
	bl ov30_02385F54
	strb r0, [sp, #0x1e]
	mov r0, r10
	bl ov30_02385F54
	strb r0, [sp, #0x1f]
	mov r0, r10
	bl ov30_02385F54
	strb r0, [sp, #0x20]
	mov r0, r10
	bl ov30_02385EF4
	strb r0, [sp, #0x21]
	mov r0, r10
	bl ov30_02385EF4
	strb r0, [sp, #0x22]
	mov r0, r10
	bl ov30_02385EF4
	strh r0, [sp, #0x24]
	mov r0, r10
	bl ov30_02385EF4
	strb r0, [sp, #0x60]
	mov r0, r10
	bl ov30_02385EF4
	strb r0, [sp, #0x61]
	mov r0, r10
	bl ov30_02385EDC
	strh r0, [sp, #0x26]
	mov r0, r10
	bl ov30_02385EDC
	strh r0, [sp, #0x28]
	mov r0, r10
	bl ov30_02385EDC
	strh r0, [sp, #0x2a]
	mov r0, r10
	bl ov30_02385EDC
	strh r0, [sp, #0x2e]
	mov r0, r10
	bl ov30_02385EDC
	strh r0, [sp, #0x2c]
	mov r0, r10
	bl ov30_02385EF4
	strb r0, [sp, #0x32]
	mov r0, r10
	bl ov30_02385EF4
	strb r0, [sp, #0x33]
	mov r0, r10
	bl ov30_02385EF4
	strb r0, [sp, #0x34]
	mov r0, r10
	bl ov30_02385EF4
	strb r0, [sp, #0x35]
	mov r0, r10
	bl ov30_02385F0C
	str r0, [sp, #0x38]
	mov r0, r10
	bl ov30_02385EDC
	strh r0, [sp, #0x3c]
	mov r0, r10
	bl ov30_02385EDC
	strh r0, [sp, #0x3e]
	mov r0, r10
	bl ov30_02385EDC
	strh r0, [sp, #0x40]
	mov r0, r10
	bl ov30_02385EDC
	strh r0, [sp, #0x42]
	mov r0, r10
	bl ov30_02385EDC
	strh r0, [sp, #0x44]
	mov r0, r10
	bl ov30_02385EDC
	strh r0, [sp, #0x46]
	mov r0, r10
	bl ov30_02385EDC
	strh r0, [sp, #0x48]
	mov r0, r10
	bl ov30_02385F3C
	str r0, [sp, #0x4c]
	mov r0, r10
	bl ov30_02385F3C
	str r0, [sp, #0x50]
	mov r0, r10
	bl ov30_02385F3C
	str r0, [sp, #0x54]
	mov r0, r10
	bl ov30_02385F3C
	str r0, [sp, #0x58]
	mov r0, #0
	strh r0, [sp, #0x62]
	mov r0, r10
	add r1, sp, #0x64
	mov r2, #1
	bl ov30_02385CA4
	mov r0, #7
	strb r0, [sp, #0x65]
	mov r0, r10
	add r1, sp, #0x72
	bl ov30_02385F7C
	add r0, sp, #8
	mov r1, #0
	mov r2, #1
	bl memset
	mov r0, r10
	add r1, sp, #8
	mov r2, #1
	bl ov30_02385CA4
	ldrb r2, [sp, #8]
	add r0, sp, #7
	mov r1, #0
	strb r2, [sp, #0x76]
	mov r2, #1
	bl memset
	mov r0, r10
	add r1, sp, #7
	mov r2, #1
	bl ov30_02385CA4
	ldrb r2, [sp, #7]
	add r0, sp, #6
	mov r1, #0
	strb r2, [sp, #0x77]
	mov r2, #1
	bl memset
	mov r0, r10
	add r1, sp, #6
	mov r2, #1
	bl ov30_02385CA4
	ldrb r2, [sp, #6]
	add r0, sp, #5
	mov r1, #0
	strb r2, [sp, #0x78]
	mov r2, #1
	bl memset
	mov r0, r10
	add r1, sp, #5
	mov r2, #1
	bl ov30_02385CA4
	ldrb r2, [sp, #5]
	mov r0, r10
	add r1, sp, #0x7a
	strb r2, [sp, #0x79]
	bl ov30_02384B24
	add r0, sp, #0xa
	mov r1, #0
	mov r2, #2
	bl memset
	add r1, sp, #0xa
	mov r0, r10
	mov r2, #2
	bl ov30_02385CA4
	ldrsh r0, [sp, #0xa]
	mov r4, #0
	add r7, sp, #0x82
	strh r0, [sp, #0x80]
_02385158:
	mov r0, r10
	add r1, r7, r4, lsl #2
	bl ov30_02385F7C
	add r4, r4, #1
	cmp r4, #4
	blt _02385158
	add r1, sp, #0x94
	mov r0, r10
	mov r2, #1
	bl ov30_02385CA4
	mov r0, r10
	bl ov30_02385F54
	strb r0, [sp, #0x95]
	mov r0, r10
	bl ov30_02385F54
	strb r0, [sp, #0x96]
	mov r0, r10
	bl ov30_02385F54
	strb r0, [sp, #0x97]
	mov r0, r10
	bl ov30_02385EC4
	strh r0, [sp, #0x98]
	mov r0, #0
	str r0, [sp, #0x9c]
	str r0, [sp, #0xa0]
	mov r0, r10
	add r1, sp, #0xa4
	bl ov30_02385F7C
	mov r0, r10
	add r1, sp, #0xa8
	mov r2, #0x45
	bl ov30_02385CA4
	mov r0, r10
	add r1, sp, #0xb4
	mov r2, #0x45
	bl ov30_02385CA4
	add r0, sp, #4
	mov r1, #0
	mov r2, #1
	bl memset
	mov r0, r10
	add r1, sp, #4
	mov r2, #1
	bl ov30_02385CA4
	ldrb r1, [sp, #4]
	mov r0, r10
	strb r1, [sp, #0xc0]
	bl ov30_02385EDC
	strh r0, [sp, #0x5c]
	add r0, sp, #3
	mov r1, #0
	mov r2, #1
	bl memset
	mov r0, r10
	add r1, sp, #3
	mov r2, #1
	bl ov30_02385CA4
	ldrb r1, [sp, #3]
	mov r0, r10
	strb r1, [sp, #0x5e]
	bl ov30_02385F0C
	str r0, [sp, #0xc8]
	mov r0, r10
	bl ov30_02385F0C
	str r0, [sp, #0xcc]
	mov r0, r10
	bl ov30_02385F0C
	str r0, [sp, #0xd0]
	mov r0, r10
	add r1, sp, #0xd5
	mov r2, #1
	bl ov30_02385CA4
	mov r0, r10
	bl ov30_02385EF4
	strb r0, [sp, #0xd6]
	add r1, sp, #0xd7
	mov r0, r10
	mov r2, #1
	bl ov30_02385CA4
	mov r0, r10
	bl ov30_02385EF4
	strb r0, [sp, #0xd8]
	mov r0, r10
	bl ov30_02385EF4
	strb r0, [sp, #0xd9]
	mov r0, r10
	bl ov30_02385EF4
	strb r0, [sp, #0xda]
	mov r0, r10
	add r1, sp, #0xdc
	mov r2, #1
	bl ov30_02385CA4
	mov r0, r10
	bl ov30_02385EF4
	strb r0, [sp, #0xe4]
	mov r0, r10
	bl ov30_02385EF4
	strb r0, [sp, #0xe5]
	mov r0, r10
	bl ov30_02385F0C
	str r0, [sp, #0xe0]
	mov r0, r10
	add r1, sp, #0xe8
	mov r2, #1
	bl ov30_02385CA4
	mov r0, r10
	bl ov30_02385EF4
	strb r0, [sp, #0xe9]
	mov r0, r10
	add r1, sp, #0xea
	mov r2, #1
	bl ov30_02385CA4
	mov r0, r10
	bl ov30_02385EF4
	strb r0, [sp, #0xeb]
	mov r0, r10
	bl ov30_02385EF4
	strb r0, [sp, #0xec]
	mov r0, r10
	add r1, sp, #0xed
	mov r2, #1
	bl ov30_02385CA4
	mov r0, r10
	bl ov30_02385EF4
	strb r0, [sp, #0xee]
	mov r0, r10
	bl ov30_02385EF4
	strb r0, [sp, #0xef]
	mov r0, r10
	add r1, sp, #0xf0
	mov r2, #1
	bl ov30_02385CA4
	mov r0, r10
	bl ov30_02385F54
	strb r0, [sp, #0xf1]
	mov r0, r10
	bl ov30_02385F54
	strb r0, [sp, #0xf2]
	mov r0, r10
	bl ov30_02385EF4
	strb r0, [sp, #0xf3]
	mov r0, r10
	bl ov30_02385EF4
	strb r0, [sp, #0xf4]
	mov r0, r10
	add r1, sp, #0xf8
	mov r2, #1
	bl ov30_02385CA4
	mov r0, r10
	bl ov30_02385F0C
	str r0, [sp, #0xfc]
	mov r0, r10
	bl ov30_02385EF4
	strb r0, [sp, #0x100]
	mov r0, r10
	bl ov30_02385EF4
	strb r0, [sp, #0x101]
	mov r0, r10
	bl ov30_02385EF4
	strb r0, [sp, #0x102]
	mov r0, r10
	add r1, sp, #0x104
	mov r2, #1
	bl ov30_02385CA4
	mov r0, r10
	bl ov30_02385EF4
	add r1, sp, #0x100
	strb r0, [sp, #0x105]
	mov r0, r10
	add r1, r1, #6
	mov r2, #1
	bl ov30_02385CA4
	add r1, sp, #0x100
	mov r0, r10
	add r1, r1, #7
	mov r2, #1
	bl ov30_02385CA4
	mov r0, r10
	bl ov30_02385EF4
	add r1, sp, #0x100
	strb r0, [sp, #0x108]
	mov r0, r10
	add r1, r1, #9
	mov r2, #1
	bl ov30_02385CA4
	mov r0, r10
	bl ov30_02385EF4
	add r1, sp, #0x100
	strb r0, [sp, #0x10a]
	mov r0, r10
	add r1, r1, #0xb
	mov r2, #1
	bl ov30_02385CA4
	mov r0, r10
	bl ov30_02385EF4
	add r1, sp, #0x100
	strb r0, [sp, #0x10c]
	mov r0, r10
	add r1, r1, #0xd
	mov r2, #1
	bl ov30_02385CA4
	mov r0, r10
	bl ov30_02385EF4
	add r1, sp, #0x100
	strb r0, [sp, #0x10e]
	add r1, r1, #0xf
	mov r0, r10
	mov r2, #1
	bl ov30_02385CA4
	mov r0, r10
	bl ov30_02385EF4
	strb r0, [sp, #0x110]
	mov r0, r10
	bl ov30_02385F54
	strb r0, [sp, #0x111]
	mov r0, r10
	bl ov30_02385F54
	strb r0, [sp, #0x112]
	mov r0, r10
	bl ov30_02385F54
	strb r0, [sp, #0x113]
	mov r0, r10
	bl ov30_02385F54
	strb r0, [sp, #0x114]
	mov r0, r10
	bl ov30_02385F54
#ifndef JAPAN
	strb r0, [sp, #0x11b]
	mov r0, r10
	bl ov30_02385F54
#endif
	strb r0, [sp, #0x115]
	mov r0, r10
	bl ov30_02385EF4
	strb r0, [sp, #0x120 + OV30_02384E28_OFFSET_2]
	mov r0, r10
	bl ov30_02385F54
	strb r0, [sp, #0x116]
	mov r0, r10
	bl ov30_02385F54
	strb r0, [sp, #0x117]
	mov r0, r10
	bl ov30_02385F54
	strb r0, [sp, #0x118]
	mov r0, r10
	bl ov30_02385EF4
#ifdef JAPAN
	strb r0, [sp, #0x11b]
	mov r0, r10
	bl ov30_02385EF4
	strb r0, [sp, #0x11c]
	mov r0, r10
	bl ov30_02385F54
	strb r0, [sp, #0x120]
	mov r0, r10
	bl ov30_02385EF4
	strb r0, [sp, #0x11d]
	mov r0, r10
	bl ov30_02385EF4
#else
	strb r0, [sp, #0x11c]
	mov r0, r10
	bl ov30_02385EF4
	strb r0, [sp, #0x11d]
	mov r0, r10
	bl ov30_02385F54
	strb r0, [sp, #0x121]
	mov r0, r10
	bl ov30_02385EF4
#endif
	strb r0, [sp, #0x11e]
	mov r0, r10
	bl ov30_02385EF4
#ifndef JAPAN
	strb r0, [sp, #0x11f]
	mov r0, r10
	bl ov30_02385EF4
#endif
	strb r0, [sp, #0x122 + OV30_02384E28_OFFSET_2]
	add r0, sp, #2
	mov r1, #0
	mov r2, #1
	bl memset
	mov r0, r10
	add r1, sp, #2
	mov r2, #1
	bl ov30_02385CA4
	ldrb r3, [sp, #2]
	add r0, sp, #1
	mov r1, #0
	mov r2, #1
	strb r3, [sp, #0x123 + OV30_02384E28_OFFSET_2]
	bl memset
	add r1, sp, #1
	mov r0, r10
	mov r2, #1
	bl ov30_02385CA4
	ldrb r2, [sp, #1]
	add r0, sp, #0x10
	mov r1, #0
	strb r2, [sp, #0x124 + OV30_02384E28_OFFSET_2]
	mov r2, #4
	bl memset
	mov r0, r10
	add r1, sp, #0x10
	mov r2, #4
	bl ov30_02385CA4
	ldr r1, [sp, #0x10]
	mov r0, r10
	str r1, [sp, #0x128 + OV30_02384E28_OFFSET]
	add r1, sp, #0x12c + OV30_02384E28_OFFSET
	mov r2, #5
	bl ov30_02386074
	add r1, sp, #0x100
	mov r0, r10
	add r1, r1, #0x31 + OV30_02384E28_OFFSET
	mov r2, #5
	bl ov30_02386074
	mov r0, r10
	bl ov30_02385EF4
	strb r0, [sp, #0x136 + OV30_02384E28_OFFSET]
	mov r0, r10
	bl ov30_02385EF4
	strb r0, [sp, #0x137 + OV30_02384E28_OFFSET]
	mov r0, r10
	bl ov30_02385EF4
	str r0, [sp, #0x138 + OV30_02384E28_OFFSET]
	mov r7, #0
	add r4, sp, #0x18
_02385630:
	mov r0, r10
	bl ov30_02385EF4
	add r1, r4, r7, lsl #3
	strb r0, [r1, #0x124 + OV30_02384E28_OFFSET]
	mov r0, r10
	bl ov30_02385EF4
	add r1, r4, r7, lsl #3
	add r1, r1, #0x100
	strh r0, [r1, #0x26 + OV30_02384E28_OFFSET]
	add r1, sp, #0x13c + OV30_02384E28_OFFSET
	add r1, r1, r7, lsl #3
	mov r0, r10
	add r1, r1, #4
	mov r2, #2
	bl ov30_02385CA4
	mov r0, r10
	bl ov30_02385EF4
	add r1, r4, r7, lsl #3
	strb r0, [r1, #0x12a + OV30_02384E28_OFFSET]
	mov r0, r10
	bl ov30_02385EF4
	add r1, r4, r7, lsl #3
	add r7, r7, #1
	strb r0, [r1, #0x12b + OV30_02384E28_OFFSET]
	cmp r7, #4
	blt _02385630
	mov r0, r10
	bl ov30_02385EF4
	strb r0, [sp, #0x15c + OV30_02384E28_OFFSET]
	mov r0, r10
	bl ov30_02385EDC
	add r1, sp, #0x100
	strh r0, [r1, #0x5e + OV30_02384E28_OFFSET]
	mov r0, r10
	bl ov30_02385EDC
	add r1, sp, #0x100
	strh r0, [r1, #0x60 + OV30_02384E28_OFFSET]
	mov r0, r10
	bl ov30_02385EDC
	add r1, sp, #0x100
	strh r0, [r1, #0x62 + OV30_02384E28_OFFSET]
	mov r0, r10
	bl ov30_02385EDC
	add r1, sp, #0x100
	strh r0, [r1, #0x64 + OV30_02384E28_OFFSET]
	mov r0, r10
	bl ov30_02385F54
	strb r0, [sp, #0x166 + OV30_02384E28_OFFSET]
	mov r0, r10
	bl ov30_02385F54
	strb r0, [sp, #0x167 + OV30_02384E28_OFFSET]
	mov r0, r10
	bl ov30_02385F54
	strb r0, [sp, #0x169 + OV30_02384E28_OFFSET]
	mov r0, r10
	bl ov30_02385F54
	strb r0, [sp, #0x168 + OV30_02384E28_OFFSET]
	mov r0, r10
	bl ov30_02385F54
	strb r0, [sp, #0x16a + OV30_02384E28_OFFSET]
	mov r0, r10
	bl ov30_02385F54
	strb r0, [sp, #0x16b + OV30_02384E28_OFFSET]
	mov r0, r10
	bl ov30_02385F54
	strb r0, [sp, #0x16c + OV30_02384E28_OFFSET]
	mov r0, r10
	bl ov30_02385F54
	strb r0, [sp, #0x16d + OV30_02384E28_OFFSET]
	mov r0, r10
	bl ov30_02385F54
	strb r0, [sp, #0x16e + OV30_02384E28_OFFSET]
	mov r0, r10
	bl ov30_02385EC4
	add r1, sp, #0x100
	strh r0, [r1, #0x70 + OV30_02384E28_OFFSET]
	mov r0, r10
	bl ov30_02385EC4
	add r1, sp, #0x100
	strh r0, [r1, #0x72 + OV30_02384E28_OFFSET]
	mov r0, r10
	bl ov30_02385F54
	strb r0, [sp, #0x174 + OV30_02384E28_OFFSET]
	mov r0, r10
	bl ov30_02385EF4
	strb r0, [sp, #0x175 + OV30_02384E28_OFFSET]
	mov r0, r10
	bl ov30_02385F54
	strb r0, [sp, #0x176 + OV30_02384E28_OFFSET]
	mov r0, r10
	bl ov30_02385F54
	strb r0, [sp, #0x177 + OV30_02384E28_OFFSET]
	mov r0, r10
	bl ov30_02385F54
	strb r0, [sp, #0x178 + OV30_02384E28_OFFSET]
	mov r0, r10
	bl ov30_02385EF4
	strb r0, [sp, #0x18f + OV30_02384E28_OFFSET]
	mov r0, r10
	bl ov30_02385EF4
	strb r0, [sp, #0x190 + OV30_02384E28_OFFSET]
	mov r0, r10
	bl ov30_02385EF4
	strb r0, [sp, #0x191 + OV30_02384E28_OFFSET]
	mov r0, r10
	bl ov30_02385EF4
	strb r0, [sp, #0x192 + OV30_02384E28_OFFSET]
	mov r0, r10
	bl ov30_02385EF4
	strb r0, [sp, #0x193 + OV30_02384E28_OFFSET]
	mov r0, r10
	bl ov30_02385EF4
	add r1, sp, #0x100
	strb r0, [sp, #0x194 + OV30_02384E28_OFFSET]
	mov r0, r10
	add r1, r1, #0x96 + OV30_02384E28_OFFSET
	bl ov30_02385F7C
	mov r0, r10
	bl ov30_02385F3C
	str r0, [sp, #0x1a0 + OV30_02384E28_OFFSET]
	mov r0, r10
	bl ov30_02385EC4
	add r1, sp, #0x100
	strh r0, [r1, #0xaa + OV30_02384E28_OFFSET]
	mov r0, r10
	bl ov30_02385F24
	str r0, [sp, #0x1a4 + OV30_02384E28_OFFSET]
	mov r0, r10
	bl ov30_02385EC4
	add r1, sp, #0x100
	strh r0, [r1, #0xa8 + OV30_02384E28_OFFSET]
	mov r0, r10
	bl ov30_02385EDC
	add r1, sp, #0x200
	strh r0, [r1, #0x28 + OV30_02384E28_OFFSET]
	mov r0, r10
	bl ov30_02385EDC
	add r1, sp, #0x200
	strh r0, [r1, #0x2a + OV30_02384E28_OFFSET]
	mov r0, r10
	bl ov30_02385F0C
	str r0, [sp, #0x22c + OV30_02384E28_OFFSET]
	add r0, sp, #0
	mov r1, #0
	mov r2, #1
	bl memset
	mov r0, r10
	add r1, sp, #0
	mov r2, #1
	bl ov30_02385CA4
	ldrb r1, [sp]
	mov r0, r10
	strb r1, [sp, #0xd4]
	bl ov30_02385EF4
	strb r0, [sp, #0x17e + OV30_02384E28_OFFSET]
	mov r0, r10
	bl ov30_02385EF4
	strb r0, [sp, #0x17f + OV30_02384E28_OFFSET]
	mov r0, r10
	bl ov30_02385EDC
	add r1, sp, #0x100
	strh r0, [r1, #0x80 + OV30_02384E28_OFFSET]
	mov r0, r10
	bl ov30_02385EDC
	strh r0, [sp, #0xc4]
	mov r0, r10
	bl ov30_02385EF4
	strb r0, [sp, #0x182 + OV30_02384E28_OFFSET]
	mov r4, #0
	add r7, sp, #0x18
_023858D8:
	mov r0, r10
	bl ov30_02385EF4
	add r1, r7, r4
	add r4, r4, #1
	strb r0, [r1, #0x16b + OV30_02384E28_OFFSET]
	cmp r4, #5
	blt _023858D8
	ldr r0, =LEADER_PTR
	mov r1, #0
	str r1, [r0]
	cmp r11, #0
	beq _023859D0
	cmp r9, #0
	beq _02385924
	ldrsh r0, [sp, #0x1a]
	ldrsh r1, [sp, #0x1c]
	mov r2, r8
	bl ov30_023859DC
	b _02385934
_02385924:
	ldrsh r0, [sp, #0x1a]
	ldrsh r1, [sp, #0x1c]
	mov r2, r8
	bl ov30_02385B10
_02385934:
	mov r7, r0
	cmp r7, #0
	beq _023859D0
	ldrsh r0, [sp, #0x14]
	ldrsh r1, [sp, #0x16]
	ldr r4, [r7, #0xb4]
	bl GetTileSafe
	ldrh r1, [sp, #0x14]
	add r10, sp, #0x18
	mov r9, r4
	strh r1, [r7, #8]
	ldrh r1, [sp, #0x16]
	mov r8, #0x24 + OV30_02384E28_OFFSET_2
	strh r1, [r7, #0xa]
	ldrh r1, [sp, #0x14]
	strh r1, [r7, #4]
	ldrh r1, [sp, #0x16]
	strh r1, [r7, #6]
	str r7, [r0, #0xc]
	strb r5, [r7, #0x20]
	strh r6, [r7, #0x26]
_02385988:
	ldmia r10!, {r0, r1, r2, r3}
	stmia r9!, {r0, r1, r2, r3}
	subs r8, r8, #1
	bne _02385988
#ifdef JAPAN
	ldmia r10, {r0, r1, r2}
	stmia r9, {r0, r1, r2}
#endif
	ldr r0, =LEADER_PTR
	mov r1, #0
	str r1, [r0]
	ldrb r0, [r4, #7]
	cmp r0, #0
	beq _023859BC
	ldrsh r0, [r7, #4]
	ldrsh r1, [r7, #6]
	bl ov29_02338F24
_023859BC:
	mov r0, r7
	bl UpdateIqSkillsWrapper
	mov r0, r7
	mov r1, #0
	bl UpdateEntityPixelPos
_023859D0:
	add sp, sp, #0x258 + OV30_02384E28_OFFSET
#ifdef JAPAN
	ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
#else
	ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
#endif
}

void PopulateActiveMonsterPtrs(void);        
void ov29_022DE9F8(u8);                      
s32 ov29_022DEA10(u32);                      
void ov29_022E1AF4(u16, u16);                
void ov29_022E1EC4(u16, u16);
s32 ov29_022E1C84(s32*, s32*, s16, s16, s32);
s32 ov29_022E2018(s32*, s32*, s16, s16, s32);

static inline struct monster *GetEntInfo(struct entity *ent)
{
    return ent->info;
}

struct entity* ov30_023859DC(s16 id, s16 apparent_id, s32 monster_slot_index)
{
    s32 sp8;
    s32 sp4;
    s16 sprite_index;
    s32 temp_r5;
    struct monster* monster;
    struct entity* entity;

    temp_r5 = ov29_022DEA10(1);
    sprite_index = DungeonGetSpriteIndex(apparent_id);
    if (ov29_022E1C84(&sp8, &sp4, apparent_id, sprite_index, temp_r5) == 0) {
        return NULL;
    }
    entity = DUNGEON_PTR->monster_slot_ptrs[monster_slot_index];
    
    entity->type = ENTITY_MONSTER;
    entity->field_0x24 = monster_slot_index;
    
    monster = &DUNGEON_PTR->monsters[monster_slot_index];
    entity->info = monster;
    
    monster->id = id;
    GetEntInfo(entity)->apparent_id = apparent_id;
    GetEntInfo(entity)->is_not_team_member = 0;
    GetEntInfo(entity)->is_ally = 0;
    entity->sprite_index = sprite_index;
    entity->field_0xac = (sp8 + 0x1A);
    entity->animation_group_id = 7;
    entity->animation_id = 0;
    entity->animation_group_id_mirror = 0xFF;
    entity->animation_id_mirror0 = 1;
    entity->field_0xb3 = 1;
    entity->elevation = 0;
    PopulateActiveMonsterPtrs();
    GetEntInfo(entity)->field_0x17a = sp8;
    GetEntInfo(entity)->field_0x17b = sp4;
    ov29_022E1AF4(sp8, sp4);
    entity->field_0xaa = temp_r5;
    ov29_022DE9F8(temp_r5);
    entity->field_0x28 = 0;
    return entity;
}

struct entity* ov30_02385B10(s16 id, s16 apparent_id, s32 monster_slot_index)
{
    s32 sp8;
    s32 sp4;
    s16 sprite_index;
    s32 temp_r5;
    struct monster* monster;
    struct entity* entity;

    temp_r5 = ov29_022DEA10(2);
    sprite_index = DungeonGetSpriteIndex(apparent_id);

    if(ov29_022E2018(&sp8, &sp4, apparent_id, sprite_index, temp_r5) == 0)
    {
        return NULL;
    }
    
   
    // NOTE: Wild Pokemon Ptrs are after Team members..
    entity = DUNGEON_PTR->monster_slot_ptrs[MAX_TEAM_MEMBERS + monster_slot_index];

    entity->type = ENTITY_MONSTER;
    entity->field_0x24 = monster_slot_index;
    entity->transparent = 0;
    
    monster = &DUNGEON_PTR->wild_monsters[monster_slot_index];
    entity->info = monster;
    
    monster->id = id;
    GetEntInfo(entity)->apparent_id = apparent_id;
    GetEntInfo(entity)->is_not_team_member = TRUE;
    entity->sprite_index = sprite_index;
    entity->field_0xac = (sp8 + 0x62);
    entity->animation_group_id = 7;
    entity->animation_id = 0;
    entity->animation_group_id_mirror = 0xFF;
    entity->animation_id_mirror0 = 1;
    entity->field_0xb3 = 1;
    entity->elevation = 0;
   
    GetEntInfo(entity)->field_0x17a = sp8;
    GetEntInfo(entity)->field_0x17b = sp4;
    ov29_022E1EC4(sp8, sp4);
    PopulateActiveMonsterPtrs();
    entity->field_0xaa = temp_r5;
    ov29_022DE9F8(temp_r5);
    entity->field_0x28 = 0;
    return entity;
}


void ov30_02385C3C(struct DataSerializer *r0, u8 *r1, s32 r2)
{
    r0->stream = r1;
    r0->count = 0;
    r0->end = r1 + r2;
}

void ov30_02385C54(struct DataSerializer *r0, const void* src, s32 numBits)
{
    u8 *temp = (u8*)src;
    while (numBits != 0) {
        *r0->stream = *temp;;
        r0->stream++;
        r0->count++;
        temp++;
        numBits--;
    }
}

void ov30_02385C8C(struct DataSerializer *r0, u8 *r1, s32 r2)
{
    r0->stream = r1;
    r0->count = 0;
    r0->end = r1 + r2;
}

void ov30_02385CA4(struct DataSerializer* r0, void* src, s32 numBits)
{
    u8 *temp = (u8*)src;
    while (numBits != 0) {
        *temp = *r0->stream;
        r0->stream++;
        r0->count++;
        temp++;
        numBits--;
    }
}


void FinishBitSerializer(struct DataSerializer *r0)
{
}

void ov30_02385CE0(struct DataSerializer *arg0, const void *string)
{
    ov30_02385C54(arg0, string, 8);
}

void ov30_02385CF0(struct DataSerializer *arg0, const void *string)
{
    u8 buffer[0xC];
    ov30_02385CA4(arg0, buffer, 8);
    buffer[8] = 0;
}

void ov30_02385D14(struct DataSerializer *arg0, u16 r1)
{
    ov30_02385C54(arg0, &r1, 2);
}

void ov30_02385D34(struct DataSerializer *arg0, s16 r1)
{
    ov30_02385C54(arg0, &r1, 2);
}

void ov30_02385D54(struct DataSerializer *arg0, u8 r1)
{
    ov30_02385C54(arg0, &r1, 1);
}

void ov30_02385D74(struct DataSerializer *arg0, s32 r1)
{
    ov30_02385C54(arg0, &r1, 4);
}

void ov30_02385D94(struct DataSerializer *arg0, s32 r1)
{
    ov30_02385C54(arg0, &r1, 4);
}

void ov30_02385DB4(struct DataSerializer *arg0, s32 r1)
{
    ov30_02385C54(arg0, &r1, 4);
}

void ov30_02385DD4(struct DataSerializer *arg0, u8 arg1)
{
    u8 sp0;
    u8 var_r3;

    if (arg1 != 0) {
        var_r3 = 0xFF;
    } else {
        var_r3 = 0;
    }
    sp0 = var_r3;
    ov30_02385C54(arg0, &sp0, 1);
}

void ov30_02385DF8(struct DataSerializer *arg0, struct position *pos)
{
    ov30_02385C54(arg0, &pos->x, 1);
    ov30_02385C54(arg0, &pos->y, 1);
}

void ov30_02385E20(struct DataSerializer *arg0, struct position *pos)
{
    ov30_02385C54(arg0, &pos->x, 2);
    ov30_02385C54(arg0, &pos->y, 2);
}


void ov30_02385E48(struct DataSerializer *arg0, s32 *arg1)
{
    ov30_02385C54(arg0, arg1, 1);
    ov30_02385C54(arg0, arg1 + 1, 1);
    ov30_02385C54(arg0, arg1 + 2, 1);
    ov30_02385C54(arg0, arg1 + 3, 1);
}

void ov30_02385E90(struct DataSerializer *arg0, u16 *arg1)
{
    ov30_02385C54(arg0, arg1, 1);
    ov30_02385C54(arg0, arg1 + 1, 1);
}

void ov30_02385EB8(struct DataSerializer *arg0, u8 *arg1, s32 num)
{
    ov30_02385C54(arg0, arg1, num);
}

u16 ov30_02385EC4(struct DataSerializer *arg0)
{
    u16 sp0;
    ov30_02385CA4(arg0, &sp0, 2);
    return sp0;
}

s16 ov30_02385EDC(struct DataSerializer *arg0)
{
    s16 sp0;
    ov30_02385CA4(arg0, &sp0, 2);
    return sp0;
}

u8 ov30_02385EF4(struct DataSerializer *arg0)
{
    u8 sp0;
    ov30_02385CA4(arg0, &sp0, 1);
    return sp0;
}

u32 ov30_02385F0C(struct DataSerializer *arg0)
{
    u32 sp0;
    ov30_02385CA4(arg0, &sp0, 4);
    return sp0;
}

s32 ov30_02385F24(struct DataSerializer *arg0)
{
    s32 sp0;
    ov30_02385CA4(arg0, &sp0, 4);
    return sp0;
}

s32 ov30_02385F3C(struct DataSerializer *arg0)
{
    s32 sp0;
    ov30_02385CA4(arg0, &sp0, 4);
    return sp0;
}

u8 ov30_02385F54(struct DataSerializer *arg0)
{
    u8 sp0;
    u8 var_r0;

    ov30_02385CA4(arg0, &sp0, 1);
    if (sp0 != 0) {
        var_r0 = 1;
    } else {
        var_r0 = 0;
    }
    return var_r0;
}

void ov30_02385F7C(struct DataSerializer *arg0, struct position *pos)
{
    pos->x = 0;
    pos->y = 0;

    ov30_02385CA4(arg0, &pos->x, 1);
    ov30_02385CA4(arg0, &pos->y, 1); 
}

void ov30_02385FB0(struct DataSerializer *arg0, struct position *pos)
{
    pos->x = 0;
    pos->y = 0;

    ov30_02385CA4(arg0, &pos->x, 2);
    ov30_02385CA4(arg0, &pos->y, 2); 
}


void ov30_02385FE4(struct DataSerializer *arg0, s32 *arg1)
{

    *arg1 = 0;
    *(arg1 + 1) = 0;
    *(arg1 + 2) = 0;
    *(arg1 + 3) = 0;

    ov30_02385CA4(arg0, arg1, 1);
    ov30_02385CA4(arg0, arg1 + 1, 1);
    ov30_02385CA4(arg0, arg1 + 2, 1);
    ov30_02385CA4(arg0, arg1 + 3, 1);
}

void ov30_02386040(struct DataSerializer *arg0, u16 *arg1)
{
    *arg1 = 0;
    *(arg1 + 1) = 0;
    ov30_02385CA4(arg0, arg1, 1);
    ov30_02385CA4(arg0, arg1 + 1, 1);
}


void ov30_02386074(struct DataSerializer *arg0, u8 *arg1, s32 num)
{
    ov30_02385CA4(arg0, arg1, num);
}

