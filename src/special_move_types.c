#include "special_move_types.h"
#include "dungeon_util_static.h"
#include "natural_gift_data.h"
#include "overlay_29_0231A9D4.h"
#include "weather.h"

extern enum type_id WEATHER_BALL_TYPE_TABLE[8];

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
