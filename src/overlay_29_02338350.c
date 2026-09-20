#include "overlay_29_02338350.h"
#include "dg_random.h"
#include "dungeon.h"
#include "dungeon_map_access.h"
#include "dungeon_pokemon_attributes_1.h"
#include "dungeon_util.h"
#include "dungeon_util_static.h"
#include "main_02001188.h"

extern struct dungeon *DUNGEON_PTR;

extern bool8 ShouldTreatMonsterAsAlly(struct entity *monster, struct entity *other);

s16 ov29_0233804C(void)
{
    s16 *ids = (s16 *)MemAlloc(0x2d8, 0x10);
    s16 i;
    s16 idx = DungeonRandRange(1, 0x16c);
    s16 count = 0;
    s16 chosen;
    for (i = 0; i < 0x16c; i++) {
        if (idx >= 0x16c)
            idx = 0;
        if (DUNGEON_PTR->field_0x286b0.item_spawn_weights[0].item_threshold[idx] != 0)
            ids[count++] = idx;
        idx++;
    }
    chosen = DungeonRandInt(count);
    chosen = ids[chosen];
    MemFree(ids);
    return chosen;
}

s32 ov29_023380FC(struct entity *entity, struct entity **targets)
{
    s16 i;
    bool8 is_not_team_member = FALSE;
    s16 count = 0;
    if (GetEntInfo(entity)->is_not_team_member)
        is_not_team_member = TRUE;

    for (i = 0; i < NUM_DIRECTIONS; i++) {
        struct entity *other = GetTile(entity->pos.x + DIRECTIONS_XY[i].x,
                                       entity->pos.y + DIRECTIONS_XY[i].y)->monster;
        if (other != NULL && GetEntityType(other) == ENTITY_MONSTER) {
            bool8 other_not_team_member = GetEntInfo(other)->is_not_team_member;
            if (is_not_team_member) {
                if (!other_not_team_member) {
                    targets[count] = other;
                    count = (s16)(count + 1);
                }
            }
            else if (other_not_team_member) {
                targets[count] = other;
                count = (s16)(count + 1);
            }
        }
    }
    return count;
}

struct entity* ov29_023381C0(struct entity *entity, enum iq_skill_id iq_skill, bool8 param_3)
{
    s16 i;
    for (i = 0; i < NUM_DIRECTIONS; i = (s16)(i + 1)) {
        struct entity *other = GetTile(entity->pos.x + DIRECTIONS_XY[i].x,
                                       entity->pos.y + DIRECTIONS_XY[i].y)->monster;
        if (other != NULL && GetEntityType(other) == ENTITY_MONSTER &&
            IqSkillIsEnabled(other, iq_skill)) {
            if (param_3) {
                if (ShouldTreatMonsterAsAlly(other, entity))
                    return other;
            }
            else if (ShouldTreatMonsterAsAlly(entity, other)) {
                return other;
            }
        }
    }
    return NULL;
}

bool8 NearbyAllyIqSkillIsEnabled(struct entity *entity, enum iq_skill_id iq_skill)
{
    return ov29_023381C0(entity, iq_skill, FALSE) != NULL;
}

struct entity* FindAdjacentEnemy(struct entity *monster)
{
    s16 i;
    bool8 is_not_team_member = FALSE;
    if (GetEntInfo(monster)->is_not_team_member)
        is_not_team_member = TRUE;

    for (i = 0; i < NUM_DIRECTIONS; i++)
    {
        struct entity *monster_in_direction = GetTile(monster->pos.x + DIRECTIONS_XY[i].x, monster->pos.y + DIRECTIONS_XY[i].y)->monster;
        if (monster_in_direction != NULL && GetEntityType(monster_in_direction) == ENTITY_MONSTER)
        {
            bool8 monster_in_direction_not_team_member = GetEntInfo(monster_in_direction)->is_not_team_member;
            if (is_not_team_member)
            {
                if (!monster_in_direction_not_team_member)
                    return monster_in_direction;
            }
            else if (monster_in_direction_not_team_member)
                return monster_in_direction;
        }
    }
    return NULL;
}

bool8 IsAdjacentToEnemyIgnoreTreatment(struct entity *monster)
{
    if (FindAdjacentEnemy(monster) != NULL)
        return TRUE;
    return FALSE;
}
