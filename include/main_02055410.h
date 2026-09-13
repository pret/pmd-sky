#ifndef PMDSKY_MAIN_02055410_H
#define PMDSKY_MAIN_02055410_H

#include "util.h"

struct ground_monster;

bool8 sub_02055410(int idx);
bool8 sub_02055474(int idx);
bool8 sub_020554D8(int idx);
bool8 IsMainCharacter(int idx);
struct ground_monster* GetTeamMember(s32 member_idx);
s16 GetRecruitMentryIdBySpecies(s16 species, s32 n);

#endif
