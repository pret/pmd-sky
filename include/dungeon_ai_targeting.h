#ifndef PMDSKY_DUNGEON_AI_TARGETING_H
#define PMDSKY_DUNGEON_AI_TARGETING_H

#include "dungeon_mode.h"

// Checks if a monster should run away from other monsters
// return: True if the monster should run away, false otherwise
bool8 ShouldMonsterRunAway(struct entity *monster);
// Calls ShouldMonsterRunAway and returns its result. It also calls DisplayRunAwayIfTriggered if the result was true.
// monster: Entity pointer
// show_run_away_effect: Boolean value. If true, display a visual "poof" effect if the Run Away ability caused the monster to run away.
// return: Result of the call to ShouldMonsterRunAway
bool8 ShouldMonsterRunAwayAndShowEffect(struct entity *monster, bool8 show_run_away_effect);

#endif //PMDSKY_DUNGEON_AI_TARGETING_H
