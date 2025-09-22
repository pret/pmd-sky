#ifndef PMDSKY_DUNGEON_LOGIC_3_H
#define PMDSKY_DUNGEON_LOGIC_3_H

#include "dungeon_mode.h"

bool8 LevitateIsActive(struct entity* entity);
// Checks if a monster is a given type.
bool8 MonsterIsType(struct entity *entity, enum type_id type_id);

#endif //PMDSKY_DUNGEON_LOGIC_3_H
