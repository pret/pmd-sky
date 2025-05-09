#ifndef PMDSKY_DUNGEON_LOGIC_H
#define PMDSKY_DUNGEON_LOGIC_H

#include "dungeon_mode.h"

// Checks if a monster has any "negative" status conditions. This includes a wide variety of non-self-inflicted statuses that could traditionally be viewed as actual "status conditions", as well as speed being lowered and moves being sealed.
// monster: entity pointer
// check_held_item: flag for whether to check for the held item (see IsMonsterVisuallyImpaired)
bool8 MonsterHasNegativeStatus(struct entity *monster, bool8 check_held_item);

#endif //PMDSKY_DUNGEON_LOGIC_H
