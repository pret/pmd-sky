#ifndef PMDSKY_DUNGEON_POKEMON_ATTRIBUTES_1_H
#define PMDSKY_DUNGEON_POKEMON_ATTRIBUTES_1_H

#include "dungeon_mode.h"

// Returns whether a certain monster can see other invisible monsters.
// To be precise, this function returns true if the monster is holding Goggle Specs or if it has the status status::STATUS_EYEDROPS.
bool8 CanSeeInvisibleMonsters(struct entity *entity);
// Returns whether a monster is set to use a specific tactic.
bool8 IsTacticSet(struct entity *entity, enum tactic_id tactic_id);

#endif //PMDSKY_DUNGEON_POKEMON_ATTRIBUTES_1_H
