#ifndef PMDSKY_DUNGEON_RECRUITMENT_H
#define PMDSKY_DUNGEON_RECRUITMENT_H

#include "util.h"
#include "dungeon_mode.h"

bool8 RecruitCheck(struct entity* leader, struct entity* target);
bool8 SpecificRecruitCheck(u32 monster_id);
extern bool8 DebugRecruitingEnabled(u32 monster_id);
bool8 TryRecruit(struct entity *user, struct entity *recruit, void *recruit_info);

#endif //PMDSKY_DUNGEON_RECRUITMENT_H
