#include "main_02055770.h"
#include "common.h"
#include "game_mode.h"

extern struct team_member_table *TEAM_MEMBER_TABLE_PTR;

struct ground_monster* GetHero(void)
{
    struct ground_monster *m = TEAM_MEMBER_TABLE_PTR->members;
    bool8 valid = (m->is_valid & 1) != 0;
    return valid ? m : NULL;
}

struct ground_monster* GetPartner(void)
{
    bool8 valid = (TEAM_MEMBER_TABLE_PTR->members[1].is_valid & 1) != 0;
    return valid ? &TEAM_MEMBER_TABLE_PTR->members[1] : NULL;
}

struct ground_monster* GetMainCharacter1(void)
{
    s16 idx = (GetGameMode() == GAME_MODE_SPECIAL_EPISODE) ? 2 : 0;
    struct ground_monster *base = TEAM_MEMBER_TABLE_PTR->members;
    bool8 valid = (base[idx].is_valid & 1) != 0;
    return valid ? base + idx : NULL;
}

struct ground_monster* GetMainCharacter2(void)
{
    s16 idx = (GetGameMode() == GAME_MODE_SPECIAL_EPISODE) ? 3 : 1;
    struct ground_monster *base = TEAM_MEMBER_TABLE_PTR->members;
    bool8 valid = (base[idx].is_valid & 1) != 0;
    return valid ? base + idx : NULL;
}

struct ground_monster* GetMainCharacter3(void)
{
    bool8 valid;
    if (GetGameMode() != GAME_MODE_SPECIAL_EPISODE) {
        return NULL;
    }
    valid = (TEAM_MEMBER_TABLE_PTR->members[4].is_valid & 1) != 0;
    return valid ? &TEAM_MEMBER_TABLE_PTR->members[4] : NULL;
}
