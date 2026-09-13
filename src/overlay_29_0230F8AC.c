#include "overlay_29_0230F8AC.h"
#include "dungeon_ai_items_1.h"
#include "dungeon_map_access.h"
#include "dungeon_util.h"
#include "dungeon_util_static.h"
#include "exclusive_item.h"
#include "overlay_29_0230F810.h"
#include "dg_random.h"
#include "dungeon_pokemon_attributes.h"
#include "dungeon_pokemon_attributes_1.h"
#include "dungeon_recruitment_2.h"
#include "overlay_29_02344BE4.h"
#include "overlay_29_02345A3C.h"

extern struct dungeon *DUNGEON_PTR;
extern const s16 ov10_022C4650;

extern bool8 TryGenerateUnownStoneDrop(struct item *item, s16 monster_id, s32 param_3);
extern bool8 ov29_023460DC(struct item *item, struct entity *entity, bool8 param_3, s32 param_4);
extern bool8 ov29_0234908C(struct item *item);

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

void ov29_0230F9A4(struct entity *entity, struct item *item)
{
    if (!IsMonster__0230F980(entity))
        return;

    if (GetEntInfo(entity)->is_not_team_member)
        return;

    ov29_0234908C(item);
}

void TrySpawnEnemyItemDrop(struct entity *attacker, struct entity *defender)
{
    struct item item;
    struct monster *monster;
    s16 n;

    if (TreasureBoxDropsEnabled(DUNGEON_PTR->id) &&
        (monster = GetEntInfo(defender))->is_not_team_member)
    {
        n = 0;
        if (GetEntityType(attacker) == ENTITY_MONSTER)
        {
            if (IqSkillIsEnabled(attacker, IQ_COLLECTOR))
                n++;
            if (ExclusiveItemEffectIsActive__0230F8AC(attacker, EXCLUSIVE_EFF_MORE_TREASURE_DROPS))
                n++;
        }

        if (TryGenerateUnownStoneDrop(&item, monster->id, n))
        {
            SpawnDroppedItemWrapper(defender, &defender->pos, &item, 1);
        }
        else if (ov29_023460DC(&item, defender,
                               AbilityIsActiveVeneer(attacker, ABILITY_HONEY_GATHER), n))
        {
            SpawnDroppedItemWrapper(defender, &defender->pos, &item, 1);
        }
        else if (IsMonster__0230F980(attacker) &&
                 ExclusiveItemEffectIsActive__0230F8AC(attacker, EXCLUSIVE_EFF_MORE_MONEY_DROPS) &&
                 DungeonRandOutcome__022EAB20(ov10_022C4650))
        {
            GenerateStandardItem(&item, ITEM_POKE, 2);
            SpawnDroppedItemWrapper(defender, &defender->pos, &item, 1);
        }
    }
}
