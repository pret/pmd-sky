#include "move_checks.h"
#include "dungeon_logic.h"
#include "dungeon_logic_3.h"
#include "dungeon_logic_4.h"
#include "dungeon_map_access_1.h"
#include "dungeon_util_1.h"
#include "dungeon_util_static.h"
#include "dungeon_visibility.h"
#include "inflict_status.h"
#include "math.h"
#include "number_util.h"
#include "overlay_29_02338390.h"
#include "run_dungeon_1.h"
#include "tileset.h"
#include "trap.h"
#include "weather.h"

extern bool8 ov29_023007DC(struct entity *entity);
extern bool8 IsThawingMove(struct move *move);
extern bool8 IsMonsterSleeping(struct entity* monster);
extern bool8 HasLastUsedMove(struct move *moves);
extern bool8 GendersEqualNotGenderless(s16 monster1, s16 monster2);

// https://decomp.me/scratch/TnODN
#ifdef NONMATCHING
bool8 StatusCheckerCheck(struct entity *attacker, struct move *move)
{
    struct monster *pokemon_info = GetEntInfo(attacker);
    switch (move->id)
    {
        case MOVE_HAIL:
            if (GetApparentWeather(attacker) == WEATHER_HAIL)
                return FALSE;
            break;
        case MOVE_RAGE:
            if (pokemon_info->bide_class_status.bide == STATUS_TWO_TURN_ENRAGED)
                return FALSE;
            break;
        case MOVE_COUNTER:
        case MOVE_PAYBACK:
        case MOVE_PURSUIT:
            if (pokemon_info->reflect_class_status.reflect == STATUS_REFLECT_COUNTER)
                return FALSE;
            break;
        case MOVE_MIRROR_MOVE:
            // This check is inconsistent for the Chatot Scarf because it includes RNG.
            if (MirrorMoveIsActive(attacker))
                return FALSE;
            break;
        case MOVE_HOWL:
        case MOVE_MEDITATE:
        case MOVE_SHARPEN:
            if (pokemon_info->stat_modifiers.offensive_stages[STAT_STAGE_ATK] > MAX_STAT_STAGE - 1)
                return FALSE;
            break;
        case MOVE_BELLY_DRUM:
            if (pokemon_info->stat_modifiers.offensive_stages[STAT_STAGE_ATK] > MAX_STAT_STAGE - 1 || CeilFixedPoint(pokemon_info->belly) < 1)
                return FALSE;
            break;
        case MOVE_ACID_ARMOR:
        case MOVE_BARRIER:
        case MOVE_DEFENSE_CURL:
        case MOVE_HARDEN:
        case MOVE_IRON_DEFENSE:
        case MOVE_WITHDRAW:
            if (pokemon_info->stat_modifiers.defensive_stages[STAT_STAGE_DEF] > MAX_STAT_STAGE - 1)
                return FALSE;
            break;
        case MOVE_AMNESIA:
            if (pokemon_info->stat_modifiers.defensive_stages[STAT_STAGE_SP_DEF] > MAX_STAT_STAGE - 1)
                return FALSE;
            break;
        case MOVE_BIDE:
        case MOVE_REVENGE:
        case MOVE_AVALANCHE:
            if (pokemon_info->bide_class_status.bide == STATUS_TWO_TURN_BIDE)
                return FALSE;
            break;
        case MOVE_AGILITY:
        case MOVE_ROCK_POLISH:
        case MOVE_TAILWIND:
            if (GetEntInfo(attacker)->speed_stage > MAX_SPEED_STAGE - 1)
                return FALSE;
            break;
        case MOVE_LOCK_ON:
        case MOVE_MIND_READER:
            if (pokemon_info->sure_shot_class_status.sure_shot == STATUS_SURE_SHOT_SURE_SHOT)
                return FALSE;
            break;
        case MOVE_COSMIC_POWER:
            if (pokemon_info->stat_modifiers.defensive_stages[STAT_STAGE_DEF] > MAX_STAT_STAGE - 1 && pokemon_info->stat_modifiers.defensive_stages[STAT_STAGE_SP_DEF] > MAX_STAT_STAGE - 1)
                return FALSE;
            break;
        case MOVE_ENDURE:
            if (pokemon_info->reflect_class_status.reflect == STATUS_REFLECT_ENDURING)
                return FALSE;
            break;
        case MOVE_CHARGE:
            if (pokemon_info->bide_class_status.bide == STATUS_TWO_TURN_CHARGING)
                return FALSE;
            break;
        case MOVE_MIST:
            if (MistIsActive(attacker))
                return FALSE;
            break;
        case MOVE_LIGHT_SCREEN:
            if (pokemon_info->reflect_class_status.reflect == STATUS_REFLECT_LIGHT_SCREEN)
                return FALSE;
            break;
        case MOVE_MINIMIZE:
            if (pokemon_info->stat_modifiers.hit_chance_stages[STAT_STAGE_EVASION] > MAX_STAT_STAGE - 1)
                return FALSE;
            break;
        case MOVE_INGRAIN:
        {
            if (pokemon_info->frozen_class_status.freeze == STATUS_FROZEN_INGRAIN)
                return FALSE;

            s32 max_hp = Min(999, pokemon_info->max_hp_stat + pokemon_info->max_hp_boost);
            if (max_hp / 2 < pokemon_info->hp)
                return FALSE;
            break;
        }
        case MOVE_SWALLOW:
        {
            s32 max_hp = Min(999, pokemon_info->max_hp_stat + pokemon_info->max_hp_boost);
            if (max_hp <= pokemon_info->hp || pokemon_info->stockpile_stage == 0)
                return FALSE;
            break;
        }
        case MOVE_SPIT_UP:
            if (pokemon_info->stockpile_stage == 0)
                return FALSE;
            break;
        case MOVE_DOOM_DESIRE:
        case MOVE_FUTURE_SIGHT:
            if (pokemon_info->sure_shot_class_status.sure_shot == STATUS_SURE_SHOT_SET_DAMAGE)
                return FALSE;
            break;
        case MOVE_BULK_UP:
            if (pokemon_info->stat_modifiers.offensive_stages[STAT_STAGE_ATK] > MAX_STAT_STAGE - 1 && pokemon_info->stat_modifiers.defensive_stages[STAT_STAGE_DEF] > MAX_STAT_STAGE - 1)
                return FALSE;
            break;
        case MOVE_CAMOUFLAGE:
            if (MonsterIsType(attacker, TILESET_PROPERTIES[DUNGEON_PTR[0]->gen_info.tileset_id].camouflage_type))
                return FALSE;
            break;
        case MOVE_TAIL_GLOW:
            if (pokemon_info->stat_modifiers.offensive_stages[STAT_STAGE_SP_ATK] > MAX_STAT_STAGE - 1)
                return FALSE;
            break;
        case MOVE_DESTINY_BOND:
            if (pokemon_info->leech_seed_class_status.leech_seed == STATUS_LEECH_SEED_DESTINY_BOND)
                return FALSE;
            break;
        case MOVE_MIRROR_COAT:
            if (pokemon_info->reflect_class_status.reflect == STATUS_REFLECT_MIRROR_COAT)
                return FALSE;
            break;
        case MOVE_REFLECT:
            if (pokemon_info->reflect_class_status.reflect == STATUS_REFLECT_REFLECT)
                return FALSE;
            break;
        case MOVE_DRAGON_DANCE:
            if (pokemon_info->stat_modifiers.offensive_stages[STAT_STAGE_ATK] > MAX_STAT_STAGE - 1 && GetEntInfo(attacker)->speed_stage > MAX_SPEED_STAGE - 1)
                return FALSE;
            break;
        case MOVE_MAGIC_COAT:
            if (pokemon_info->reflect_class_status.reflect == STATUS_REFLECT_MAGIC_COAT)
                return FALSE;
            break;
        case MOVE_DETECT:
        case MOVE_PROTECT:
            if (pokemon_info->reflect_class_status.reflect == STATUS_REFLECT_PROTECT)
                return FALSE;
            break;
        case MOVE_RAIN_DANCE:
            if (GetApparentWeather(attacker) == WEATHER_RAIN)
                return FALSE;
            break;
        case MOVE_SANDSTORM:
            if (GetApparentWeather(attacker) == WEATHER_SANDSTORM)
                return FALSE;
            break;
        case MOVE_SUNNY_DAY:
            if (GetApparentWeather(attacker) == WEATHER_SUNNY)
                return FALSE;
            break;
        case MOVE_SAFEGUARD:
            if (pokemon_info->reflect_class_status.reflect == STATUS_REFLECT_SAFEGUARD)
                return FALSE;
            break;
        case MOVE_INVISIFY:
            if (pokemon_info->invisible_class_status.status == STATUS_INVISIBLE_INVISIBLE)
                return FALSE;
            break;
        case MOVE_FOCUS_ENERGY:
            if (pokemon_info->sure_shot_class_status.sure_shot == STATUS_SURE_SHOT_FOCUS_ENERGY)
                return FALSE;
            break;
        case MOVE_TAKEAWAY:
            if (ItemExists(pokemon_info->held_item.flags))
                return FALSE;
            break;
        case MOVE_REST:
            if (!ov29_023007DC(attacker) && !MonsterHasNegativeStatus(attacker, FALSE))
                return FALSE;
            break;
        case MOVE_DIVE:
            if (IsTileGround(GetTileAtEntity(attacker)))
                return FALSE;
            break;
        case MOVE_DIG:
        {
            struct tile *tile = GetTileAtEntity(attacker);
            if (!IsTileGround(tile) || GetTerrainType(tile) != TERRAIN_TYPE_NORMAL)
                return FALSE;
            break;
        }
        case MOVE_TRAP_BUSTER:
        {
            struct entity *object = GetTileAtEntity(attacker)->object;
            if (object == NULL)
                return FALSE;
            if (GetEntityType(object) != ENTITY_TRAP)
                return FALSE;
            break;
        }
        case MOVE_MUD_SPORT:
            if (DUNGEON_PTR[0]->weather.mud_sport_turns > 0)
                return FALSE;
            break;
        case MOVE_WATER_SPORT:
            if (DUNGEON_PTR[0]->weather.water_sport_turns > 0)
                return FALSE;
            break;
        case MOVE_GRUDGE:
            if (pokemon_info->grudge)
                return FALSE;
            break;
        case MOVE_DECOY_MAKER:
        case MOVE_FOLLOW_ME:
        case MOVE_SUBSTITUTE:
            if (DUNGEON_PTR[0]->decoy_is_active)
                return FALSE;
            break;
        case MOVE_STOCKPILE:
            if (pokemon_info->stockpile_stage >= MAX_STOCKPILE_STAGE)
                return FALSE;
            break;
        case MOVE_CLEANSE:
            if (ItemExists(pokemon_info->held_item.flags) && !ItemSticky(pokemon_info->held_item.flags))
                return FALSE;
            break;
        case MOVE_DOUBLE_TEAM:
            if (pokemon_info->stat_modifiers.hit_chance_stages[STAT_STAGE_EVASION] >= MAX_STAT_STAGE)
                return FALSE;
            break;
        case MOVE_GROWTH:
            if (pokemon_info->stat_modifiers.offensive_stages[STAT_STAGE_SP_ATK] >= MAX_STAT_STAGE)
                return FALSE;
            break;
        case MOVE_SWORDS_DANCE:
            if (pokemon_info->stat_modifiers.offensive_stages[STAT_STAGE_ATK] >= MAX_STAT_STAGE)
                return FALSE;
            break;
        case MOVE_WISH:
            if (pokemon_info->is_not_team_member)
                return FALSE;
            if (pokemon_info->reflect_class_status.reflect == STATUS_REFLECT_WISH)
                return FALSE;
            break;
        case MOVE_TRANSFORM:
            if (pokemon_info->invisible_class_status.status == STATUS_INVISIBLE_TRANSFORMED)
                return FALSE;
            if (IsCurrentFixedRoomBossFight())
                return FALSE;
            break;
        case MOVE_SPIKES:
        case MOVE_STEALTH_ROCK:
        case MOVE_TOXIC_SPIKES:
            if (!CanLayTrap(&attacker->pos))
                return FALSE;
            break;
        case MOVE_CALM_MIND:
            if (pokemon_info->stat_modifiers.offensive_stages[STAT_STAGE_SP_ATK] >= MAX_STAT_STAGE && pokemon_info->stat_modifiers.defensive_stages[STAT_STAGE_SP_DEF] >= MAX_STAT_STAGE)
                return FALSE;
            break;
        case MOVE_SNATCH:
            if (pokemon_info->curse_class_status.curse == STATUS_CURSE_SNATCH)
                return FALSE;
            break;
        case MOVE_BEAT_UP:
        case MOVE_BLOWBACK:
        case MOVE_HURL:
        case MOVE_MEMENTO:
        case MOVE_ROAR:
        case MOVE_STAY_AWAY:
        case MOVE_SWITCHER:
        case MOVE_TELEPORT:
        case MOVE_VITAL_THROW:
        case MOVE_WARP:
        case MOVE_WHIRLWIND:
            if (IsCurrentFixedRoomBossFight())
                return FALSE;
            break;
        case MOVE_CONVERSION_2:
            if (Conversion2IsActive(attacker))
                return FALSE;
            break;
        case MOVE_HELPING_HAND:
            if (pokemon_info->is_not_team_member)
            {
                s32 i;
                for (i = 0; i < DUNGEON_MAX_WILD_POKEMON; i++)
                {
                    struct entity *target = DUNGEON_PTR[0]->monster_slots.wild_pokemon[i];
                    if (EntityIsValid__02333FAC(target) && target != attacker && CanSeeTarget(attacker, target))
                    {
                        if (GetEntInfo(target)->stat_modifiers.offensive_stages[STAT_STAGE_ATK] >= MAX_STAT_STAGE)
                            continue;

                        if (GetEntInfo(target)->stat_modifiers.offensive_stages[STAT_STAGE_SP_ATK] < MAX_STAT_STAGE)
                            break;
                    }
                }

                if (i == DUNGEON_MAX_WILD_POKEMON)
                    return FALSE;
            }
            else
            {
                s32 i;
                for (i = 0; i < MAX_TEAM_MEMBERS; i++)
                {
                    struct entity *target = DUNGEON_PTR[0]->monster_slots.party_members[i];
                    if (EntityIsValid__02333FAC(target) && target != attacker && CanSeeTarget(attacker, target))
                    {
                        if (GetEntInfo(target)->stat_modifiers.offensive_stages[STAT_STAGE_ATK] >= MAX_STAT_STAGE)
                            continue;

                        if (GetEntInfo(target)->stat_modifiers.offensive_stages[STAT_STAGE_SP_ATK] < MAX_STAT_STAGE)
                            break;
                    }
                }

                if (i == MAX_TEAM_MEMBERS)
                    return FALSE;
            }
            break;
        case MOVE_AQUA_RING:
            if (pokemon_info->reflect_class_status.reflect == STATUS_REFLECT_AQUA_RING)
                return FALSE;
            break;
        case MOVE_LUCKY_CHANT:
            if (pokemon_info->is_not_team_member)
            {
                s32 i;
                for (i = 0; i < DUNGEON_MAX_WILD_POKEMON; i++)
                {
                    struct entity *target = DUNGEON_PTR[0]->monster_slots.wild_pokemon[i];
                    if (EntityIsValid__02333FAC(target) && target != attacker && CanSeeTarget(attacker, target))
                    {
                        if (GetEntInfo(target)->reflect_class_status.reflect != STATUS_REFLECT_LUCKY_CHANT)
                            break;
                    }
                }
                if (i == DUNGEON_MAX_WILD_POKEMON)
                    return FALSE;
            }
            else
            {
                s32 i;
                for (i = 0; i < MAX_TEAM_MEMBERS; i++)
                {
                    struct entity *target = DUNGEON_PTR[0]->monster_slots.party_members[i];
                    if (EntityIsValid__02333FAC(target) && target != attacker && CanSeeTarget(attacker, target))
                    {
                        if (GetEntInfo(target)->reflect_class_status.reflect != STATUS_REFLECT_LUCKY_CHANT)
                            break;
                    }
                }
                if (i == MAX_TEAM_MEMBERS)
                    return FALSE;
            }
            break;
        case MOVE_PSYCHO_SHIFT:
            if (!MonsterHasNegativeStatus(attacker, FALSE))
                return FALSE;
            break;
        case MOVE_ACUPRESSURE:
            if (pokemon_info->is_not_team_member)
            {
                s32 i;
                for (i = 0; i < DUNGEON_MAX_WILD_POKEMON; i++)
                {
                    struct entity *target = DUNGEON_PTR[0]->monster_slots.wild_pokemon[i];
                    if (EntityIsValid__02333FAC(target) && target != attacker && CanSeeTarget(attacker, target))
                    {
                        if (GetEntInfo(target)->stat_modifiers.offensive_stages[STAT_STAGE_ATK] < MAX_STAT_STAGE)
                            break;

                        if (GetEntInfo(target)->stat_modifiers.defensive_stages[STAT_STAGE_DEF] < MAX_STAT_STAGE)
                            break;

                        if (GetEntInfo(target)->stat_modifiers.offensive_stages[STAT_STAGE_SP_ATK] < MAX_STAT_STAGE)
                            break;

                        if (GetEntInfo(target)->stat_modifiers.defensive_stages[STAT_STAGE_SP_DEF] < MAX_STAT_STAGE)
                            break;
                    }
                }
                if (i == DUNGEON_MAX_WILD_POKEMON)
                    return FALSE;
            }
            else
            {
                s32 i;
                for (i = 0; i < MAX_TEAM_MEMBERS; i++)
                {
                    struct entity *target = DUNGEON_PTR[0]->monster_slots.party_members[i];
                    if (EntityIsValid__02333FAC(target) && target != attacker && CanSeeTarget(attacker, target))
                    {
                        if (GetEntInfo(target)->stat_modifiers.offensive_stages[STAT_STAGE_ATK] < MAX_STAT_STAGE)
                            break;

                        if (GetEntInfo(target)->stat_modifiers.defensive_stages[STAT_STAGE_DEF] < MAX_STAT_STAGE)
                            break;

                        if (GetEntInfo(target)->stat_modifiers.offensive_stages[STAT_STAGE_SP_ATK] < MAX_STAT_STAGE)
                            break;

                        if (GetEntInfo(target)->stat_modifiers.defensive_stages[STAT_STAGE_SP_DEF] < MAX_STAT_STAGE)
                            break;
                    }
                }
                if (i == MAX_TEAM_MEMBERS)
                    return FALSE;
            }
            break;
        case MOVE_MAGNET_RISE:
            if (pokemon_info->magnet_rise == TRUE)
                return FALSE;
            break;
        case MOVE_TRICK_ROOM:
            if (pokemon_info->speed_stage > 1)
                return FALSE;
            break;
        case MOVE_DEFEND_ORDER:
            s32 i;
            for (i = 0; i < NUM_STATS_PER_CATEGORY; i++)
            {
                if (pokemon_info->stat_modifiers.defensive_stages[i] < MAX_STAT_STAGE)
                    break;
            }
            if (i == NUM_STATS_PER_CATEGORY)
                return FALSE;
            break;
        case MOVE_METAL_BURST:
            if (pokemon_info->reflect_class_status.reflect == STATUS_REFLECT_METAL_BURST)
                return FALSE;
            break;
        case MOVE_NASTY_PLOT:
            if (pokemon_info->stat_modifiers.offensive_stages[STAT_STAGE_SP_ATK] == MAX_STAT_STAGE)
                return FALSE;
            break;
        default:
            break;
    }
    return TRUE;
}
#else
extern void *ov10_022C6322;

