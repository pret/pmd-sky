#include "overlay_29_0230AB58.h"
#include "dungeon.h"
#include "dungeon_pokemon_attributes.h"
#include "dungeon_util_static.h"

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
