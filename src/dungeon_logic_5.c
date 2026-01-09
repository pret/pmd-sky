#include "dungeon_logic_5.h"
#include "dungeon_pokemon_attributes.h"
#include "dungeon_util_static.h"
#include "dungeon_visibility.h"
#include "main_02014CEC.h"
#include "moves_2.h"
#include "natural_gift_data.h"
#include "overlay_29_022FF898.h"
#include "overlay_29_023000E4.h"
#include "special_move_types.h"

extern s32 GetMoveBasePower(struct move*);

bool8 CanSeeTeammate(struct entity *monster)
{
    if (GetEntInfo(monster)->is_not_team_member)
        return FALSE;

    for (s32 member_idx = 0; member_idx < MAX_TEAM_MEMBERS; member_idx++)
    {
        struct entity *team_member = DUNGEON_PTR[0]->monster_slots.party_members[member_idx];
        if (EntityIsValid__023000E4(monster) && monster != team_member && CanSeeTarget(monster, team_member))
            return TRUE;
    }
    return FALSE;
}

enum type_id GetMoveTypeForMonster(struct entity *entity, struct move *move)
{
    if (!IsRegularAttackOrProjectile(move->id) && EntityIsValid__023000E4(entity) && AbilityIsActive(entity, ABILITY_NORMALIZE))
        return TYPE_NORMAL;

    if (move->id == MOVE_HIDDEN_POWER)
        return GetEntInfo(entity)->hidden_power_type;

    if (move->id == MOVE_NATURAL_GIFT)
    {
        const struct natural_gift_item_info *natural_gift_info = GetEntityNaturalGiftInfo(entity);
        if (natural_gift_info != NULL)
            return natural_gift_info->type_id;
    }

    if (move->id == MOVE_WEATHER_BALL)
        return GetEntityWeatherBallType(entity);

    return GetMoveType(move);
}

s32 GetMovePower(struct entity* entity, struct move* move)
{
    s32 power;
    u8 ginseng;

    ginseng = move->ginseng;
    if (move->id == MOVE_HIDDEN_POWER) {
        struct monster *pokemon_info = GetEntInfo(entity);
        return move->ginseng + pokemon_info->hidden_power_base_power;
    }
    power = ginseng + GetMoveBasePower(move);
    if (ItemIsActive__022FF898(entity, ITEM_SPACE_GLOBE)) {
        power *= 2;
    }
    return power;
}
