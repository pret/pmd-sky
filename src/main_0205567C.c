#include "main_0205567C.h"
#include "common.h"
#include "game_mode.h"

extern struct team_member_table *TEAM_MEMBER_TABLE_PTR;

u32 GetHeroMemberIdx(void)
{
    bool8 valid = (TEAM_MEMBER_TABLE_PTR->members[0].is_valid & 1) != 0;
    if (valid) {
        return 0;
    } else {
        return -1;
    }
}

u32 GetPartnerMemberIdx(void)
{
    bool8 valid = (TEAM_MEMBER_TABLE_PTR->members[1].is_valid & 1) != 0;
    if (valid) {
        return 1;
    } else {
        return -1;
    }
}

u32 GetMainCharacter1MemberIdx(void)
{
    int idx = (GetGameMode() == GAME_MODE_SPECIAL_EPISODE) ? 2 : 0;
    bool8 valid = (TEAM_MEMBER_TABLE_PTR->members[(s16)idx].is_valid & 1) != 0;
    if (valid) {
        return idx;
    } else {
        return -1;
    }
}

u32 GetMainCharacter2MemberIdx(void)
{
    int idx = (GetGameMode() == GAME_MODE_SPECIAL_EPISODE) ? 3 : 1;
    bool8 valid = (TEAM_MEMBER_TABLE_PTR->members[(s16)idx].is_valid & 1) != 0;
    if (valid) {
        return idx;
    } else {
        return -1;
    }
}

u32 GetMainCharacter3MemberIdx(void)
{
    bool8 valid;
    if (GetGameMode() != GAME_MODE_SPECIAL_EPISODE) {
        return -1;
    }
    valid = (TEAM_MEMBER_TABLE_PTR->members[4].is_valid & 1) != 0;
    if (valid) {
        return 4;
    } else {
        return -1;
    }
}
