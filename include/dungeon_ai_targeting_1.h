#ifndef PMDSKY_DUNGEON_AI_TARGETING_1_H
#define PMDSKY_DUNGEON_AI_TARGETING_1_H

#include "dungeon_mode.h"
#include "targeting.h"

// Called to check if a monster should treat another as an ally, enemy, or ignore it.
// (Examples of the "ignore" case: target is a shopkeeper, there is a decoy on the floor, etc.)
//
// r0: Pointer to entity 1
// r1: Pointer to entity 2
// r2: If false, return TREATMENT_IGNORE if entity 2 is invisible and entity 1 cannot see invisible monsters
// r3: If true, return TREATMENT_IGNORE if entity 1 is a team member and entity 2 has the STATUS_PETRIFIED status
// return: Treatment that monster 1 should apply to monster 2
enum monster_treatment GetTreatmentBetweenMonsters(struct entity *pokemon, struct entity *target_pokemon, bool8 ignore_invisible, bool8 check_petrified);

#endif //PMDSKY_DUNGEON_AI_TARGETING_1_H
