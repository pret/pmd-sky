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
// Updates the IQ skill flags of a monster.
// If the monster is a team member, copies monster::iq_skill_menu_flags to monster::iq_skill_flags. If the monster is an enemy, enables all the IQ skills it can learn (except a few that are only enabled in enemies that have a certain amount of IQ).
// If the monster is an enemy, it also sets its tactic to TACTIC_GO_AFTER_FOES.
// Called after exiting the IQ skills menu or after an enemy spawns.
void UpdateIqSkills(struct monster *monster);

#endif //PMDSKY_DUNGEON_POKEMON_ATTRIBUTES_1_H
