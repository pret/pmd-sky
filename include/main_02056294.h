#ifndef PMDSKY_MAIN_02056294_H
#define PMDSKY_MAIN_02056294_H

#include "util.h"
#include "common.h"

bool8 IsMonsterIdInNormalRange(s16 id);
bool8 sub_020562B8(int a);
void SetActiveTeam(enum team_id team);
void sub_02056318(u8 a);
u8 sub_0205633C(void);
bool32 sub_02056360(void);
struct team_member* GetActiveTeamMember(s32 roster_idx);

#endif
