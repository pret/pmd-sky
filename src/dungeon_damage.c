#include "dungeon_damage.h"
#include "dungeon_logic_3.h"
#include "dungeon_pokemon_attributes.h"
#include "dungeon_util_static.h"
#include "move_orb_effects.h"
#include "overlay_29_02308FBC.h"
#include "overlay_29_0230A994.h"
#include "overlay_29_02318A4C.h"
#include "weather.h"

#define NUM_EFFECTIVENESS 4

extern enum type_matchup GetTypeMatchup(struct entity *attacker, struct entity *defender, s16 target_type_idx, enum type_id attack_type);
extern bool8 LevitateIsActive(struct entity* entity);
extern bool8 ScrappyShouldActivate(struct entity *attacker, struct entity *defender, enum type_id attack_type);

// https://decomp.me/scratch/j2xpy
// https://decomp.me/scratch/fk1Fo
#ifdef NONMATCHING
s32 WeightWeakTypePicker(struct entity *user, struct entity *target, enum type_id move_type)
{
    s32 weight = 1;
    bool8 check_exposed = FALSE;
    if (!EntityIsValid__02308FBC(target))
        return 1;

    struct monster *user_data = GetEntInfo(user);
    struct monster *target_data = GetEntInfo(target);
    if (AbilityIsActiveVeneer(user, ABILITY_NORMALIZE))
        move_type = TYPE_NORMAL;

    if (move_type == TYPE_NORMAL || move_type == TYPE_FIGHTING)
        check_exposed = TRUE;

    if (move_type == TYPE_FIRE && FlashFireShouldActivate(user, target) != FLASH_FIRE_STATUS_NONE)
        return 0;

#ifdef JAPAN
    if (move_type == TYPE_ELECTRIC && DefenderAbilityIsActive__0230A940(user, target, ABILITY_VOLT_ABSORB))
#else
    if (move_type == TYPE_ELECTRIC && DefenderAbilityIsActive__0230A940(user, target, ABILITY_VOLT_ABSORB, TRUE))
#endif
        return 0;

#ifdef JAPAN
    if (move_type == TYPE_WATER && DefenderAbilityIsActive__0230A940(user, target, ABILITY_WATER_ABSORB, TRUE))
#else
    if (move_type == TYPE_WATER && DefenderAbilityIsActive__0230A940(user, target, ABILITY_WATER_ABSORB, TRUE))
#endif
        return 0;

    if (move_type == TYPE_GROUND &&
        ((!AbilityIsActiveVeneer(user, ABILITY_MOLD_BREAKER) && LevitateIsActive(target)) || IsFloating(target)))
        return 1;

    bool8 scrappy_active = ScrappyShouldActivate(user, target, move_type);

    for (s32 i = 0; i < 2; i++)
    {
        s32 effectiveness;
        u32 type_effectiveness_multipliers[NUM_EFFECTIVENESS] = {0, 1, 2, 4};
        if (!scrappy_active && check_exposed && target_data->types[i] == TYPE_GHOST && !target_data->exposed)
        {
            effectiveness = 0;
            DUNGEON_PTR[0]->last_damage_calc.ghost_immunity_activated = TRUE;
        }
        else
            effectiveness = GetTypeMatchup(user, target, i, move_type);

        if (weight == 0)
            break;

        weight *= type_effectiveness_multipliers[effectiveness];
        weight /= 2;
        if (weight == 0)
            // BUG: If the Pokémon's first type resists the move, the second type is ignored.
            // This calculates type effectiveness incorrectly if the first type resists the move and the second type is weak to the move.
            // For example, a Fire-type move is considered not very effective against a Rock/Bug-type like Anorith.
            return 2;
    }

#ifdef JAPAN
    if ((move_type == TYPE_FIRE || move_type == TYPE_ICE) && DefenderAbilityIsActive__0230A940(user, target, ABILITY_THICK_FAT, TRUE))
#else
    if ((move_type == TYPE_FIRE || move_type == TYPE_ICE) && DefenderAbilityIsActive__0230A940(user, target, ABILITY_THICK_FAT, TRUE))
#endif
        return 2;

    if (move_type == TYPE_WATER && AbilityIsActiveVeneer(user, ABILITY_TORRENT))
    {
        s32 max_hp_stat = MIN(user_data->max_hp_stat + user_data->max_hp_boost, 999);
        max_hp_stat += ((u32)(max_hp_stat >> 1) >> 0x1e);

        if (max_hp_stat >> 2 >= user_data->hp)
            weight *= 2;
    }

    if (move_type == TYPE_GRASS && AbilityIsActiveVeneer(user, ABILITY_OVERGROW))
    {
        s32 max_hp_stat = MIN(user_data->max_hp_stat + user_data->max_hp_boost, 999);
        max_hp_stat += ((u32)(max_hp_stat >> 1) >> 0x1e);

        if (max_hp_stat >> 2 >= user_data->hp)
            weight *= 2;
    }

    if (move_type == TYPE_BUG && AbilityIsActiveVeneer(user, ABILITY_SWARM))
    {
        s32 max_hp_stat = MIN(user_data->max_hp_stat + user_data->max_hp_boost, 999);
        max_hp_stat += ((u32)(max_hp_stat >> 1) >> 0x1e);

        if (max_hp_stat >> 2 >= user_data->hp)
            weight *= 2;
    }

    if (move_type == TYPE_FIRE && AbilityIsActiveVeneer(user, ABILITY_BLAZE))
    {
        s32 max_hp_stat = MIN(user_data->max_hp_stat + user_data->max_hp_boost, 999);
        max_hp_stat += ((u32)(max_hp_stat >> 1) >> 0x1e);

        if (max_hp_stat >> 2 >= user_data->hp)
            weight *= 2;
    }

    if (weight == 0)
        return 2;

    if (MonsterIsType(user, move_type))
        weight *= 2;

    if (GetApparentWeather(user) == WEATHER_SUNNY)
    {
        if (move_type == TYPE_FIRE)
            weight *= 2;
        else if (move_type == TYPE_WATER)
            return 2;
    }

    if (DUNGEON_PTR[0]->weather.mud_sport_turns != 0 && move_type == TYPE_ELECTRIC)
        return 2;

    if (DUNGEON_PTR[0]->weather.water_sport_turns != 0 && move_type == TYPE_FIRE)
        return 2;

    if (move_type == TYPE_ELECTRIC && user_data->bide_class_status.bide == STATUS_TWO_TURN_CHARGING)
        weight *= 2;

    if (weight >= 3)
        weight = 3;

    return weight + 2;
}
#else
const u32 WEAK_TYPE_PICKER_MATCHUP_MULTIPLIERS[NUM_EFFECTIVENESS] = {0, 1, 2, 4};

