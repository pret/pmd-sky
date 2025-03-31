#ifndef PMDSKY_DUNGEON_POKEMON_ATTRIBUTES_1_H
#define PMDSKY_DUNGEON_POKEMON_ATTRIBUTES_1_H

#include "dungeon_mode.h"

// Returns whether a certain monster can see other invisible monsters.
// To be precise, this function returns true if the monster is holding Goggle Specs or if it has the status status::STATUS_EYEDROPS.
bool8 CanSeeInvisibleMonsters(struct entity *entity);
// Returns whether a monster is set to use a specific tactic.
bool8 IsTacticSet(struct entity *entity, enum tactic_id tactic_id);
// Returns whether a certain monster is under the effect of status::STATUS_DROPEYE.
bool8 HasDropeyeStatus(struct entity* entity);
// Checks if a monster has a certain IQ skill enabled.
bool8 IqSkillIsEnabled(struct entity *entity, enum iq_skill_id iq_skill);

#endif //PMDSKY_DUNGEON_POKEMON_ATTRIBUTES_1_H