asm bool8 StatusCheckerCheck(struct entity *attacker, struct move *move)
{
#ifdef JAPAN
#define STATUS_CHECKER_CHECK_OFFSET -4
#define STATUS_CHECKER_CHECK_OFFSET_2 -0xA4
#else
#define STATUS_CHECKER_CHECK_OFFSET 0
#define STATUS_CHECKER_CHECK_OFFSET_2 0
#endif
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldrh r2, [r1, #4]
	ldr r1, =0x00000109
	mov r4, r0
	cmp r2, r1
	ldr r3, [r4, #0xb4]
	bgt _02333314
	cmp r2, r1
	bge _02333834
	cmp r2, #0x9c
	bgt _023331F4
	bge _023339D8
	cmp r2, #0x4a
	bgt _02333170
	bge _0233397C
	cmp r2, #0x2b
	bgt _02333114
	bge _02333BCC
	cmp r2, #0x13
	bgt _023330F8
	bge _02333620
	sub r1, r2, #7
	cmp r1, #7
	addls pc, pc, r1, lsl #2
	b _02333F90
_023330D8:
	b _02333BCC
	b _023339F0
	b _02333F90
	b _02333F90
	b _02333F90
	b _02333918
	b _02333F90
	b _0233360C
_023330F8:
	cmp r2, #0x26
	bgt _02333108
	beq _02333634
	b _02333F90
_02333108:
	cmp r2, #0x28
	beq _02333648
	b _02333F90
_02333114:
	cmp r2, #0x37
	bgt _0233313C
	bge _02333660
	cmp r2, #0x31
	bgt _02333130
	beq _02333A84
	b _02333F90
_02333130:
	cmp r2, #0x33
	beq _02333634
	b _02333F90
_0233313C:
	cmp r2, #0x3d
	bgt _02333164
	cmp r2, #0x38
	blt _02333F90
	beq _02333B00
	cmp r2, #0x3a
	beq _023336B0
	cmp r2, #0x3d
	beq _023336D8
	b _02333F90
_02333164:
	cmp r2, #0x46
	beq _023336B0
	b _02333F90
_02333170:
	cmp r2, #0x68
	bgt _023331B0
	bge _02333730
	cmp r2, #0x62
	bgt _02333194
	bge _02333700
	cmp r2, #0x5f
	beq _023336EC
	b _02333F90
_02333194:
	cmp r2, #0x63
	bgt _023331A4
	beq _02333714
	b _02333F90
_023331A4:
	cmp r2, #0x66
	beq _02333A98
	b _02333F90
_023331B0:
	cmp r2, #0x86
	bgt _023331D8
	bge _02333954
	cmp r2, #0x80
	bgt _023331CC
	beq _02333744
	b _02333F90
_023331CC:
	cmp r2, #0x82
	beq _02333758
	b _02333F90
_023331D8:
	cmp r2, #0x8d
	bgt _023331E8
	beq _0233392C
	b _02333F90
_023331E8:
	cmp r2, #0x94
	beq _02333B14
	b _02333F90
_023331F4:
	cmp r2, #0xd7
	bgt _02333284
	bge _023336C4
	cmp r2, #0xb9
	bgt _02333240
	bge _02333BF4
	cmp r2, #0xa9
	bgt _02333224
	bge _02333780
	cmp r2, #0xa0
	beq _02333AB8
	b _02333F90
_02333224:
	cmp r2, #0xb5
	bgt _02333234
	beq _02333B28
	b _02333F90
_02333234:
	cmp r2, #0xb8
	beq _02333BE0
	b _02333F90
_02333240:
	cmp r2, #0xc3
	bgt _02333268
	bge _02333660
	cmp r2, #0xba
	bgt _0233325C
	beq _023336B0
	b _02333F90
_0233325C:
	cmp r2, #0xbb
	beq _02333BCC
	b _02333F90
_02333268:
	cmp r2, #0xca
	bgt _02333278
	beq _023336B0
	b _02333F90
_02333278:
	cmp r2, #0xd4
	beq _02333A44
	b _02333F90
_02333284:
	cmp r2, #0xec
	bgt _023332C4
	bge _023337D4
	cmp r2, #0xe1
	bgt _023332A8
	bge _02333B3C
	cmp r2, #0xdf
	beq _02333940
	b _02333F90
_023332A8:
	cmp r2, #0xe8
	bgt _023332B8
	beq _023339B0
	b _02333F90
_023332B8:
	cmp r2, #0xe9
	beq _02333794
	b _02333F90
_023332C4:
	sub r0, r1, #8
	cmp r2, r0
	bgt _023332F0
	bge _02333674
	cmp r2, #0xf5
	bgt _023332E4
	beq _0233380C
	b _02333F90
_023332E4:
	cmp r2, #0x100
	beq _02333820
	b _02333F90
_023332F0:
	sub r0, r1, #7
	cmp r2, r0
	bgt _02333304
	beq _023336B0
	b _02333F90
_02333304:
	sub r0, r1, #6
	cmp r2, r0
	beq _0233376C
	b _02333F90
_02333314:
	add r5, r1, #0x68
	cmp r2, r5
	bgt _023334B4
	bge _02333BCC
	add r5, r1, #0x34
	cmp r2, r5
	bgt _02333414
	bge _02333820
	cmp r2, #0x120
	bgt _02333398
	bge _02333884
	add r4, r1, #0x11
	cmp r2, r4
	bgt _02333378
	mov r0, r4
	cmp r2, r0
	bge _02333B60
	add r0, r1, #4
	cmp r2, r0
	bgt _02333F90
	cmp r2, #0x10c
	blt _02333F90
	cmpne r2, r0
	beq _02333BCC
	b _02333F90
_02333378:
	cmp r2, #0x11c
	bgt _02333388
	beq _02333BCC
	b _02333F90
_02333388:
	add r1, r1, #0x15
	cmp r2, r1
	beq _02333850
	b _02333F90
_02333398:
	add r0, r1, #0x2a
	cmp r2, r0
	bgt _023333F4
	add r0, r1, #0x24
	subs r0, r2, r0
	addpl pc, pc, r0, lsl #2
	b _023333D0
_023333B4:
	b _02333904
	b _023336B0
	b _02333F90
	b _02333A98
	b _02333904
	b _02333F90
	b _02333A64
_023333D0:
	ldr r0, =0x00000127
	cmp r2, r0
	bgt _023333E4
	beq _02333B84
	b _02333F90
_023333E4:
	add r0, r0, #3
	cmp r2, r0
	beq _023338F0
	b _02333F90
_023333F4:
	add r0, r1, #0x30
	cmp r2, r0
	bgt _02333408
	beq _02333898
	b _02333F90
_02333408:
	cmp r2, #0x13c
	beq _023338AC
	b _02333F90
_02333414:
	cmp r2, #0x154
	bgt _02333464
	bge _023336D8
	add r0, r1, #0x44
	cmp r2, r0
	bgt _02333440
	bge _02333660
	add r0, r1, #0x36
	cmp r2, r0
	beq _02333B9C
	b _02333F90
_02333440:
	add r0, r1, #0x45
	cmp r2, r0
	bgt _02333454
	beq _02333BB8
	b _02333F90
_02333454:
	add r0, r1, #0x49
	cmp r2, r0
	beq _023338C0
	b _02333F90
_02333464:
	cmp r2, #0x16c
	bgt _02333494
	bge _02333990
	add r0, r1, #0x4e
	cmp r2, r0
	bgt _02333484
	beq _023338D4
	b _02333F90
_02333484:
	add r0, r1, #0x54
	cmp r2, r0
	beq _02333700
	b _02333F90
_02333494:
	add r0, r1, #0x66
	cmp r2, r0
	bgt _023334A8
	beq _02333BCC
	b _02333F90
_023334A8:
	cmp r2, #0x170
	beq _02333BCC
	b _02333F90
_023334B4:
	cmp r2, #0x1d8
	bgt _02333578
	bge _02333634
	add r5, r1, #0x7e
	cmp r2, r5
	bgt _02333520
	mov r4, r5
	cmp r2, r4
	bge _02333968
	add r4, r1, #0x71
	cmp r2, r4
	bgt _02333500
	mov r0, r4
	cmp r2, r0
	bge _02333ACC
	add r0, r1, #0x6e
	cmp r2, r0
	beq _02333BCC
	b _02333F90
_02333500:
	cmp r2, #0x17c
	bgt _02333510
	beq _02333A98
	b _02333F90
_02333510:
	add r1, r1, #0x7c
	cmp r2, r1
	beq _02333A1C
	b _02333F90
_02333520:
	cmp r2, #0x1bc
	bgt _02333550
	bge _023336EC
	add r0, r1, #0x8d
	cmp r2, r0
	bgt _02333540
	beq _02333BCC
	b _02333F90
_02333540:
	add r0, r1, #0xa9
	cmp r2, r0
	beq _02333CEC
	b _02333F90
_02333550:
	add r5, r1, #0xb6
	cmp r2, r5
	bgt _0233356C
	mov r0, r5
	cmp r2, r0
	beq _02333D00
	b _02333F90
_0233356C:
	cmp r2, #0x1d0
	beq _02333DE0
	b _02333F90
_02333578:
	add r0, r1, #0xea
	cmp r2, r0
	bgt _023335C0
	bge _02333F24
	cmp r2, #0x1ec
	bgt _023335A0
	bge _02333DF8
	cmp r2, #0x1e0
	beq _02333B84
	b _02333F90
_023335A0:
	add r0, r1, #0xe4
	cmp r2, r0
	bgt _023335B4
	beq _02333F10
	b _02333F90
_023335B4:
	cmp r2, #0x1f0
	beq _02333B84
	b _02333F90
_023335C0:
	rsb r0, r1, #0x320
	cmp r2, r0
	bgt _023335EC
	bge _023336D8
	cmp r2, #0x208
	bgt _023335E0
	beq _02333F38
	b _02333F90
_023335E0:
	cmp r2, #0x214
	beq _02333F6C
	b _02333F90
_023335EC:
	cmp r2, #0x21c
	bgt _023335FC
	beq _023336EC
	b _02333F90
_023335FC:
	ldr r0, =0x0000021E
	cmp r2, r0
	beq _02333F80
	b _02333F90
_0233360C:
	bl GetApparentWeather
	cmp r0, #5
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333620:
	ldrb r0, [r3, #0xd2]
	cmp r0, #0xc
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333634:
	ldrb r0, [r3, #0xd5]
	cmp r0, #4
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333648:
	mov r0, r4
	bl MirrorMoveIsActive
	cmp r0, #0
	beq _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333660:
	ldrsh r0, [r3, #0x24]
	cmp r0, #0x13
	ble _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333674:
	ldrsh r0, [r3, #0x24]
	cmp r0, #0x13
	bgt _023336A8
	add r0, r3, #0x100
	ldrh r1, [r0, #0x46 + STATUS_CHECKER_CHECK_OFFSET]
	sub r2, sp, #4
	strh r1, [r2]
	ldrh r0, [r0, #0x48 + STATUS_CHECKER_CHECK_OFFSET]
	strh r0, [r2, #2]
	ldr r0, [r2]
	bl CeilFixedPoint
	cmp r0, #1
	bge _02333F90
_023336A8:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_023336B0:
	ldrsh r0, [r3, #0x28]
	cmp r0, #0x13
	ble _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_023336C4:
	ldrsh r0, [r3, #0x2a]
	cmp r0, #0x13
	ble _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_023336D8:
	ldrb r0, [r3, #0xd2]
	cmp r0, #1
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_023336EC:
	ldr r0, [r3, #0x110 + STATUS_CHECKER_CHECK_OFFSET]
	cmp r0, #3
	ble _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333700:
	ldrb r0, [r3, #0xec]
	cmp r0, #1
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333714:
	ldrsh r0, [r3, #0x28]
	cmp r0, #0x13
	ldrgtsh r0, [r3, #0x2a]
	cmpgt r0, #0x13
	ble _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333730:
	ldrb r0, [r3, #0xd5]
	cmp r0, #9
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333744:
	ldrb r0, [r3, #0xd2]
	cmp r0, #0xb
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333758:
	bl MistIsActive
	cmp r0, #0
	beq _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0233376C:
	ldrb r0, [r3, #0xd5]
	cmp r0, #3
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333780:
	ldrsh r0, [r3, #0x2e]
	cmp r0, #0x13
	ble _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333794:
	ldrb r0, [r3, #0xc4]
	cmp r0, #5
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldrsh r4, [r3, #0x12]
	ldrsh r2, [r3, #0x16]
	rsb r0, r1, #0x4f0
	ldrsh r1, [r3, #0x10]
	add r2, r4, r2
	cmp r2, r0
	movgt r2, r0
	add r0, r2, r2, lsr #31
	cmp r1, r0, asr #1
	ble _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_023337D4:
	ldrsh r4, [r3, #0x12]
	ldrsh r2, [r3, #0x16]
	rsb r0, r1, #0x4f0
	add r2, r4, r2
	cmp r2, r0
	movgt r2, r0
	ldrsh r0, [r3, #0x10]
	cmp r2, r0
	ble _02333804
	ldrb r0, [r3, #0x11e + STATUS_CHECKER_CHECK_OFFSET]
	cmp r0, #0
	bne _02333F90
_02333804:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0233380C:
	ldrb r0, [r3, #0x11e + STATUS_CHECKER_CHECK_OFFSET]
	cmp r0, #0
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333820:
	ldrb r0, [r3, #0xec]
	cmp r0, #3
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333834:
	ldrsh r0, [r3, #0x24]
	cmp r0, #0x13
	ldrgtsh r0, [r3, #0x28]
	cmpgt r0, #0x13
	ble _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333850:
	ldr r1, =DUNGEON_PTR
	mov r2, #0xc
	ldr r1, [r1]
	ldr r3, =ov10_022C6322
	add r1, r1, #0x4000
#ifdef JAPAN
	ldrsh r1, [r1, #0x30]
#else
	ldrsh r1, [r1, #0xd4]
#endif
	smulbb r1, r1, r2
	ldrb r1, [r3, r1]
	bl MonsterIsType
	cmp r0, #0
	beq _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333884:
	ldrsh r0, [r3, #0x26]
	cmp r0, #0x13
	ble _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333898:
	ldrb r0, [r3, #0xe0]
	cmp r0, #2
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_023338AC:
	ldrb r0, [r3, #0xd5]
	cmp r0, #8
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_023338C0:
	ldrb r0, [r3, #0xd5]
	cmp r0, #1
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_023338D4:
	ldrsh r0, [r3, #0x24]
	cmp r0, #0x13
	ldrgt r0, [r3, #0x110 + STATUS_CHECKER_CHECK_OFFSET]
	cmpgt r0, #3
	ble _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_023338F0:
	ldrb r0, [r3, #0xd5]
	cmp r0, #5
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333904:
	ldrb r0, [r3, #0xd5]
	cmp r0, #7
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333918:
	bl GetApparentWeather
	cmp r0, #4
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0233392C:
	bl GetApparentWeather
	cmp r0, #2
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333940:
	bl GetApparentWeather
	cmp r0, #1
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333954:
	ldrb r0, [r3, #0xd5]
	cmp r0, #2
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333968:
	ldrb r0, [r3, #0xef]
	cmp r0, #1
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0233397C:
	ldrb r0, [r3, #0xec]
	cmp r0, #4
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333990:
	ldrb r0, [r3, #0x62]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_023339B0:
	bl ov29_023007DC
	cmp r0, #0
	bne _02333F90
	mov r0, r4
	mov r1, #0
	bl MonsterHasNegativeStatus
	cmp r0, #0
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_023339D8:
	bl GetTileAtEntity
	bl IsTileGround
	cmp r0, #0
	beq _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_023339F0:
	bl GetTileAtEntity
	mov r4, r0
	bl IsTileGround
	cmp r0, #0
	beq _02333A14
	ldrh r0, [r4]
	and r0, r0, #3
	cmp r0, #1
	beq _02333F90
_02333A14:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333A1C:
	bl GetTileAtEntity
	ldr r0, [r0, #0x10]
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r0, [r0]
	cmp r0, #2
	beq _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333A44:
	ldr r0, =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0xc000
	ldrb r0, [r0, #0xd5b + STATUS_CHECKER_CHECK_OFFSET_2]
	cmp r0, #0
	beq _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333A64:
	ldr r0, =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0xc000
	ldrb r0, [r0, #0xd5c + STATUS_CHECKER_CHECK_OFFSET_2]
	cmp r0, #0
	beq _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333A84:
	ldrb r0, [r3, #0xfd]
	cmp r0, #0
	beq _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333A98:
	ldr r0, =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x3000
	ldrb r0, [r0, #0xe38 + STATUS_CHECKER_CHECK_OFFSET_2]
	cmp r0, #0
	beq _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333AB8:
	ldrb r0, [r3, #0x11e + STATUS_CHECKER_CHECK_OFFSET]
	cmp r0, #3
	blo _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333ACC:
	ldrb r0, [r3, #0x62]
	tst r0, #1
	movne r1, #1
	moveq r1, #0
	tst r1, #0xff
	beq _02333F90
	tst r0, #8
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333B00:
	ldrsh r0, [r3, #0x2e]
	cmp r0, #0x14
	blt _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333B14:
	ldrsh r0, [r3, #0x26]
	cmp r0, #0x14
	blt _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333B28:
	ldrsh r0, [r3, #0x24]
	cmp r0, #0x14
	blt _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333B3C:
	ldrb r0, [r3, #6]
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	ldrb r0, [r3, #0xd5]
	cmp r0, #6
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333B60:
	ldrb r0, [r3, #0xef]
	cmp r0, #2
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	bl IsCurrentFixedRoomBossFight
	cmp r0, #0
	beq _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333B84:
	add r0, r4, #4
	bl CanLayTrap
	cmp r0, #0
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333B9C:
	ldrsh r0, [r3, #0x26]
	cmp r0, #0x14
	ldrgesh r0, [r3, #0x2a]
	cmpge r0, #0x14
	blt _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333BB8:
	ldrb r0, [r3, #0xd8]
	cmp r0, #3
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333BCC:
	bl IsCurrentFixedRoomBossFight
	cmp r0, #0
	beq _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333BE0:
	bl Conversion2IsActive
	cmp r0, #0
	beq _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333BF4:
	ldrb r0, [r3, #6]
	mov r5, #0
	cmp r0, #0
	beq _02333C78
	ldr r6, =DUNGEON_PTR
	b _02333C60
_02333C0C:
	ldr r0, [r6]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
	ldr r7, [r0, #0xb38 + STATUS_CHECKER_CHECK_OFFSET_2]
	mov r0, r7
	bl EntityIsValid__02333FAC
	cmp r0, #0
	cmpne r7, r4
	beq _02333C5C
	mov r0, r4
	mov r1, r7
	bl CanSeeTarget
	cmp r0, #0
	beq _02333C5C
	ldr r1, [r7, #0xb4]
	ldrsh r0, [r1, #0x24]
	cmp r0, #0x14
	ldrltsh r0, [r1, #0x26]
	cmplt r0, #0x14
	blt _02333C68
_02333C5C:
	add r5, r5, #1
_02333C60:
	cmp r5, #0x10
	blt _02333C0C
_02333C68:
	cmp r5, #0x10
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333C78:
	ldr r6, =DUNGEON_PTR
	b _02333CD4
_02333C80:
	ldr r0, [r6]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
	ldr r7, [r0, #0xb28 + STATUS_CHECKER_CHECK_OFFSET_2]
	mov r0, r7
	bl EntityIsValid__02333FAC
	cmp r0, #0
	cmpne r7, r4
	beq _02333CD0
	mov r0, r4
	mov r1, r7
	bl CanSeeTarget
	cmp r0, #0
	beq _02333CD0
	ldr r1, [r7, #0xb4]
	ldrsh r0, [r1, #0x24]
	cmp r0, #0x14
	ldrltsh r0, [r1, #0x26]
	cmplt r0, #0x14
	blt _02333CDC
_02333CD0:
	add r5, r5, #1
_02333CD4:
	cmp r5, #4
	blt _02333C80
_02333CDC:
	cmp r5, #4
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333CEC:
	ldrb r0, [r3, #0xd5]
	cmp r0, #0x10
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333D00:
	ldrb r0, [r3, #6]
	mov r5, #0
	cmp r0, #0
	beq _02333D78
	ldr r6, =DUNGEON_PTR
	b _02333D60
_02333D18:
	ldr r0, [r6]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
	ldr r7, [r0, #0xb38 + STATUS_CHECKER_CHECK_OFFSET_2]
	mov r0, r7
	bl EntityIsValid__02333FAC
	cmp r0, #0
	cmpne r7, r4
	beq _02333D5C
	mov r0, r4
	mov r1, r7
	bl CanSeeTarget
	cmp r0, #0
	ldrne r0, [r7, #0xb4]
	ldrneb r0, [r0, #0xd5]
	cmpne r0, #0x11
	bne _02333D68
_02333D5C:
	add r5, r5, #1
_02333D60:
	cmp r5, #0x10
	blt _02333D18
_02333D68:
	cmp r5, #0x10
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333D78:
	ldr r6, =DUNGEON_PTR
	b _02333DC8
_02333D80:
	ldr r0, [r6]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
	ldr r7, [r0, #0xb28 + STATUS_CHECKER_CHECK_OFFSET_2]
	mov r0, r7
	bl EntityIsValid__02333FAC
	cmp r0, #0
	cmpne r7, r4
	beq _02333DC4
	mov r0, r4
	mov r1, r7
	bl CanSeeTarget
	cmp r0, #0
	ldrne r0, [r7, #0xb4]
	ldrneb r0, [r0, #0xd5]
	cmpne r0, #0x11
	bne _02333DD0
_02333DC4:
	add r5, r5, #1
_02333DC8:
	cmp r5, #4
	blt _02333D80
_02333DD0:
	cmp r5, #4
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333DE0:
	mov r1, #0
	bl MonsterHasNegativeStatus
	cmp r0, #0
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333DF8:
	ldrb r0, [r3, #6]
	mov r5, #0
	cmp r0, #0
	beq _02333E8C
	ldr r6, =DUNGEON_PTR
	b _02333E74
_02333E10:
	ldr r0, [r6]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
	ldr r7, [r0, #0xb38 + STATUS_CHECKER_CHECK_OFFSET_2]
	mov r0, r7
	bl EntityIsValid__02333FAC
	cmp r0, #0
	cmpne r7, r4
	beq _02333E70
	mov r0, r4
	mov r1, r7
	bl CanSeeTarget
	cmp r0, #0
	beq _02333E70
	ldr r1, [r7, #0xb4]
	ldrsh r0, [r1, #0x24]
	cmp r0, #0x14
	ldrgesh r0, [r1, #0x28]
	cmpge r0, #0x14
	ldrgesh r0, [r1, #0x26]
	cmpge r0, #0x14
	ldrgesh r0, [r1, #0x2a]
	cmpge r0, #0x14
	blt _02333E7C
_02333E70:
	add r5, r5, #1
_02333E74:
	cmp r5, #0x10
	blt _02333E10
_02333E7C:
	cmp r5, #0x10
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333E8C:
	ldr r6, =DUNGEON_PTR
	b _02333EF8
_02333E94:
	ldr r0, [r6]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
	ldr r7, [r0, #0xb28 + STATUS_CHECKER_CHECK_OFFSET_2]
	mov r0, r7
	bl EntityIsValid__02333FAC
	cmp r0, #0
	cmpne r7, r4
	beq _02333EF4
	mov r0, r4
	mov r1, r7
	bl CanSeeTarget
	cmp r0, #0
	beq _02333EF4
	ldr r1, [r7, #0xb4]
	ldrsh r0, [r1, #0x24]
	cmp r0, #0x14
	ldrgesh r0, [r1, #0x28]
	cmpge r0, #0x14
	ldrgesh r0, [r1, #0x26]
	cmpge r0, #0x14
	ldrgesh r0, [r1, #0x2a]
	cmpge r0, #0x14
	blt _02333F00
_02333EF4:
	add r5, r5, #1
_02333EF8:
	cmp r5, #4
	blt _02333E94
_02333F00:
	cmp r5, #4
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333F10:
	ldrb r0, [r3, #0xf7]
	cmp r0, #1
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333F24:
	ldr r0, [r3, #0x110 + STATUS_CHECKER_CHECK_OFFSET]
	cmp r0, #1
	ble _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333F38:
	mov r1, #0
	b _02333F54
_02333F40:
	add r0, r3, r1, lsl #1
	ldrsh r0, [r0, #0x28]
	cmp r0, #0x14
	blt _02333F5C
	add r1, r1, #1
_02333F54:
	cmp r1, #2
	blt _02333F40
_02333F5C:
	cmp r1, #2
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333F6C:
	ldrb r0, [r3, #0xd5]
	cmp r0, #0xf
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333F80:
	ldrsh r0, [r3, #0x26]
	cmp r0, #0x14
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
_02333F90:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
}
#endif

bool8 EntityIsValid__02333FAC(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return GetEntityType(entity) != ENTITY_NOTHING;
}

// https://decomp.me/scratch/t6Dx2
#ifdef NONMATCHING
bool8 StatusCheckerCheckOnTarget(struct entity *attacker, struct entity *target, struct move *move)
{
    struct monster *user_data = GetEntInfo(attacker);
    struct monster *target_data = GetEntInfo(target);
    if (target_data->frozen_class_status.freeze == STATUS_FROZEN_FROZEN && IsThawingMove(move))
        return FALSE;

    s32 i;
    switch (move->id)
    {
        case MOVE_DARK_VOID:
        case MOVE_GRASSWHISTLE:
        case MOVE_HYPNOSIS:
        case MOVE_LOVELY_KISS:
        case MOVE_SING:
        case MOVE_SLEEP_POWDER:
        case MOVE_SPORE:
            if (IsMonsterSleeping(target))
                return FALSE;
            break;
        case MOVE_YAWN:
            if (target_data->sleep_class_status.sleep == STATUS_YAWNING)
                return FALSE;
            if (IsMonsterSleeping(target))
                return FALSE;
            break;
        case MOVE_NIGHTMARE:
            if (target_data->sleep_class_status.sleep == STATUS_NIGHTMARE)
                return FALSE;
            break;
        case MOVE_DEFOG:
        case MOVE_SWEET_SCENT:
            if (target_data->stat_modifiers.hit_chance_stages[STAT_STAGE_EVASION] < 1)
                return FALSE;
            break;
        case MOVE_CHARM:
            if (F248LessThanFloat(target_data->stat_modifiers.offensive_multipliers[STAT_STAGE_ATK], STAT_MULTIPLIER_THRESHOLD))
                return FALSE;
            break;
        case MOVE_ENCORE:
            if (target_data->cringe_class_status.cringe == STATUS_CRINGE_ENCORE)
                return FALSE;
            if (!HasLastUsedMove(target_data->moves.moves))
                return FALSE;
            break;
        case MOVE_SUPER_FANG:
            if (target_data->hp < 2)
                return FALSE;
            break;
        case MOVE_PAIN_SPLIT:
            if (target_data->hp <= user_data->hp)
                return FALSE;
            break;
        case MOVE_TORMENT:
            bool8 has_disabled_move = FALSE;
            for (i = 0; i < MAX_MON_MOVES; i++)
            {
                struct move *move = &target_data->moves.moves[i];
                if (MoveExists(move) &&
                    move->flags0 & MOVE_FLAG_DISABLED)
                {
                    has_disabled_move = TRUE;
                    goto end_has_disabled_move;
                }
            }
            if (target_data->moves.struggle_move_flags & MOVE_FLAG_DISABLED)
                has_disabled_move = TRUE;
            else
                has_disabled_move = FALSE;
            end_has_disabled_move:

            if (has_disabled_move)
                return FALSE;

            if (!HasLastUsedMove(target_data->moves.moves))
                return FALSE;
            break;
        case MOVE_COTTON_SPORE:
        case MOVE_SCARY_FACE:
        case MOVE_STRING_SHOT:
            if (GetEntInfo(target)->speed_stage < 1)
                return FALSE;
            break;
        case MOVE_SCREECH:
            if (F248LessThanFloat(target_data->stat_modifiers.defensive_multipliers[STAT_STAGE_DEF], STAT_MULTIPLIER_THRESHOLD))
                return FALSE;
            break;
        case MOVE_FAKE_TEARS:
            if (target_data->stat_modifiers.defensive_stages[STAT_STAGE_SP_DEF] < 1)
                return FALSE;
            break;
        case MOVE_SPITE:
            bool8 last_used_move_out_of_pp;
            for (i = 0; i < MAX_MON_MOVES; i++)
            {
                struct move *move = &target_data->moves.moves[i];
                if (MoveExists(move) &&
                    move->flags0 & MOVE_FLAG_LAST_USED &&
                    move->pp == 0)
                {
                    last_used_move_out_of_pp = TRUE;
                    goto end_last_use_move_out_of_pp;
                }
            }
            last_used_move_out_of_pp = FALSE;

            end_last_use_move_out_of_pp:
            if (last_used_move_out_of_pp)
                return FALSE;
            break;
        case MOVE_SMOKESCREEN:
            if (target_data->sure_shot_class_status.sure_shot == STATUS_SURE_SHOT_WHIFFER)
                return FALSE;
            break;
        case MOVE_MEMENTO:
            if (F248LessThanFloat(target_data->stat_modifiers.offensive_multipliers[STAT_STAGE_ATK], STAT_MULTIPLIER_THRESHOLD) &&
                F248LessThanFloat(target_data->stat_modifiers.offensive_multipliers[STAT_STAGE_SP_ATK], STAT_MULTIPLIER_THRESHOLD))
                return FALSE;
            break;
        case MOVE_WILL_O_WISP:
            if (target_data->burn_class_status.burn == STATUS_BURN)
                return FALSE;
            break;
        case MOVE_FORESIGHT:
        case MOVE_ODOR_SLEUTH:
            if (target_data->types[0] == TYPE_GHOST || target_data->types[1] == TYPE_GHOST)
            {
                if (!target_data->exposed)
                    return TRUE;
            }
            if (target_data->stat_modifiers.hit_chance_stages[STAT_STAGE_EVASION] <= DEFAULT_STAT_STAGE)
                return FALSE;
            break;
        case MOVE_DISABLE:
        case MOVE_GLARE:
        case MOVE_STUN_SPORE:
        case MOVE_THUNDER_WAVE:
            if (target_data->burn_class_status.burn == STATUS_BURN_PARALYSIS)
                return FALSE;
            break;
        case MOVE_ENDEAVOR:
            if (target_data->hp - user_data->hp < 1)
                return FALSE;
            break;
        case MOVE_LEER:
        case MOVE_TAIL_WHIP:
            if (target_data->stat_modifiers.defensive_stages[STAT_STAGE_DEF] < 1)
                return FALSE;
            break;
        case MOVE_METAL_SOUND:
            if (target_data->stat_modifiers.defensive_stages[STAT_STAGE_SP_DEF] < 1)
                return FALSE;
            break;
        case MOVE_TICKLE:
            if (target_data->stat_modifiers.offensive_stages[STAT_STAGE_ATK] < 1 &&
                target_data->stat_modifiers.defensive_stages[STAT_STAGE_DEF] < 1)
                return FALSE;
            break;
        case MOVE_BLOCK:
        case MOVE_MEAN_LOOK:
        case MOVE_SPIDER_WEB: // Remove?
            if (target_data->frozen_class_status.freeze == STATUS_FROZEN_SHADOW_HOLD)
                return FALSE;
            break;
        case MOVE_HAZE:
            for (i = 0; i < 2; i++)
            {
                if (target_data->stat_modifiers.offensive_stages[i] < DEFAULT_STAT_STAGE)
                    break;
                if (target_data->stat_modifiers.defensive_stages[i] < DEFAULT_STAT_STAGE)
                    break;
                if (target_data->stat_modifiers.hit_chance_stages[i] < DEFAULT_STAT_STAGE ||
                    F248LessThanInt(target_data->stat_modifiers.offensive_multipliers[i], 1) ||
                    F248LessThanInt(target_data->stat_modifiers.defensive_multipliers[i], 1))
                    break;
            }
            if (i == 2)
                return FALSE;
            break;
        case MOVE_UPROAR:
        case MOVE_WORRY_SEED:
            if (target_data->sleep_class_status.sleep == STATUS_SLEEPLESS)
                return FALSE;
            break;
        case MOVE_PSYCH_UP:
            for (i = 0; i < 2; i++)
            {
                if (user_data->stat_modifiers.offensive_stages[i] < target_data->stat_modifiers.offensive_stages[i])
                    break;
                if (user_data->stat_modifiers.defensive_stages[i] < target_data->stat_modifiers.defensive_stages[i] ||
                    user_data->stat_modifiers.hit_chance_stages[i] < target_data->stat_modifiers.hit_chance_stages[i] ||
                    user_data->stat_modifiers.offensive_multipliers[i] < target_data->stat_modifiers.offensive_multipliers[i] ||
                    user_data->stat_modifiers.defensive_multipliers[i] < target_data->stat_modifiers.defensive_multipliers[i])
                    break;
            }
            if (i == 2)
                return FALSE;
            break;
        case MOVE_FLASH:
        case MOVE_KINESIS: // Remove?
        case MOVE_SAND_ATTACK:
            if (target_data->stat_modifiers.hit_chance_stages[STAT_STAGE_ACCURACY] < 1)
                return FALSE;
            break;
        case MOVE_TAUNT:
            if (target_data->cringe_class_status.cringe == STATUS_CRINGE_TAUNTED)
                return FALSE;
            break;
        case MOVE_SWITCHEROO:
        case MOVE_TRICK:
            if (!ItemExists(user_data->held_item.flags))
                return FALSE;
            if (!ItemExists(target_data->held_item.flags))
                return FALSE;
            break;
        case MOVE_KNOCK_OFF:
            if (!ItemExists(target_data->held_item.flags))
                return FALSE;
            break;
        case MOVE_FEATHERDANCE:
        case MOVE_GROWL:
            if (target_data->stat_modifiers.offensive_stages[STAT_STAGE_ATK] < 1)
                return FALSE;
            break;
        case MOVE_ROLE_PLAY:
            if (user_data->abilities[0] == target_data->abilities[0] &&
                user_data->abilities[1] == target_data->abilities[1])
                return FALSE;
            break;
        case MOVE_CURSE:
            if (MonsterIsType(attacker, TYPE_GHOST))
            {
                if (target_data->curse_class_status.curse == STATUS_CURSE_CURSED)
                    return FALSE;
            }
            else if (user_data->stat_modifiers.offensive_stages[STAT_STAGE_ATK] > MAX_STAT_STAGE - 1 &&
                     user_data->stat_modifiers.defensive_stages[STAT_STAGE_DEF] > MAX_STAT_STAGE - 1)
                return FALSE;
            break;
        case MOVE_IMPRISON:
        case MOVE_OBSERVER:
            if (target_data->cringe_class_status.cringe == STATUS_CRINGE_PAUSED)
                return FALSE;
            break;
        case MOVE_FALSE_SWIPE:
            if (target_data->hp < 2)
                return FALSE;
            break;
        case MOVE_LEECH_SEED:
            if (target_data->leech_seed_class_status.leech_seed == STATUS_LEECH_SEED_LEECH_SEED)
                return FALSE;
            break;
        case MOVE_PERISH_SONG:
            if (target_data->perish_song_turns != 0)
                return FALSE;
            break;
        case MOVE_COPYCAT:
        case MOVE_MIMIC:
        case MOVE_SKETCH: // Remove?
            if (!HasLastUsedMove(target_data->moves.moves))
                return FALSE;
            break;
        case MOVE_ATTRACT:
            if (target_data->cringe_class_status.cringe == STATUS_CRINGE_INFATUATED)
                return FALSE;
            break;
        case MOVE_WRAP:
            if (target_data->frozen_class_status.freeze == STATUS_FROZEN_WRAP)
                return FALSE;
            if (target_data->frozen_class_status.freeze == STATUS_FROZEN_WRAPPED)
                return FALSE;
            break;
        case MOVE_TOXIC:
            if (target_data->burn_class_status.burn == STATUS_BURN_BADLY_POISONED)
                return FALSE;
            break;
        case MOVE_POISON_GAS:
        case MOVE_POISONPOWDER:
            if (target_data->burn_class_status.burn == STATUS_BURN_POISONED)
                return FALSE;
            if (target_data->burn_class_status.burn == STATUS_BURN_BADLY_POISONED)
                return FALSE;
            break;
        case MOVE_CONFUSE_RAY:
        case MOVE_FLATTER:
        case MOVE_SUPERSONIC:
        case MOVE_SWAGGER:
        case MOVE_SWEET_KISS:
        case MOVE_TEETER_DANCE:
        case MOVE_TOTTER:
            if (target_data->cringe_class_status.cringe == STATUS_CRINGE_CONFUSED)
                return FALSE;
            break;
        case MOVE_GASTRO_ACID:
            if (target_data->curse_class_status.curse == STATUS_CURSE_GASTRO_ACID)
                return FALSE;
            break;
        case MOVE_HEALING_WISH:
            if (target_data->curse_class_status.curse == STATUS_CURSE_GASTRO_ACID)
                return FALSE;
            break;
        case MOVE_LUCKY_CHANT:
            if (target_data->reflect_class_status.reflect == STATUS_REFLECT_LUCKY_CHANT)
                return FALSE;
            break;
        case MOVE_GUARD_SWAP:
            if (user_data->stat_modifiers.defensive_stages[STAT_STAGE_DEF] + user_data->stat_modifiers.defensive_stages[STAT_STAGE_SP_DEF] >=
                target_data->stat_modifiers.defensive_stages[STAT_STAGE_DEF] + target_data->stat_modifiers.defensive_stages[STAT_STAGE_SP_DEF])
                return FALSE;
            break;
        case MOVE_HEAL_BLOCK:
            if (target_data->curse_class_status.curse == STATUS_CURSE_HEAL_BLOCK)
                return FALSE;
            break;
        case MOVE_EMBARGO:
            if (target_data->curse_class_status.curse == STATUS_CURSE_EMBARGO)
                return FALSE;
            break;
        case MOVE_GRAVITY:
            if (GravityIsActive())
                return FALSE;
            break;
        case MOVE_ACUPRESSURE:
            for (i = 0; i < NUM_STATS_PER_CATEGORY; i++)
            {
                if (target_data->stat_modifiers.offensive_stages[i] < MAX_STAT_STAGE ||
                    target_data->stat_modifiers.defensive_stages[i] < MAX_STAT_STAGE)
                    break;
            }
            if (i == NUM_STATS_PER_CATEGORY)
                return FALSE;
            break;
        case MOVE_MAGNET_RISE:
            if (target_data->magnet_rise == TRUE)
                return FALSE;
            break;
        case MOVE_HEART_SWAP:
            s16 user_offensive_stages =
                user_data->stat_modifiers.offensive_stages[STAT_STAGE_ATK] +
                user_data->stat_modifiers.offensive_stages[STAT_STAGE_SP_ATK];
            s16 user_defensive_stages =
                user_data->stat_modifiers.defensive_stages[STAT_STAGE_DEF] +
                user_data->stat_modifiers.defensive_stages[STAT_STAGE_SP_DEF];
            s16 target_offensive_stages =
                target_data->stat_modifiers.offensive_stages[STAT_STAGE_ATK] +
                target_data->stat_modifiers.offensive_stages[STAT_STAGE_SP_ATK];
            s16 target_defensive_stages =
                target_data->stat_modifiers.defensive_stages[STAT_STAGE_DEF] +
                target_data->stat_modifiers.defensive_stages[STAT_STAGE_SP_DEF];
            if (user_offensive_stages + user_defensive_stages >= target_offensive_stages + target_defensive_stages)
                return FALSE;
            break;
        case MOVE_POWER_SWAP:
            if (user_data->stat_modifiers.offensive_stages[STAT_STAGE_ATK] + user_data->stat_modifiers.offensive_stages[STAT_STAGE_SP_ATK] >=
                target_data->stat_modifiers.offensive_stages[STAT_STAGE_ATK] + target_data->stat_modifiers.offensive_stages[STAT_STAGE_SP_ATK])
                return FALSE;
            break;
        case MOVE_POWER_TRICK:
            if (user_data->stat_modifiers.offensive_stages[STAT_STAGE_ATK] >= user_data->stat_modifiers.defensive_stages[STAT_STAGE_DEF])
                return FALSE;
            break;
        case MOVE_MIRACLE_EYE:
            if (target_data->types[0] == TYPE_DARK || target_data->types[1] == TYPE_DARK)
            {
                if (target_data->miracle_eye == TRUE && target_data->stat_modifiers.hit_chance_stages[STAT_STAGE_EVASION] <= DEFAULT_STAT_STAGE)
                    return FALSE;
            }
            else if (target_data->stat_modifiers.hit_chance_stages[STAT_STAGE_EVASION] <= DEFAULT_STAT_STAGE)
                return FALSE;
            break;
        case MOVE_METAL_BURST:
            if (target_data->reflect_class_status.reflect == STATUS_REFLECT_METAL_BURST)
                return FALSE;
            break;
        case MOVE_CAPTIVATE:
            if (target_data->stat_modifiers.offensive_stages[STAT_STAGE_SP_ATK] == 0)
                return FALSE;
            if (GendersEqualNotGenderless(user_data->id, target_data->id))
                return FALSE;
            break;
    }
    return TRUE;
}
#else
asm bool8 StatusCheckerCheckOnTarget(struct entity *attacker, struct entity *target, struct move *move)
{
#ifdef JAPAN
#define OV29_02333FD0_OFFSET -4
#else
#define OV29_02333FD0_OFFSET 0
#endif
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r6, r1
	ldr r5, [r6, #0xb4]
	mov r7, r0
	ldrb r0, [r5, #0xc4]
	mov r8, r2
	ldr r4, [r7, #0xb4]
	cmp r0, #1
	bne _02334008
	mov r0, r8
	bl IsThawingMove
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
_02334008:
	ldrh r1, [r8, #4]
	ldr r0, =0x0000010A
	cmp r1, r0
	bgt _0233429C
	bge _023349A4
	cmp r1, #0x8a
	bgt _023341C8
	bge _023349F4
	cmp r1, #0x56
	bgt _02334164
	bge _023347B0
	cmp r1, #0x4f
	bgt _02334140
	bge _023344D0
	cmp r1, #0x3b
	bgt _02334134
	bge _0233473C
	cmp r1, #0x36
	addls pc, pc, r1, lsl #2
	b _02334C9C
_02334058:
	b _02334C9C
	b _02334C9C
	b _02334C9C
	b _023344E8
	b _023344D0
	b _02334510
	b _02334C9C
	b _02334C9C
	b _02334C9C
	b _02334C9C
	b _02334524
	b _02334538
	b _02334C9C
	b _02334A74
	b _02334C9C
	b _02334C9C
	b _02334C9C
	b _0233454C
	b _02334C9C
	b _02334C9C
	b _02334574
	b _02334588
	b _023345A0
	b _02334618
	b _02334A74
	b _02334C9C
	b _02334C9C
	b _02334630
	b _02334C9C
	b _02334C9C
	b _02334C9C
	b _02334C9C
	b _02334C9C
	b _02334644
	b _023344D0
	b _02334658
	b _02334C9C
	b _023346C0
	b _02334C9C
	b _02334C9C
	b _02334C9C
	b _02334C9C
	b _02334C9C
	b _023346D4
	b _02334C9C
	b _02334A74
	b _02334C9C
	b _023346F0
	b _02334C9C
	b _02334C9C
	b _02334C9C
	b _02334C9C
	b _02334C9C
	b _02334C9C
	b _02334704
_02334134:
	cmp r1, #0x42
	beq _02334750
	b _02334C9C
_02334140:
	cmp r1, #0x54
	bgt _02334158
	bge _023344D0
	cmp r1, #0x53
	beq _02334780
	b _02334C9C
_02334158:
	cmp r1, #0x55
	beq _02334794
	b _02334C9C
_02334164:
	cmp r1, #0x6f
	bgt _02334194
	bge _023344D0
	cmp r1, #0x59
	bgt _02334188
	bge _023347B0
	cmp r1, #0x58
	beq _023347C4
	b _02334C9C
_02334188:
	cmp r1, #0x6a
	beq _02334618
	b _02334C9C
_02334194:
	cmp r1, #0x73
	bgt _023341AC
	bge _02334830
	cmp r1, #0x70
	beq _0233481C
	b _02334C9C
_023341AC:
	cmp r1, #0x7a
	bgt _023341BC
	beq _0233476C
	b _02334C9C
_023341BC:
	cmp r1, #0x7c
	beq _0233473C
	b _02334C9C
_023341C8:
	cmp r1, #0xc5
	bgt _02334238
	bge _02334A40
	cmp r1, #0xac
	bgt _02334204
	bge _023348B8
	cmp r1, #0x92
	bgt _023341F8
	bge _023348A4
	cmp r1, #0x8e
	beq _023348A4
	b _02334C9C
_023341F8:
	cmp r1, #0xab
	beq _02334A74
	b _02334C9C
_02334204:
	cmp r1, #0xc0
	bgt _0233421C
	bge _0233473C
	cmp r1, #0xbf
	beq _02334A74
	b _02334C9C
_0233421C:
	cmp r1, #0xc2
	bgt _0233422C
	beq _023347B0
	b _02334C9C
_0233422C:
	cmp r1, #0xc4
	beq _02334A54
	b _02334C9C
_02334238:
	cmp r1, #0xdc
	bgt _02334268
	bge _0233493C
	cmp r1, #0xd1
	bgt _0233425C
	bge _023348CC
	cmp r1, #0xc7
	beq _02334A54
	b _02334C9C
_0233425C:
	cmp r1, #0xd9
	beq _02334928
	b _02334C9C
_02334268:
	cmp r1, #0xe7
	bgt _02334280
	bge _023344D0
	cmp r1, #0xe0
	beq _0233476C
	b _02334C9C
_02334280:
	cmp r1, #0xed
	bgt _02334290
	beq _02334960
	b _02334C9C
_02334290:
	cmp r1, #0xf9
	beq _02334908
	b _02334C9C
_0233429C:
	add r2, r0, #0xb5
	cmp r1, r2
	bgt _023343B8
	bge _02334AB0
	add r2, r0, #0x31
	cmp r1, r2
	bgt _0233432C
	bge _02334704
	add r2, r0, #0xf
	cmp r1, r2
	bgt _023342FC
	bge _0233473C
	add r2, r0, #7
	cmp r1, r2
	bgt _023342EC
	bge _023348A4
	add r0, r0, #1
	cmp r1, r0
	beq _02334928
	b _02334C9C
_023342EC:
	add r0, r0, #8
	cmp r1, r0
	beq _02334A74
	b _02334C9C
_023342FC:
	add r2, r0, #0x1c
	cmp r1, r2
	bgt _0233431C
	bge _02334A20
	add r0, r0, #0x1b
	cmp r1, r0
	beq _023349E0
	b _02334C9C
_0233431C:
	add r0, r0, #0x30
	cmp r1, r0
	beq _023349B8
	b _02334C9C
_0233432C:
	add r2, r0, #0x55
	cmp r1, r2
	bgt _0233436C
	bge _02334618
	add r2, r0, #0x3d
	cmp r1, r2
	bgt _0233435C
	bge _023349F4
	add r0, r0, #0x3c
	cmp r1, r0
	beq _02334A0C
	b _02334C9C
_0233435C:
	add r0, r0, #0x3f
	cmp r1, r0
	beq _023349CC
	b _02334C9C
_0233436C:
	add r2, r0, #0x74
	cmp r1, r2
	bgt _0233438C
	bge _02334A74
	add r0, r0, #0x71
	cmp r1, r0
	beq _023349A4
	b _02334C9C
_0233438C:
	add r2, r0, #0xac
	cmp r1, r2
	bgt _023343A8
	add r0, r0, #0xac
	cmp r1, r0
	beq _02334A88
	b _02334C9C
_023343A8:
	add r0, r0, #0xad
	cmp r1, r0
	beq _02334A9C
	b _02334C9C
_023343B8:
	add r2, r0, #0xe3
	cmp r1, r2
	bgt _02334450
	bge _02334B64
	add r2, r0, #0xc8
	cmp r1, r2
	bgt _02334408
	bge _02334B00
	add r2, r0, #0xb8
	cmp r1, r2
	bgt _023343FC
	add r0, r0, #0xb8
	cmp r1, r0
	bge _02334AEC
	cmp r1, #0x1c0
	beq _02334AC4
	b _02334C9C
_023343FC:
	cmp r1, #0x1c8
	beq _02334524
	b _02334C9C
_02334408:
	add r2, r0, #0xd8
	cmp r1, r2
	bgt _02334428
	bge _023348CC
	add r0, r0, #0xd4
	cmp r1, r0
	beq _02334B14
	b _02334C9C
_02334428:
	add r2, r0, #0xd9
	cmp r1, r2
	bgt _02334444
	add r0, r0, #0xd9
	cmp r1, r0
	beq _023344D0
	b _02334C9C
_02334444:
	cmp r1, #0x1ec
	beq _02334B28
	b _02334C9C
_02334450:
	add r2, r0, #0xf8
	cmp r1, r2
	bgt _02334494
	bge _02334C00
	add r2, r0, #0xf0
	cmp r1, r2
	bgt _02334484
	add r0, r0, #0xf0
	cmp r1, r0
	bge _02334B78
	cmp r1, #0x1f8
	beq _0233481C
	b _02334C9C
_02334484:
	add r0, r0, #0xf7
	cmp r1, r0
	beq _02334BD8
	b _02334C9C
_02334494:
	cmp r1, #0x210
	bgt _023344B0
	bge _02334C18
	ldr r0, =0x0000020D
	cmp r1, r0
	beq _023349F4
	b _02334C9C
_023344B0:
	cmp r1, #0x214
	bgt _023344C0
	beq _02334C60
	b _02334C9C
_023344C0:
	add r0, r0, #0x10c
	cmp r1, r0
	beq _02334C74
	b _02334C9C
_023344D0:
	mov r0, r6
	bl IsMonsterSleeping
	cmp r0, #0
	beq _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_023344E8:
	ldrb r0, [r5, #0xbd]
	cmp r0, #4
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	mov r0, r6
	bl IsMonsterSleeping
	cmp r0, #0
	beq _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02334510:
	ldrb r0, [r5, #0xbd]
	cmp r0, #3
	bne _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02334524:
	ldrsh r0, [r5, #0x2e]
	cmp r0, #1
	bge _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02334538:
	ldr r0, [r5, #0x34]
	cmp r0, #0x3f
	bge _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0233454C:
	ldrb r0, [r5, #0xd0]
	cmp r0, #6
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	add r0, r5, #0x124 + OV29_02333FD0_OFFSET
	bl HasLastUsedMove
	cmp r0, #0
	bne _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02334574:
	ldrsh r0, [r5, #0x10]
	cmp r0, #2
	bge _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02334588:
	ldrsh r1, [r5, #0x10]
	ldrsh r0, [r4, #0x10]
	cmp r1, r0
	bgt _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_023345A0:
	mov r3, #0
	mov r0, r3
	mov r1, #1
	b _023345DC
_023345B0:
	add r2, r5, r3, lsl #3
	ldrb r2, [r2, #0x124 + OV29_02333FD0_OFFSET]
	tst r2, #1
	movne r4, r1
	moveq r4, r0
	tst r4, #0xff
	beq _023345D8
	tst r2, #0x20
	movne r0, #1
	bne _023345F4
_023345D8:
	add r3, r3, #1
_023345DC:
	cmp r3, #4
	blt _023345B0
	ldrb r0, [r5, #0x144 + OV29_02333FD0_OFFSET]
	tst r0, #0x20
	movne r0, #1
	moveq r0, #0
_023345F4:
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
	add r0, r5, #0x124 + OV29_02333FD0_OFFSET
	bl HasLastUsedMove
	cmp r0, #0
	bne _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02334618:
	ldr r0, [r6, #0xb4]
	ldr r0, [r0, #0x110 + OV29_02333FD0_OFFSET]
	cmp r0, #1
	bge _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02334630:
	ldr r0, [r5, #0x3c]
	cmp r0, #0x3f
	bge _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02334644:
	ldrsh r0, [r5, #0x2a]
	cmp r0, #1
	bge _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02334658:
	mov r4, #0
	add r3, r5, #0x124 + OV29_02333FD0_OFFSET
	mov r1, r4
	mov r2, #1
	b _023346A4
_0233466C:
	ldrb r5, [r3, r4, lsl #3]
	add r0, r3, r4, lsl #3
	tst r5, #1
	movne r6, r2
	moveq r6, r1
	tst r6, #0xff
	beq _023346A0
	tst r5, #0x10
	beq _023346A0
	ldrb r0, [r0, #6]
	cmp r0, #0
	moveq r0, #1
	beq _023346B0
_023346A0:
	add r4, r4, #1
_023346A4:
	cmp r4, #4
	blt _0233466C
	mov r0, #0
_023346B0:
	cmp r0, #0
	beq _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_023346C0:
	ldrb r0, [r5, #0xec]
	cmp r0, #2
	bne _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_023346D4:
	ldr r0, [r5, #0x34]
	cmp r0, #0x3f
	ldrlt r0, [r5, #0x38]
	cmplt r0, #0x3f
	bge _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_023346F0:
	ldrb r0, [r5, #0xbf]
	cmp r0, #1
	bne _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02334704:
	ldrb r0, [r5, #0x5e]
	cmp r0, #0xe
	ldrneb r0, [r5, #0x5f]
	cmpne r0, #0xe
	bne _02334728
	ldrb r0, [r5, #0xfe]
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
_02334728:
	ldrsh r0, [r5, #0x2e]
	cmp r0, #0xa
	bgt _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0233473C:
	ldrb r0, [r5, #0xbf]
	cmp r0, #4
	bne _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02334750:
	ldrsh r1, [r5, #0x10]
	ldrsh r0, [r4, #0x10]
	sub r0, r1, r0
	cmp r0, #1
	bge _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0233476C:
	ldrsh r0, [r5, #0x28]
	cmp r0, #1
	bge _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02334780:
	ldrsh r0, [r5, #0x2a]
	cmp r0, #1
	bge _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02334794:
	ldrsh r0, [r5, #0x24]
	cmp r0, #1
	ldrltsh r0, [r5, #0x28]
	cmplt r0, #1
	bge _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_023347B0:
	ldrb r0, [r5, #0xc4]
	cmp r0, #2
	bne _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_023347C4:
	mov r2, #0
	b _02334804
_023347CC:
	add r1, r5, r2, lsl #1
	ldrsh r0, [r1, #0x24]
	cmp r0, #0xa
	ldrgesh r0, [r1, #0x28]
	cmpge r0, #0xa
	ldrgesh r0, [r1, #0x2c]
	cmpge r0, #0xa
	addge r1, r5, r2, lsl #2
	ldrge r0, [r1, #0x34]
	cmpge r0, #0x100
	ldrge r0, [r1, #0x3c]
	cmpge r0, #0x100
	blt _0233480C
	add r2, r2, #1
_02334804:
	cmp r2, #2
	blt _023347CC
_0233480C:
	cmp r2, #2
	bne _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0233481C:
	ldrb r0, [r5, #0xbd]
	cmp r0, #2
	bne _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02334830:
	mov r0, #0
	b _0233488C
_02334838:
	add r6, r4, r0, lsl #1
	add r3, r5, r0, lsl #1
	ldrsh r2, [r6, #0x24]
	ldrsh r1, [r3, #0x24]
	cmp r2, r1
	ldrgesh r2, [r6, #0x28]
	ldrgesh r1, [r3, #0x28]
	cmpge r2, r1
	ldrgesh r2, [r6, #0x2c]
	ldrgesh r1, [r3, #0x2c]
	cmpge r2, r1
	addge r6, r4, r0, lsl #2
	addge r3, r5, r0, lsl #2
	ldrge r2, [r6, #0x34]
	ldrge r1, [r3, #0x34]
	cmpge r2, r1
	ldrge r2, [r6, #0x3c]
	ldrge r1, [r3, #0x3c]
	cmpge r2, r1
	blt _02334894
	add r0, r0, #1
_0233488C:
	cmp r0, #2
	blt _02334838
_02334894:
	cmp r0, #2
	bne _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_023348A4:
	ldrsh r0, [r5, #0x2c]
	cmp r0, #1
	bge _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_023348B8:
	ldrb r0, [r5, #0xd0]
	cmp r0, #5
	bne _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_023348CC:
	ldrb r0, [r4, #0x62]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	ldrb r0, [r5, #0x62]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	bne _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02334908:
	ldrb r0, [r5, #0x62]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	bne _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02334928:
	ldrsh r0, [r5, #0x24]
	cmp r0, #1
	bge _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0233493C:
	ldrb r1, [r4, #0x60]
	ldrb r0, [r5, #0x60]
	cmp r1, r0
	ldreqb r1, [r4, #0x61]
	ldreqb r0, [r5, #0x61]
	cmpeq r1, r0
	bne _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02334960:
	mov r0, r7
	mov r1, #0xe
	bl MonsterIsType
	cmp r0, #0
	beq _02334988
	ldrb r0, [r5, #0xd8]
	cmp r0, #1
	bne _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02334988:
	ldrsh r0, [r4, #0x24]
	cmp r0, #0x13
	ldrgtsh r0, [r4, #0x28]
	cmpgt r0, #0x13
	ble _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_023349A4:
	ldrb r0, [r5, #0xd0]
	cmp r0, #3
	bne _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_023349B8:
	ldrsh r0, [r5, #0x10]
	cmp r0, #2
	bge _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_023349CC:
	ldrb r0, [r5, #0xe0]
	cmp r0, #1
	bne _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_023349E0:
#ifdef JAPAN
	ldrb r0, [r5, #0x105]
#else
	ldrb r0, [r5, #0x106]
#endif
	cmp r0, #0
	beq _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_023349F4:
	add r0, r5, #0x124 + OV29_02333FD0_OFFSET
	bl HasLastUsedMove
	cmp r0, #0
	bne _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02334A0C:
	ldrb r0, [r5, #0xd0]
	cmp r0, #7
	bne _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02334A20:
	ldrb r0, [r5, #0xc4]
	cmp r0, #3
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	cmp r0, #4
	bne _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02334A40:
	ldrb r0, [r5, #0xbf]
	cmp r0, #3
	bne _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02334A54:
	ldrb r0, [r5, #0xbf]
	cmp r0, #2
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	cmp r0, #3
	bne _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02334A74:
	ldrb r0, [r5, #0xd0]
	cmp r0, #2
	bne _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02334A88:
	ldrb r0, [r5, #0xd8]
	cmp r0, #4
	bne _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02334A9C:
	ldrb r0, [r5, #0xd8]
	cmp r0, #4
	bne _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02334AB0:
	ldrb r0, [r5, #0xd5]
	cmp r0, #0x11
	bne _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02334AC4:
	ldrsh r3, [r4, #0x28]
	ldrsh r2, [r4, #0x2a]
	ldrsh r1, [r5, #0x28]
	ldrsh r0, [r5, #0x2a]
	add r2, r3, r2
	add r0, r1, r0
	cmp r2, r0
	blt _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02334AEC:
	ldrb r0, [r5, #0xd8]
	cmp r0, #5
	bne _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02334B00:
	ldrb r0, [r5, #0xd8]
	cmp r0, #6
	bne _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02334B14:
	bl GravityIsActive
	cmp r0, #0
	beq _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02334B28:
	mov r2, #0
	b _02334B4C
_02334B30:
	add r1, r5, r2, lsl #1
	ldrsh r0, [r1, #0x24]
	cmp r0, #0x14
	ldrgesh r0, [r1, #0x28]
	cmpge r0, #0x14
	blt _02334B54
	add r2, r2, #1
_02334B4C:
	cmp r2, #2
	blt _02334B30
_02334B54:
	cmp r2, #2
	bne _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02334B64:
	ldrb r0, [r5, #0xf7]
	cmp r0, #1
	bne _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02334B78:
	ldrsh r3, [r4, #0x28]
	ldrsh r1, [r4, #0x2a]
	ldrsh r2, [r5, #0x28]
	ldrsh r0, [r5, #0x2a]
	add r1, r3, r1
	mov r1, r1, lsl #0x10
	add r0, r2, r0
	mov r2, r0, lsl #0x10
	ldrsh r6, [r4, #0x24]
	ldrsh r0, [r4, #0x26]
	ldrsh r4, [r5, #0x24]
	ldrsh r3, [r5, #0x26]
	add r0, r6, r0
	mov r0, r0, lsl #0x10
	add r3, r4, r3
	mov r4, r1, asr #0x10
	mov r1, r3, lsl #0x10
	mov r2, r2, asr #0x10
	add r3, r4, r0, asr #16
	add r0, r2, r1, asr #16
	cmp r3, r0
	blt _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02334BD8:
	ldrsh r3, [r4, #0x24]
	ldrsh r2, [r4, #0x26]
	ldrsh r1, [r5, #0x24]
	ldrsh r0, [r5, #0x26]
	add r2, r3, r2
	add r0, r1, r0
	cmp r2, r0
	blt _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02334C00:
	ldrsh r1, [r4, #0x24]
	ldrsh r0, [r4, #0x28]
	cmp r1, r0
	blt _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02334C18:
	ldrb r0, [r5, #0x5e]
	cmp r0, #0x10
	ldrneb r0, [r5, #0x5f]
	cmpne r0, #0x10
	bne _02334C4C
	ldrb r0, [r5, #0xf5]
	cmp r0, #1
	bne _02334C9C
	ldrsh r0, [r5, #0x2e]
	cmp r0, #0xa
	bgt _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02334C4C:
	ldrsh r0, [r5, #0x2e]
	cmp r0, #0xa
	bgt _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02334C60:
	ldrb r0, [r5, #0xd5]
	cmp r0, #0xf
	bne _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02334C74:
	ldrsh r0, [r5, #0x26]
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	ldrsh r0, [r4, #2]
	ldrsh r1, [r5, #2]
	bl GendersEqualNotGenderless
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
_02334C9C:
	mov r0, #1
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
}
#endif
