#include "overlay_29_023350D8.h"
#include "dungeon_util_static.h"
#include "dungeon_pokemon_attributes.h"
#include "inflict_status.h"
#include "main_0205283C.h"
#include "overlay_29_022F7364.h"
#include "overlay_29_022FFF28.h"
#include "weather.h"

extern struct dungeon *DUNGEON_PTR;

struct unk_022C4C6C {
    enum type_id field_0x0;
    u8 field_0x1;
    s16 field_0x2;
    s16 field_0x4;
};

extern struct unk_022C4C6C CASTFORM_WEATHER_ATTRIBUTE_TABLE[];

extern struct rgba *GetWeatherColorTable(enum weather_id weather);
extern void ov29_022DE608(void);
extern s16 GetMonsterApparentId(struct entity *entity, s16 monster_id);
extern s32 GetIdleAnimationId(struct entity *entity);
extern void ov29_02304830(struct entity *entity, s32 animation_id);
extern void DetermineMonsterShadow(struct entity *entity);
extern void ov29_022E65F4(struct entity *entity);

bool8 EntityIsValid__023350D8(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return GetEntityType(entity) != ENTITY_NOTHING;
}

void ov29_023350FC(void)
{
    struct rgba *colors;
    s32 i;

    colors = GetWeatherColorTable(GetApparentWeather(NULL));
    for (i = 0; i < 256; i++) {
        DUNGEON_PTR->color_table[i].r = colors[i].r;
        DUNGEON_PTR->color_table[i].b = colors[i].b;
        DUNGEON_PTR->color_table[i].g = colors[i].g;
        DUNGEON_PTR->color_table[i].a = colors[i].a;
    }
    ov29_022DE608();
}

void TryWeatherFormChange(struct entity *entity)
{
    const struct monster *cmonster;
    s16 prev_apparent_id;
    bool8 changed;
    bool8 retyped;
    struct monster *monster;
    enum type_id prev_type0;
    enum type_id prev_type1;

    changed = FALSE;
    retyped = FALSE;
    if (!EntityIsValid__023350D8(entity))
        return;

    monster = entity->info;
    cmonster = monster;
    prev_apparent_id = monster->apparent_id;
    prev_type0 = monster->types[0];
    prev_type1 = monster->types[1];
    CalcSpeedStageWrapper(entity);

    if (AbilityIsActiveVeneer(entity, ABILITY_FORECAST)) {
        monster->types[0] =
            CASTFORM_WEATHER_ATTRIBUTE_TABLE[GetApparentWeather(entity)].field_0x0;
        monster->types[1] = TYPE_NONE;
    } else if (!Conversion2IsActive(entity) && !monster->type_changed && !monster->roost) {
        monster->types[0] = GetType(monster->id, 0);
        monster->types[1] = GetType(monster->id, 1);
        retyped = TRUE;
    }

    if (prev_type0 != monster->types[0] || prev_type1 != monster->types[1]) {
        if (!retyped)
            changed = TRUE;
    }

    if ((monster->id >= MONSTER_CASTFORM_NORMAL && monster->id <= MONSTER_CASTFORM_RAINY) ||
        (monster->id >= MONSTER_CASTFORM_NORMAL_SECONDARY &&
         monster->id <= MONSTER_CASTFORM_RAINY_SECONDARY)) {
        if (AbilityIsActiveVeneer(entity, ABILITY_FORECAST)) {
            monster->apparent_id = GetMonsterApparentId(entity, monster->id);
        } else if (monster->id >= MONSTER_CASTFORM_NORMAL &&
                   monster->id <= MONSTER_CASTFORM_RAINY) {
            monster->apparent_id = MONSTER_CASTFORM_NORMAL;
        } else {
            monster->apparent_id = MONSTER_CASTFORM_NORMAL_SECONDARY;
        }
        if (cmonster->apparent_id != prev_apparent_id) {
            entity->sprite_index = DungeonGetSpriteIndex(monster->apparent_id);
            ov29_02304830(entity, GetIdleAnimationId(entity));
            DetermineMonsterShadow(entity);
            changed = TRUE;
        }
    } else if ((monster->id >= MONSTER_CHERRIM_OVERCAST &&
                monster->id <= MONSTER_CHERRIM_SUNSHINE) ||
               (monster->id >= MONSTER_CHERRIM_OVERCAST_SECONDARY &&
                monster->id <= MONSTER_CHERRIM_SUNSHINE_SECONDARY)) {
        if (GetApparentWeather(entity) == WEATHER_SUNNY) {
            if (monster->id == MONSTER_CHERRIM_OVERCAST)
                monster->apparent_id = MONSTER_CHERRIM_SUNSHINE;
            else if (monster->id == MONSTER_CHERRIM_OVERCAST_SECONDARY)
                monster->apparent_id = MONSTER_CHERRIM_SUNSHINE_SECONDARY;

            if (monster->id == MONSTER_CHERRIM_SUNSHINE &&
                monster->apparent_id == MONSTER_CHERRIM_OVERCAST)
                monster->apparent_id = MONSTER_CHERRIM_SUNSHINE;
            else if (monster->id == MONSTER_CHERRIM_SUNSHINE_SECONDARY &&
                     monster->apparent_id == MONSTER_CHERRIM_OVERCAST_SECONDARY)
                monster->apparent_id = MONSTER_CHERRIM_SUNSHINE_SECONDARY;
        } else {
            if (monster->id == MONSTER_CHERRIM_SUNSHINE)
                monster->apparent_id = MONSTER_CHERRIM_OVERCAST;
            else if (monster->id == MONSTER_CHERRIM_SUNSHINE_SECONDARY)
                monster->apparent_id = MONSTER_CHERRIM_OVERCAST_SECONDARY;

            if (monster->id == MONSTER_CHERRIM_OVERCAST &&
                monster->apparent_id == MONSTER_CHERRIM_SUNSHINE)
                monster->apparent_id = MONSTER_CHERRIM_OVERCAST;
            else if (monster->id == MONSTER_CHERRIM_OVERCAST_SECONDARY &&
                     monster->apparent_id == MONSTER_CHERRIM_SUNSHINE_SECONDARY)
                monster->apparent_id = MONSTER_CHERRIM_OVERCAST_SECONDARY;
        }
        if (cmonster->apparent_id != prev_apparent_id) {
            entity->sprite_index = DungeonGetSpriteIndex(monster->apparent_id);
            ov29_02304830(entity, GetIdleAnimationId(entity));
            changed = TRUE;
        }
    }

    if (changed)
        ov29_022E65F4(entity);
}
