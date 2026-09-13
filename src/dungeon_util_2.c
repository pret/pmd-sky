#include "dungeon_util_2.h"
#include "dungeon_pokemon_attributes_1.h"
#include "dungeon_range.h"
#include "dungeon.h"
#include "dg_object.h"
#include "main_0200C4FC.h"
#include "main_0202593C.h"
#include "overlay_29_023000E4.h"
#include "overlay_29_0234B024.h"

extern struct dungeon *DUNGEON_PTR;
extern u8 *strcpy(u8 *dest, const u8 *src);
extern void GetTrapName(char *buf, enum trap_id trap_id);
extern void PrepareItemForPrinting2(struct preprocessor_args *preprocessor_args, s32 pos, struct item *item);
extern void SubstitutePlaceholderTrapTags(struct preprocessor_args *preprocessor_args, s32 pos, u32 trap_id);
extern void SetPreprocessorArgsStringToName(struct preprocessor_args *preprocessor_args, s32 pos, struct monster *monster, u32 param_4, u8 name_type);

bool8 CanTargetPosition(struct entity *monster, struct position *position)
{
    return IsPositionInSight(&monster->pos, position, HasDropeyeStatus(monster));
}

void PopulateActiveMonsterPtrs(void)
{
    s32 i;
    s32 n;
    struct entity *entity;

    n = 0;
    for (i = 0; i < MAX_TEAM_MEMBERS; i++)
    {
        entity = DUNGEON_PTR->monster_slots.party_members[i];
        if (EntityIsValid__022E1A1C(entity))
        {
            DUNGEON_PTR->active_monster_ptrs[n] = entity;
            n++;
        }
    }
    for (i = 0; i < DUNGEON_MAX_WILD_POKEMON; i++)
    {
        entity = DUNGEON_PTR->monster_slots.wild_pokemon[i];
        if (EntityIsValid__022E1A1C(entity))
        {
            DUNGEON_PTR->active_monster_ptrs[n] = entity;
            n++;
        }
    }
    for (; n < DUNGEON_MAX_POKEMON; n++)
    {
        DUNGEON_PTR->active_monster_ptrs[n] = NULL;
    }
}

s32 GetTeamMemberIndex(struct entity *entity)
{
    s32 i;

    for (i = 0; i < MAX_TEAM_MEMBERS; i++)
    {
        if (entity == DUNGEON_PTR->monster_slots.party_members[i])
            return i;
    }
    return -1;
}

void GetMonsterOrTrapName(char *buf, struct entity *entity, u32 param_3)
{
    switch (entity->type)
    {
        case ENTITY_MONSTER:
            GetMonsterName(buf, (struct monster *)entity->info);
            break;
        case ENTITY_TRAP:
            GetTrapName(buf, ((struct trap *)entity->info)->id);
            break;
        case ENTITY_ITEM:
            break;
        default:
#ifdef JAPAN
            strcpy((u8 *)buf, StringFromId(0xB42));
#else
            strcpy((u8 *)buf, StringFromId(0xA42));
#endif
            break;
    }
}

void SubstitutePlaceholderStringTags(s32 pos, struct entity* entity, u32 param_3)
{
    struct preprocessor_args* args = GetMessageLogPreprocessorArgs();

    switch (entity->type) {
        case ENTITY_MONSTER:
            SetPreprocessorArgsStringToName(args, pos, entity->info, param_3, 0);
            break;
        case ENTITY_ITEM:
            PrepareItemForPrinting2(args, pos, entity->info);
            break;
        case ENTITY_TRAP:
            SubstitutePlaceholderTrapTags(args, pos, ((struct trap*)entity->info)->id);
            break;
        default:
#ifdef JAPAN
            args->strings[pos] = (char*)StringFromId(0xB42);
#else
            args->strings[pos] = (char*)StringFromId(0xA42);
#endif
            break;
    }
}
