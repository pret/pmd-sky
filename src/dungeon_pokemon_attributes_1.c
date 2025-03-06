#include "dungeon_pokemon_attributes_1.h"
#include "dungeon_util_static.h"
#include "overlay_29_022FF898.h"

bool8 CanSeeInvisibleMonsters(struct entity *entity)
{
    if (GetEntInfo(entity)->blinker_class_status.blinded == STATUS_BLINKER_EYEDROPS)
        return TRUE;

    if (ItemIsActive__022FF898(entity, ITEM_GOGGLE_SPECS))
        return TRUE;

    return FALSE;
}

bool8 IsTacticSet(struct entity *entity, enum tactic_id tactic_id)
{
    struct monster *pokemon_info = GetEntInfo(entity);
    if (pokemon_info->is_team_leader)
        return tactic_id == TACTIC_YOU_GO_THE_OTHER_WAY;

    return pokemon_info->tactic == tactic_id;
}
