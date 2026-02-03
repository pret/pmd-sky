#include "special_move_types.h"
#include "dungeon_action_helper.h"
#include "dungeon_parameters_2.h"
#include "dungeon_util_static.h"
#include "natural_gift_data.h"
#include "overlay_29_0231A9D4.h"
#include "overlay_29_022FBA54.h"
#include "weather.h"

extern void UseMove(struct entity*, s16, s32, s32, s32);

const struct natural_gift_item_info* GetEntityNaturalGiftInfo(struct entity* entity)
{
    if (IsMonster__0231A9D4(entity)) {
        struct monster *monster = GetEntInfo(entity);
        if (((struct item_volatile*)(&monster->held_item))->id != ITEM_NOTHING) {
            bool8 found_item = FALSE;
            s16 i = 0;
            s16 natural_gift_item_id;

            loop_start:
            natural_gift_item_id = ((volatile struct natural_gift_item_info*)NATURAL_GIFT_ITEM_TABLE)[i].item_id;
            if (natural_gift_item_id != ITEM_NOTHING)
            {
                if (monster->held_item.id == natural_gift_item_id)
                    found_item = TRUE;
                else
                {
                    i++;
                    goto loop_start;
                }
            }

            if (found_item)
                return &NATURAL_GIFT_ITEM_TABLE[i];
        }
    }
    return NULL;
}

enum type_id GetEntityWeatherBallType(struct entity* entity)
{
    return WEATHER_BALL_TYPE_TABLE[GetApparentWeather(entity)];
}

void UseMoveByMoveId(struct entity *entity, enum move_id move_id, bool8 add_move_if_not_exists)
{
    if (!IsMonster__0231A9D4(entity))
        return;

    s16 move_index = FindMoveOnMonster(entity, move_id);
    if (add_move_if_not_exists && move_index < 0) {
        struct monster *monster = GetEntInfo(entity);
        SetActionUseMoveAi(&monster->action, 0, DIR_DOWN);
        monster->moves.moves[0].flags0 = MOVE_FLAG_EXISTS;
        monster->moves.moves[0].flags2 = 0;
        monster->moves.moves[0].id = move_id;
        monster->moves.moves[0].pp = 1;
        monster->moves.moves[0].ginseng = 0;
        move_index = 0;
    }
    UseMove(entity, move_index, 1, 0, 0);
}
