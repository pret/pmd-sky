#include "main_02055410.h"
#include "common.h"
#include "game_mode.h"

extern struct team_member_table *TEAM_MEMBER_TABLE_PTR;

bool8 sub_02055410(int idx)
{
    bool8 valid = (TEAM_MEMBER_TABLE_PTR->members[(s16)idx].is_valid & 1) != 0;
    if (valid) {
        if (GetGameMode() == GAME_MODE_SPECIAL_EPISODE) {
            if (idx == 2) {
                return 1;
            }
        } else if (idx == 0) {
            return 1;
        }
    }
    return 0;
}

bool8 sub_02055474(int idx)
{
    bool8 valid = (TEAM_MEMBER_TABLE_PTR->members[(s16)idx].is_valid & 1) != 0;
    if (valid) {
        if (GetGameMode() == GAME_MODE_SPECIAL_EPISODE) {
            if (idx == 3) {
                return 1;
            }
        } else if (idx == 1) {
            return 1;
        }
    }
    return 0;
}

bool8 sub_020554D8(int idx)
{
    bool8 valid = (TEAM_MEMBER_TABLE_PTR->members[(s16)idx].is_valid & 1) != 0;
    if (valid && GetGameMode() == GAME_MODE_SPECIAL_EPISODE && idx == 4) {
        return 1;
    }
    return 0;
}
