#include "main_02058C3C.h"
#include "tactics_data.h"

bool8 DoesTacticFollowLeader(enum tactic_id tactic_id)
{
    return TACTICS_FOLLOW_LEADER[tactic_id];
}
