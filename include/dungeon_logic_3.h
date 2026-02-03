#ifndef PMDSKY_DUNGEON_LOGIC_3_H
#define PMDSKY_DUNGEON_LOGIC_3_H

#include "dungeon_mode.h"

// Checks if a monster is levitating (has the effect of Levitate and Gravity is not active).
bool8 LevitateIsActive(struct entity* entity);
// Checks if a monster is a given type.
bool8 MonsterIsType(struct entity *entity, enum type_id type_id);

// Checks if the type affected by Gravity
bool8 IsTypeAffectedByGravity(struct entity *entity, enum type_id type);

// Checks if the monster has a type affected by Gravity
bool8 HasTypeAffectedByGravity(struct entity* entity, enum type_id type);

#endif //PMDSKY_DUNGEON_LOGIC_3_H
