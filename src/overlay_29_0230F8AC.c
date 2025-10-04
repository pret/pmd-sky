#include "overlay_29_0230F8AC.h"
#include "dungeon_ai_items_1.h"
#include "dungeon_map_access.h"
#include "dungeon_util.h"
#include "dungeon_util_static.h"
#include "exclusive_item.h"
#include "overlay_29_0230F810.h"

bool8 ExclusiveItemEffectIsActive__0230F8AC(struct entity *entity, enum exclusive_item_effect_id effect_id)
{
    struct monster *monster = GetEntInfo(entity);
    if (!monster->is_not_team_member)
        return ExclusiveItemEffectFlagTest(monster->exclusive_item_effect_flags, effect_id);

    return FALSE;
}

u8 FindDirectionOfAdjacentMonsterWithItem(struct entity *entity, enum item_id item_id)
{
    if (!EntityIsValid__0230F008(entity))
        return DIR_NONE_UNSIGNED;

    u8 i = 0;
    u8 direction = GetEntInfo(entity)->action.direction;
    for (; i < NUM_DIRECTIONS; i++, direction = (u8)(direction + 1) & DIRECTION_MASK)
    {
        struct entity *monster_in_direction = GetTile(entity->pos.x + DIRECTIONS_XY[direction].x, entity->pos.y + DIRECTIONS_XY[direction].y)->monster;
        if (monster_in_direction != NULL && IsMonster__0230F980(monster_in_direction) && ItemIsActive__0230F810(monster_in_direction, item_id))
            return direction;
    }

    return DIR_NONE_UNSIGNED;
}

bool8 IsMonster__0230F980(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return GetEntityType(entity) == ENTITY_MONSTER;
}
