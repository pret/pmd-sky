#ifndef PMDSKY_DUNGEON_AI_TARGETING_1_H
#define PMDSKY_DUNGEON_AI_TARGETING_1_H

#include "dungeon_mode.h"
#include "targeting.h"

// Called to check if a monster should treat another as an ally, enemy, or ignore it.
// (Examples of the "ignore" case: target is a shopkeeper, there is a decoy on the floor, etc.)
//
// entity1: Pointer to entity 1
// entity2: Pointer to entity 2
// see_invisible_targets: If false, return TREATMENT_IGNORE if entity 2 is invisible and entity 1 cannot see invisible monsters
// ignore_petrified_targets: If true, return TREATMENT_IGNORE if entity 1 is a team member and entity 2 has the STATUS_PETRIFIED status
// return: Treatment that monster 1 should apply to monster 2
enum monster_treatment GetTreatmentBetweenMonsters(struct entity *entity1, struct entity *entity2, bool8 see_invisible_targets, bool8 ignore_petrified_targets);

#endif //PMDSKY_DUNGEON_AI_TARGETING_1_H
