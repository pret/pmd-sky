#include "overlay_29_0230A9DC.h"
#include "dungeon_items.h"
#include "dungeon_pokemon_attributes.h"



#include "overlay_29_0230A994.h"
#include "enums.h"
extern bool8 DungeonRandOutcome__022EAB20(s32 percentChance);
extern void TryAftermathExplosion(struct entity *attacker, struct entity *defender, struct position *pos, s32 radius, s32 a, s32 damage_source);
extern const s16 AFTERMATH_CHANCE;
bool8 ItemIsActive__0230A9DC(struct entity *entity, enum item_id item_id)
{
    if (AbilityIsActiveVeneer(entity, ABILITY_KLUTZ))
        return FALSE;

    return HasHeldItem(entity, item_id);
}

bool8 AftermathCheck(struct entity *attacker, struct entity *defender, s32 damage_source)
{
#ifdef JAPAN
    if (DefenderAbilityIsActive__0230A940(attacker, defender, ABILITY_AFTERMATH)
#else
    if (DefenderAbilityIsActive__0230A940(attacker, defender, ABILITY_AFTERMATH, TRUE)
#endif
        && DungeonRandOutcome__022EAB20(AFTERMATH_CHANCE)
        && damage_source != DAMAGE_SOURCE_EXPLOSION) {
        TryAftermathExplosion(attacker, defender, &defender->pos, 1, 0, DAMAGE_SOURCE_EXPLOSION);
        return TRUE;
    }
    return FALSE;
}
