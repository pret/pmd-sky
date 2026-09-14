#ifndef PMDSKY_DUNGEON_LOGIC_4_H
#define PMDSKY_DUNGEON_LOGIC_4_H

#include "dungeon_mode.h"

// Checks if the entity passed is a valid monster, and if it's at low health (below 25% rounded down)
bool8 HasLowHealth(struct entity *entity);
bool8 AreEntitiesAdjacent(struct entity *entity, struct entity *other);
bool8 IsHero(struct entity *entity);
void ov29_022FB718(struct entity *entity);
void ov29_022FB83C(struct entity *entity, bool8 a);
void ov29_022FB920(bool8 a);
bool8 ov29_022FB984(struct entity *entity);
void ov29_022FB98C(struct entity *attacker, struct entity *defender);
bool8 ov29_022FB9BC(struct entity *entity);

#endif //PMDSKY_DUNGEON_LOGIC_4_H
