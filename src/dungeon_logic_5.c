#include "dungeon_logic_5.h"
#include "dungeon_pokemon_attributes.h"
#include "dungeon_util_static.h"
#include "main_02014CEC.h"
#include "natural_gift_data.h"
#include "overlay_29_023000E4.h"
#include "special_move_types.h"

extern enum type_id GetMoveType(struct move* move);

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
