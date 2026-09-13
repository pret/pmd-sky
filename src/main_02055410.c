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

bool8 IsMainCharacter(int idx)
{
    bool8 valid = (TEAM_MEMBER_TABLE_PTR->members[(s16)idx].is_valid & 1) != 0;
    if (valid && idx < 5) {
        if (GetGameMode() == GAME_MODE_SPECIAL_EPISODE) {
            if (idx != 2 && idx != 3 && idx != 4) {
                return 0;
            }
        } else if (idx != 0 && idx != 1) {
            return 0;
        }
        return 1;
    }
    return 0;
}

struct ground_monster *GetTeamMember(s32 member_idx)
{
    if (member_idx == -1) {
        return NULL;
    }
    return &TEAM_MEMBER_TABLE_PTR->members[(s16)member_idx];
}

s16 GetRecruitMentryIdBySpecies(s16 species, s32 n)
{
    struct ground_monster *m = &TEAM_MEMBER_TABLE_PTR->members[5];
    s32 count = 0;
    s32 i;
    for (i = 5; i < MAX_GROUND_TEAM_MEMBERS; i++, m++) {
        bool8 valid = (m->is_valid & 1) != 0;
        if (valid && m->id == species) {
            if (count == n) {
                return i;
            }
            count++;
        }
    }
    return -1;
}
