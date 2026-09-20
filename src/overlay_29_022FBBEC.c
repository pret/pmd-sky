#include "overlay_29_022FBBEC.h"
#include "dungeon.h"
#include "dungeon_util_static.h"
#include "overlay_29_022F7364.h"
#include "main_020527A8.h"
#include "overlay_29_022F9720.h"

extern struct dungeon *DUNGEON_PTR[];

struct entity* FindMonsterWithBehavior(enum monster_behavior monster_behavior)
{
    for (s32 i = 0; i < DUNGEON_MAX_POKEMON; i++)
    {
        struct entity *entity = DUNGEON_PTR[0]->active_monster_ptrs[i];
        if (EntityIsValid__022F7364(entity) && monster_behavior == GetEntInfo(entity)->monster_behavior)
            return entity;
    }
    return NULL;
}

bool8 CountActiveMonsters(void)
{
    s32 i;

    for (i = 0; i < MAX_TEAM_MEMBERS; i++)
    {
        if (!EntityIsValid__022F7364(DUNGEON_PTR[0]->monster_slots.party_members[i]))
            return TRUE;
    }
    return FALSE;
}

bool8 ov29_022FBC94(s16 monster_id)
{
    s32 total = GetBodySize(monster_id);
    s32 i;

    for (i = 0; i < MAX_TEAM_MEMBERS; i++)
    {
        if (EntityIsValid__022F7364(DUNGEON_PTR[0]->monster_slots.party_members[i]))
            total += GetBodySize(GetEntInfo(DUNGEON_PTR[0]->monster_slots.party_members[i])->id);
    }
    return total <= 6;
}

#ifndef JAPAN
void ov29_022FBD08(void)
{
    DUNGEON_PTR[0]->field_0x3dcc.unique_id_index = 0;
}

bool8 ov29_022FBD24(struct entity *entity)
{
    struct unk_022FBD24 *p;

    if (!IsMonster__022F9720(entity))
        return FALSE;

    p = &DUNGEON_PTR[0]->field_0x3dcc;
    if (p->unique_id_index == 20)
        return FALSE;

    p->monster_unique_id[p->unique_id_index] = GetEntInfo(entity)->unique_id;
    p->unique_id_index++;
    return TRUE;
}

bool8 ov29_022FBD80(struct entity *entity)
{
    if (IsMonster__022F9720(entity))
    {
        struct unk_022FBD24 *p = &DUNGEON_PTR[0]->field_0x3dcc;
        u32 unique_id = GetEntInfo(entity)->unique_id;
        s32 i;
        s32 n = p->unique_id_index;

        for (i = 0; i < n; i++)
        {
            if (unique_id == p->monster_unique_id[i])
                return TRUE;
        }
    }
    return FALSE;
}
#endif
