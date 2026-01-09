#include "dungeon_recruitment_2.h"

#include "dungeon.h"
#include "enums.h"
#include "util.h"

extern struct dungeon_restriction DUNGEON_RESTRICTIONS[256];

bool8 DungeonGoesUp(enum dungeon_id dungeon_id) 
{
    bool8 return_val;
    
    if(DUNGEON_RESTRICTIONS[dungeon_id].flags & DUNGEON_ASCENDS)
    {
        return_val = TRUE;
    }
    else
    {
        return_val = FALSE;
    }
    return return_val;
}

s32 GetTurnLimit(enum dungeon_id dungeon_id)
{
    return DUNGEON_RESTRICTIONS[dungeon_id].turn_limit_per_floor;
}

bool8 DoesNotSaveWhenEntering(enum dungeon_id dungeon_id) 
{
    bool8 return_val;
    
    if(DUNGEON_RESTRICTIONS[dungeon_id].flags & NO_SAVE_ON_ENTRY)
    {
        return_val = TRUE;
    }
    else
    {
        return_val = FALSE;
    }
    return return_val;
}

bool8 TreasureBoxDropsEnabled(enum dungeon_id dungeon_id) 
{
    bool8 return_val;
    
    if(DUNGEON_RESTRICTIONS[dungeon_id].flags & ENEMIES_DROP_CHESTS)
    {
        return_val = TRUE;
    }
    else
    {
        return_val = FALSE;
    }
    return return_val;
}

bool8 IsLevelResetDungeon(enum dungeon_id dungeon_id) 
{
    bool8 return_val;
    
    if(DUNGEON_RESTRICTIONS[dungeon_id].flags & RESET_TEAM_LEVEL_TO_1)
    {
        return_val = TRUE;
    }
    else
    {
        return_val = FALSE;
    }
    return return_val;
}

s32 GetMaxItemsAllowed(enum dungeon_id dungeon_id)
{
    return DUNGEON_RESTRICTIONS[dungeon_id].max_items_allowed;
}

bool8 IsMoneyAllowed(enum dungeon_id dungeon_id) 
{
    bool8 return_val;
    
    if(DUNGEON_RESTRICTIONS[dungeon_id].flags & KEEP_MONEY_ON_ENTRY)
    {
        return_val = TRUE;
    }
    else
    {
        return_val = FALSE;
    }
    return return_val;
}

s8 GetMaxRescueAttempts(enum dungeon_id dungeon_id)
{
    return DUNGEON_RESTRICTIONS[dungeon_id].max_rescue_attempts;
}


bool8 IsRecruitingAllowed(enum dungeon_id dungeon_id)
{
    bool8 return_val;

    if (DUNGEON_RESTRICTIONS[dungeon_id].flags & ALLOW_RECRUITING)
    {
        return_val = TRUE;
    } 
    else 
    {
        return_val = FALSE;
    }
    return return_val;
}

bool8 GetLeaderChangeFlag(enum dungeon_id dungeon_id)
{
    bool8 return_val;

    if (DUNGEON_RESTRICTIONS[dungeon_id].flags & ALLOW_LEADER_CHANGE)
    {
        return_val = TRUE;
    } 
    else 
    {
        return_val = FALSE;
    }
    return return_val;
}

s32 GetRandomMovementChance(enum dungeon_id dungeon_id)
{
    return DUNGEON_RESTRICTIONS[dungeon_id].random_movement_chance;
}

bool8 CanEnemyEvolve(enum dungeon_id dungeon_id)
{
    bool8 return_val;

    if (DUNGEON_RESTRICTIONS[dungeon_id].flags & ENEMIES_CAN_EVOLVE)
    {
        return_val = TRUE;
    } 
    else 
    {
        return_val = FALSE;
    }
    return return_val;
}

s32 GetMaxMembersAllowed(enum dungeon_id dungeon_id)
{
    return DUNGEON_RESTRICTIONS[dungeon_id].max_party_size;
}

bool8 IsIqEnabled(enum dungeon_id dungeon_id)
{
    bool8 return_val;

    if (DUNGEON_RESTRICTIONS[dungeon_id].flags & DISABLE_IQ_SKILLS)
    {
        return_val = TRUE;
    } 
    else 
    {
        return_val = FALSE;
    }
    return return_val;
}

bool8 IsTrapInvisibleWhenAttacking(enum dungeon_id dungeon_id)
{
    bool8 return_val;

    if (DUNGEON_RESTRICTIONS[dungeon_id].flags & TRAPS_STAY_HIDDEN_ON_ATTACK)
    {
        return_val = TRUE;
    } 
    else 
    {
        return_val = FALSE;
    }
    return return_val;
}

bool8 JoinedAtRangeCheck(enum dungeon_id dungeon_id) 
{
    return ((dungeon_id >= DUNGEON_JOINED_AT_BIDOOF) && (dungeon_id < DUNGEON_DUMMY_0xE4));
}
