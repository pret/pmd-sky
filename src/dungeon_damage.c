#include "dungeon_damage.h"
#include "dungeon_logic_3.h"
#include "dungeon_pokemon_attributes.h"
#include "dungeon_util_static.h"
#include "overlay_29_02313814.h"
#include "overlay_29_02308FBC.h"
#include "overlay_29_0230A994.h"
#include "overlay_29_0230AB58.h"
#include "overlay_29_02318A4C.h"
#include "type_effectiveness.h"
#include "weather.h"

#define NUM_EFFECTIVENESS 4

s32 WeightWeakTypePicker(struct entity *user, struct entity *target, enum type_id move_type)
{
    s32 weight = 1;
    bool8 check_exposed = FALSE;
    s32 i;
    if (!EntityIsValid__02308FBC(target))
        return 1;

    struct monster *user_data = GetEntInfo(user);
    struct monster *target_data = GetEntInfo(target);
    if (AbilityIsActiveVeneer(user, ABILITY_NORMALIZE))
        move_type = TYPE_NORMAL;

    if (move_type == TYPE_NORMAL || move_type == TYPE_FIGHTING)
        check_exposed = TRUE;

    if (move_type == TYPE_FIRE && GetFlashFireStatus(user, target) != FLASH_FIRE_STATUS_NONE)
        return 0;

#ifdef JAPAN
    if (move_type == TYPE_ELECTRIC && DefenderAbilityIsActive__0230A940(user, target, ABILITY_VOLT_ABSORB))
#else
    if (move_type == TYPE_ELECTRIC && DefenderAbilityIsActive__0230A940(user, target, ABILITY_VOLT_ABSORB, TRUE))
#endif
        return 0;

#ifdef JAPAN
    if (move_type == TYPE_WATER && DefenderAbilityIsActive__0230A940(user, target, ABILITY_WATER_ABSORB))
#else
    if (move_type == TYPE_WATER && DefenderAbilityIsActive__0230A940(user, target, ABILITY_WATER_ABSORB, TRUE))
#endif
        return 0;

    if (move_type == TYPE_GROUND &&
        ((!AbilityIsActiveVeneer(user, ABILITY_MOLD_BREAKER) && LevitateIsActive(target)) || IsFloating(target)))
        return 1;

    bool8 scrappy_active = ScrappyShouldActivate(user, target, move_type);

    for (i = 0; i < 2; i++)
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
    if ((move_type == TYPE_FIRE || move_type == TYPE_ICE) && DefenderAbilityIsActive__0230A940(user, target, ABILITY_THICK_FAT))
#else
    if ((move_type == TYPE_FIRE || move_type == TYPE_ICE) && DefenderAbilityIsActive__0230A940(user, target, ABILITY_THICK_FAT, TRUE))
#endif
        return 2;

    if (move_type == TYPE_WATER && AbilityIsActiveVeneer(user, ABILITY_TORRENT))
    {
        s32 max_hp_stat = MIN(user_data->max_hp_stat + user_data->max_hp_boost, MAX_HP_LIMIT);
        if (max_hp_stat / 4 >= user_data->hp)
            weight *= 2;
    }

    if (move_type == TYPE_GRASS && AbilityIsActiveVeneer(user, ABILITY_OVERGROW))
    {
        s32 max_hp_stat = MIN(user_data->max_hp_stat + user_data->max_hp_boost, MAX_HP_LIMIT);
        if (max_hp_stat / 4 >= user_data->hp)
            weight *= 2;
    }

    if (move_type == TYPE_BUG && AbilityIsActiveVeneer(user, ABILITY_SWARM))
    {
        s32 max_hp_stat = MIN(user_data->max_hp_stat + user_data->max_hp_boost, MAX_HP_LIMIT);
        if (max_hp_stat / 4 >= user_data->hp)
            weight *= 2;
    }

    if (move_type == TYPE_FIRE && AbilityIsActiveVeneer(user, ABILITY_BLAZE))
    {
        s32 max_hp_stat = MIN(user_data->max_hp_stat + user_data->max_hp_boost, MAX_HP_LIMIT);
        if (max_hp_stat / 4 >= user_data->hp)
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
