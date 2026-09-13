#ifndef PMDSKY_DUNGEON_UTIL_2_H
#define PMDSKY_DUNGEON_UTIL_2_H

#include "dungeon_mode.h"

// Checks if a monster can target a position. This function just calls IsPositionInSight using the position of the user as the origin.
bool8 CanTargetPosition(struct entity *monster, struct position *position);
void PopulateActiveMonsterPtrs(void);
s32 GetTeamMemberIndex(struct entity *entity);
void GetMonsterOrTrapName(char *buf, struct entity *entity, u32 param_3);
void SubstitutePlaceholderStringTags(s32 pos, struct entity* entity, u32 param_3);

#endif //PMDSKY_DUNGEON_UTIL_2_H
