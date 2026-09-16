#include "overlay_29_0230AB58.h"
#include "dungeon.h"
#include "dungeon_pokemon_attributes.h"
#include "dungeon_util_static.h"
#include "overlay_29_0230A994.h"

extern struct dungeon *DUNGEON_PTR[];

bool8 ScrappyShouldActivate(struct entity *attacker, struct entity *defender, enum type_id attack_type)
{
    for (s16 i = 0; i < 2; i++)
    {
        bool8 scrappy_should_activate;
        struct monster *defender_monster = GetEntInfo(defender);
        if (AbilityIsActiveVeneer(attacker, ABILITY_SCRAPPY) &&
            defender_monster->types[i] == TYPE_GHOST &&
            (attack_type == TYPE_NORMAL || attack_type == TYPE_FIGHTING))
            scrappy_should_activate = TRUE;
        else
            scrappy_should_activate = FALSE;

        if (scrappy_should_activate)
        {
            DUNGEON_PTR[0]->last_damage_calc.scrappy_activated = TRUE;
            return TRUE;
        }
    }
    return FALSE;
}

bool8 IsTypeIneffectiveAgainstGhost(enum type_id type)
{
    if (type == TYPE_NORMAL || type == TYPE_FIGHTING)
        return TRUE;
    return FALSE;
}

bool8 GhostImmunityIsActive(struct entity *attacker, struct entity *defender, s16 target_type_idx)
{
    struct monster *defender_monster = GetEntInfo(defender);
    if (defender_monster->types[target_type_idx] == TYPE_GHOST)
    {
        bool8 ghost_immunity_disabled;
        if (defender_monster->exposed || ExclusiveItemEffectIsActive__0230A9B8(attacker, EXCLUSIVE_EFF_SCRAPPY))
            ghost_immunity_disabled = TRUE;
        else
            ghost_immunity_disabled = FALSE;

        if (!ghost_immunity_disabled)
            return TRUE;
    }
    return FALSE;
}
