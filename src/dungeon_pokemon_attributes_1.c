#include "dungeon_pokemon_attributes_1.h"
#include "dungeon_util_static.h"
#include "overlay_29_022FF898.h"
#include "overlay_29_023000E4.h"
#include "pokemon.h"

extern struct dungeon* DUNGEON_PTR[];

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

bool8 HasDropeyeStatus(struct entity* entity)
{
    if (EntityIsValid__023000E4(entity) && GetEntInfo(entity)->blinker_class_status.blinded == STATUS_BLINKER_DROPEYE)
        return TRUE;

    return FALSE;
}

bool8 IqSkillIsEnabled(struct entity *entity, enum iq_skill_id iq_skill)
{
    struct monster *entity_info = GetEntInfo(entity);
    if (!entity_info->is_not_team_member && DUNGEON_PTR[0]->iq_disabled)
        return FALSE;

    return IqSkillFlagTest(&entity_info->iq_skill_flags, iq_skill);
}
