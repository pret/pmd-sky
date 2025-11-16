#ifndef PMDSKY_DUNGEON_LOGIC_5_H
#define PMDSKY_DUNGEON_LOGIC_5_H

#include "dungeon_mode.h"

// Checks if an allied monster can see any other teammate (via CanSeeTarget). Always returns false for enemy monsters.
bool8 CanSeeTeammate(struct entity *monster);
// Check the type of a move when used by a certain monster. Accounts for special cases such as Hidden Power, Weather Ball, the regular attack...
enum type_id GetMoveTypeForMonster(struct entity *entity, struct move *move);

#endif //PMDSKY_DUNGEON_LOGIC_5_H
