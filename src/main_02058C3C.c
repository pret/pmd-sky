#include "main_02058C3C.h"

extern s16 TACTICS_UNLOCK_LEVEL_TABLE[];
#include "tactics_data.h"

bool8 DoesTacticFollowLeader(enum tactic_id tactic_id)
{
    return TACTICS_FOLLOW_LEADER[tactic_id];
}

void GetUnlockedTactics(u8 *out, s32 level)
{
    s32 i;
    s32 n;

    n = 0;

    for (i = 0; i < 0xC; i++) {
        if (TACTICS_UNLOCK_LEVEL_TABLE[i] <= level) {
            out[n] = i;
            n++;
        }
    }

    for (; n < 0xC; n++) {
        out[n] = 0xB;
    }
}

void GetUnlockedTacticFlags(u8 *out, s32 level)
{
    s32 i;

    for (i = 0; i < 0xC; i++) {
        if (TACTICS_UNLOCK_LEVEL_TABLE[i] <= level) {
            out[i] = 1;
        } else {
            out[i] = 0;
        }
    }
}
