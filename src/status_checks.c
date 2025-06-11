#include "status_checks.h"
#include "dg_random.h"
#include "dungeon_action.h"
#include "dungeon_ai_itcm.h"
#include "dungeon_logic_3.h"
#include "dungeon_statuses.h"
#include "dungeon_util_static.h"

#ifdef JAPAN
#define HAS_STATUS_THAT_PREVENTS_ACTING_OFFSET -0x2C1
#else
#define HAS_STATUS_THAT_PREVENTS_ACTING_OFFSET 0
#endif

#define FROZEN_MESSAGE (0xC28 + HAS_STATUS_THAT_PREVENTS_ACTING_OFFSET)
#define WRAPPED_AROUND_MESSAGE (0xC29 + HAS_STATUS_THAT_PREVENTS_ACTING_OFFSET)
#define WRAPPED_BY_MESSAGE (0xC2A + HAS_STATUS_THAT_PREVENTS_ACTING_OFFSET)
#define PAUSED_MESSAGE (0xC2B + HAS_STATUS_THAT_PREVENTS_ACTING_OFFSET)
#define INFATUATED_MESSAGE (0xC2C + HAS_STATUS_THAT_PREVENTS_ACTING_OFFSET)
#define BIDE_MESSAGE (0xC2D + HAS_STATUS_THAT_PREVENTS_ACTING_OFFSET)

extern void SubstitutePlaceholderStringTags(u8 *string_id, struct entity *entity, u32 param_3);
extern void LogMessageByIdWithPopupCheckUser(struct entity *user, u32 message_id);

bool8 HasStatusThatPreventsActing(struct entity *monster)
{
    struct monster *pokemon_info = GetEntInfo(monster);
    SubstitutePlaceholderStringTags(0, monster, 0);
    SetMonsterActionFields(&pokemon_info->action, ACTION_PASS_TURN);

    switch (pokemon_info->sleep_class_status.sleep)
    {
        case STATUS_SLEEP_NIGHTMARE:
        case STATUS_SLEEP_SLEEP:
        case STATUS_SLEEP_NAPPING:
            return TRUE;
    }

    switch (pokemon_info->frozen_class_status.freeze)
    {
        case STATUS_FROZEN_FROZEN:
            LogMessageByIdWithPopupCheckUser(monster, FROZEN_MESSAGE);
            return TRUE;
        case STATUS_FROZEN_WRAP:
            LogMessageByIdWithPopupCheckUser(monster, WRAPPED_AROUND_MESSAGE);
            return TRUE;
        case STATUS_FROZEN_WRAPPED:
            LogMessageByIdWithPopupCheckUser(monster, WRAPPED_BY_MESSAGE);
            return TRUE;
        case STATUS_FROZEN_PETRIFIED:
            return TRUE;
    }

    switch (pokemon_info->cringe_class_status.cringe)
    {
        case STATUS_CRINGE_PAUSED:
            LogMessageByIdWithPopupCheckUser(monster, PAUSED_MESSAGE);
            return TRUE;
        case STATUS_CRINGE_INFATUATED:
            LogMessageByIdWithPopupCheckUser(monster, INFATUATED_MESSAGE);
            return TRUE;
    }

    if (pokemon_info->bide_class_status.bide == STATUS_TWO_TURN_BIDE)
    {
        LogMessageByIdWithPopupCheckUser(monster, BIDE_MESSAGE);
        return TRUE;
    }

    if (pokemon_info->curse_class_status.curse == STATUS_CURSE_DECOY)
    {
        SetActionPassTurnOrWalk(&pokemon_info->action, pokemon_info->id);
        pokemon_info->action.direction = DungeonRandInt(NUM_DIRECTIONS);
        pokemon_info->target_pos.x = monster->pos.x;
        pokemon_info->target_pos.y = monster->pos.y - 1;
        return TRUE;
    }

    if (pokemon_info->shopkeeper == SHOPKEEPER_MODE_SHOPKEEPER)
        return TRUE;

    if (IsBlinded(monster, TRUE))
    {
        if (CanMonsterMoveInDirection(monster, pokemon_info->action.direction))
        {
            SetActionPassTurnOrWalk(&pokemon_info->action, pokemon_info->id);
        }
        else if (DungeonRandInt(2) != 0)
        {
            pokemon_info->action.direction = DungeonRandInt(NUM_DIRECTIONS);
            pokemon_info->action.direction = pokemon_info->action.direction & DIRECTION_MASK;
            SetActionPassTurnOrWalk(&pokemon_info->action, pokemon_info->id);
        }
        else
        {
            ChooseAiMove(monster);
        }

        return TRUE;
    }

    if (pokemon_info->blinker_class_status.blinded == STATUS_BLINKER_CROSS_EYED)
    {
        SetActionPassTurnOrWalk(&pokemon_info->action, pokemon_info->id);
        pokemon_info->action.direction = DungeonRandInt(NUM_DIRECTIONS);
        return TRUE;
    }

    return FALSE;
}
