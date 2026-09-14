#include "overlay_29_022FBA54.h"
#include "dungeon_util_static.h"
#include "overlay_29_022F9720.h"

s16 FindMoveOnMonster(struct entity* entity, enum move_id move_id)
{
    if (IsMonster__022F9720(entity))
    {
        struct monster *monster = GetEntInfo(entity);
        for (s16 i = 0; i < MAX_MON_MOVES; i++)
        {
            struct move *move = &monster->moves.moves[i];
            if (MoveExists(move) && move->id == move_id)
                return i;
        }
    }
    return -1;
}

bool8 DoesMonsterHaveMove(struct entity* entity, enum move_id move_id)
{
    return FindMoveOnMonster(entity, move_id) >= 0;
}

bool8 IsSpecialStoryAllyOrClient(struct entity* entity)
{
    if (IsMonster__022F9720(entity))
    {
        if (GetEntInfo(entity)->joined_at == DUNGEON_CLIENT)
            return TRUE;
        if (GetEntInfo(entity)->joined_at >= DUNGEON_JOINED_AT_BIDOOF
            && GetEntInfo(entity)->joined_at < DUNGEON_DUMMY_0xE4)
            return TRUE;
    }
    return FALSE;
}

void ResetTriggerFlags(struct entity* entity)
{
    struct monster* monster = GetEntInfo(entity);
    if (monster != NULL)
    {
        monster->contact_ability_trigger_bitflags = 0;
        monster->exclusive_item_trigger_bitflags = 0;
    }
}
