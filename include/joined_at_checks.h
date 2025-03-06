#ifndef PMDSKY_JOINED_AT_CHECKS_H
#define PMDSKY_JOINED_AT_CHECKS_H

#include "dungeon_mode.h"


// Checks if a monster is a special story ally.
// This is a hard-coded check that looks at the monster's "Joined At" field. If the value is in the range [DUNGEON_JOINED_AT_BIDOOF, DUNGEON_DUMMY_0xE3], this check will return true.
bool8 IsSpecialStoryAlly(struct monster *monster);
// Checks if a monster does not gain experience.
// This basically just inverts IsSpecialStoryAlly, with the exception of also checking for the "Joined At" field being DUNGEON_CLIENT (set for mission clients).
bool8 IsExperienceLocked(struct monster *monster);

#endif //PMDSKY_JOINED_AT_CHECKS_H