asm s32 WeightWeakTypePicker(struct entity *user, struct entity *target, enum type_id move_type)
{
	stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
	sub sp, sp, #0x24
	mov r9, r1
	mov r10, r0
	mov r0, r9
	mov r4, #1
	mov r8, r2
	mov r11, #0
	bl EntityIsValid__02308FBC
	cmp r0, #0
	moveq r0, r4
	beq _0230BB98
	mov r0, r10
	mov r1, #0x6b
	ldr r7, [r10, #0xb4]
	ldr r6, [r9, #0xb4]
	bl AbilityIsActiveVeneer
	cmp r0, #0
	movne r8, r4
	cmp r8, #1
	cmpne r8, #7
	moveq r11, #1
	cmp r8, #2
	bne _0230B84C
	mov r0, r10
	mov r1, r9
	bl FlashFireShouldActivate
	cmp r0, #0
	movne r0, #0
	bne _0230BB98
_0230B84C:
	cmp r8, #5
	bne _0230B874
	mov r0, r10
	mov r1, r9
	mov r2, #0x23
#ifndef JAPAN
	mov r3, #1
#endif
	bl DefenderAbilityIsActive__0230A940
	cmp r0, #0
	movne r0, #0
	bne _0230BB98
_0230B874:
	cmp r8, #3
	bne _0230B89C
	mov r0, r10
	mov r1, r9
	mov r2, #0x24
#ifndef JAPAN
	mov r3, #1
#endif
	bl DefenderAbilityIsActive__0230A940
	cmp r0, #0
	movne r0, #0
	bne _0230BB98
_0230B89C:
	cmp r8, #9
	bne _0230B8E0
	mov r0, r10
	mov r1, #0x53
	bl AbilityIsActiveVeneer
	cmp r0, #0
	bne _0230B8C8
	mov r0, r9
	bl LevitateIsActive
	cmp r0, #0
	bne _0230B8D8
_0230B8C8:
	mov r0, r9
	bl IsFloating
	cmp r0, #0
	beq _0230B8E0
_0230B8D8:
	mov r0, #1
	b _0230BB98
_0230B8E0:
	mov r0, r10
	mov r1, r9
	mov r2, r8
	bl ScrappyShouldActivate
	ldr r1, =WEAK_TYPE_PICKER_MATCHUP_MULTIPLIERS
	str r0, [sp]
	add ip, sp, #4
	ldmia r1, {r0, r1, r2, r3}
	stmia ip, {r0, r1, r2, r3}
	mov r5, #0
	b _0230B9A0
_0230B90C:
	ldr r0, [sp]
	add ip, sp, #0x14
	cmp r0, #0
	add r0, sp, #4
	ldmia r0, {r0, r1, r2, r3}
	stmia ip, {r0, r1, r2, r3}
	bne _0230B960
	cmp r11, #0
	beq _0230B960
	add r0, r6, r5
	ldrb r0, [r0, #0x5e]
	cmp r0, #0xe
	ldreqb r0, [r6, #0xfe]
	cmpeq r0, #0
	bne _0230B960
	ldr r1, =DUNGEON_PTR
	mov r0, #0
	ldr r2, [r1]
	mov r1, #1
	strb r1, [r2, #0x1d4]
	b _0230B978
_0230B960:
	mov r0, r10
	mov r1, r9
	mov r2, r5, lsl #0x10
	mov r2, r2, asr #0x10
	mov r3, r8
	bl GetTypeMatchup
_0230B978:
	cmp r4, #0
	beq _0230B9A8
	add r1, sp, #0x14
	ldr r0, [r1, r0, lsl #2]
	mul r0, r4, r0
	add r0, r0, r0, lsr #31
	movs r4, r0, asr #1
	moveq r0, #2
	beq _0230BB98
	add r5, r5, #1
_0230B9A0:
	cmp r5, #2
	blt _0230B90C
_0230B9A8:
	cmp r8, #2
	cmpne r8, #6
	bne _0230B9D4
	mov r0, r10
	mov r1, r9
	mov r2, #2
#ifndef JAPAN
	mov r3, #1
#endif
	bl DefenderAbilityIsActive__0230A940
	cmp r0, #0
	movne r0, #2
	bne _0230BB98
_0230B9D4:
	cmp r8, #3
	bne _0230BA1C
	mov r0, r10
	mov r1, #0x10
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _0230BA1C
	ldrsh r2, [r7, #0x12]
	ldrsh r1, [r7, #0x16]
	ldr r0, =0x000003E7
	add r2, r2, r1
	cmp r2, r0
	movgt r2, r0
	mov r0, r2, asr #1
	ldrsh r1, [r7, #0x10]
	add r0, r2, r0, lsr #30
	cmp r1, r0, asr #2
	movle r4, r4, lsl #1
_0230BA1C:
	cmp r8, #4
	bne _0230BA64
	mov r0, r10
	mov r1, #0x1a
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _0230BA64
	ldrsh r2, [r7, #0x12]
	ldrsh r1, [r7, #0x16]
	ldr r0, =0x000003E7
	add r2, r2, r1
	cmp r2, r0
	movgt r2, r0
	mov r0, r2, asr #1
	ldrsh r1, [r7, #0x10]
	add r0, r2, r0, lsr #30
	cmp r1, r0, asr #2
	movle r4, r4, lsl #1
_0230BA64:
	cmp r8, #0xc
	bne _0230BAAC
	mov r0, r10
	mov r1, #0x43
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _0230BAAC
	ldrsh r2, [r7, #0x12]
	ldrsh r1, [r7, #0x16]
	ldr r0, =0x000003E7
	add r2, r2, r1
	cmp r2, r0
	movgt r2, r0
	mov r0, r2, asr #1
	ldrsh r1, [r7, #0x10]
	add r0, r2, r0, lsr #30
	cmp r1, r0, asr #2
	movle r4, r4, lsl #1
_0230BAAC:
	cmp r8, #2
	bne _0230BAF4
	mov r0, r10
	mov r1, #0x46
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _0230BAF4
	ldrsh r2, [r7, #0x12]
	ldrsh r1, [r7, #0x16]
	ldr r0, =0x000003E7
	add r2, r2, r1
	cmp r2, r0
	movgt r2, r0
	mov r0, r2, asr #1
	ldrsh r1, [r7, #0x10]
	add r0, r2, r0, lsr #30
	cmp r1, r0, asr #2
	movle r4, r4, lsl #1
_0230BAF4:
	cmp r4, #0
	moveq r0, #2
	beq _0230BB98
	mov r0, r10
	mov r1, r8
	bl MonsterIsType
	cmp r0, #0
	mov r0, r10
	movne r4, r4, lsl #1
	bl GetApparentWeather
	cmp r0, #1
	bne _0230BB3C
	cmp r8, #2
	moveq r4, r4, lsl #1
	beq _0230BB3C
	cmp r8, #3
	moveq r0, #2
	beq _0230BB98
_0230BB3C:
	ldr r0, =DUNGEON_PTR
	ldr r1, [r0]
	add r0, r1, #0xc000
#ifdef JAPAN
	ldrb r0, [r0, #0xcb7]
#else
	ldrb r0, [r0, #0xd5b]
#endif
	cmp r0, #0
	beq _0230BB60
	cmp r8, #5
	moveq r0, #2
	beq _0230BB98
_0230BB60:
	add r0, r1, #0xc000
#ifdef JAPAN
	ldrb r0, [r0, #0xcb8]
#else
	ldrb r0, [r0, #0xd5c]
#endif
	cmp r0, #0
	beq _0230BB7C
	cmp r8, #2
	moveq r0, #2
	beq _0230BB98
_0230BB7C:
	cmp r8, #5
	ldreqb r0, [r7, #0xd2]
	cmpeq r0, #0xb
	moveq r4, r4, lsl #1
	cmp r4, #3
	movge r4, #3
	add r0, r4, #2
_0230BB98:
	add sp, sp, #0x24
	ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
}
#endif
