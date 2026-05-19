#include "weather.h"
#include "dungeon.h"
#include "dungeon_items.h"
#include "dungeon_pokemon_attributes.h"

extern struct dungeon *DUNGEON_PTR[];

enum weather_id GetApparentWeather(struct entity *entity)
{
    if (entity != NULL)
    {
        bool8 has_weather_band;
        if (AbilityIsActiveVeneer(entity, ABILITY_KLUTZ))
            has_weather_band = FALSE;
        else
            has_weather_band = HasHeldItem(entity, ITEM_WEATHER_BAND);

        if (has_weather_band)
            return WEATHER_CLEAR;
    }
    return DUNGEON_PTR[0]->weather.weather;
}
