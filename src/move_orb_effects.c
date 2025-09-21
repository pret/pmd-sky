#include "move_orb_effects.h"
#include "dungeon_pokemon_attributes.h"
#include "dungeon_util_static.h"
#include "overlay_29_023118B4.h"
#include "overlay_29_02311BF8.h"

enum flash_fire_status FlashFireShouldActivate(struct entity *attacker, struct entity *defender)
{
    if (!EntityIsValid__023118B4(defender))
        return FLASH_FIRE_STATUS_NONE;

    if (AbilityIsActiveVeneer(attacker, ABILITY_NORMALIZE))
        return FLASH_FIRE_STATUS_NONE;

#ifdef JAPAN
    if (!DefenderAbilityIsActive__02311B94(attacker, defender, ABILITY_FLASH_FIRE))
#else
    if (!DefenderAbilityIsActive__02311B94(attacker, defender, ABILITY_FLASH_FIRE, TRUE))
#endif
        return FLASH_FIRE_STATUS_NONE;

    if (GetEntInfo(defender)->stat_modifiers.flash_fire_boost >= 2)
        return FLASH_FIRE_STATUS_MAXED;

    return FLASH_FIRE_STATUS_NOT_MAXED;
}
