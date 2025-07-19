#include "move_checks.h"
#include "dungeon_logic.h"
#include "dungeon_logic_3.h"
#include "dungeon_logic_4.h"
#include "dungeon_map_access_1.h"
#include "dungeon_util_1.h"
#include "dungeon_util_static.h"
#include "dungeon_visibility.h"
#include "inflict_status.h"
#include "number_util.h"
#include "run_dungeon_1.h"
#include "tileset.h"
#include "trap.h"
#include "weather.h"

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
            if (!HasLowHealth(attacker) && !MonsterHasNegativeStatus(attacker, FALSE))
                return FALSE;
            break;
        case MOVE_DIVE:
            if (IsTileGround(GetTileAtEntity(attacker)))
                return FALSE;
            break;
        case MOVE_DIG:
        {
            struct tile *tile = GetTileAtEntity(attacker);
            if (!IsTileGround(tile) || (tile->terrain_flags & (TERRAIN_TYPE_NORMAL | TERRAIN_TYPE_SECONDARY)) != TERRAIN_TYPE_NORMAL)
                return FALSE;
            break;
        }
        case MOVE_TRAP_BUSTER:
        {
            struct entity *object = GetTileAtEntity(attacker)->object;
            if (object == NULL)
                return FALSE;
            if (object->type != ENTITY_TRAP)
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
#endif

bool8 EntityIsValid__02333FAC(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return entity->type != ENTITY_NOTHING;
}
