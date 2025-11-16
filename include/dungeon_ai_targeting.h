#ifndef PMDSKY_DUNGEON_AI_TARGETING_H
#define PMDSKY_DUNGEON_AI_TARGETING_H

#include "dungeon_mode.h"

// Checks whether an AI-controlled monster should try to avoid the first hit in battle.
// monster: Entity pointer
// should_avoid: If true, this function always returns true.
// return: True if the monster should try to avoid the first hit in battle.
bool8 ShouldAvoidFirstHit(struct entity *monster, bool8 should_avoid);
// Checks if a monster should run away from other monsters
// return: True if the monster should run away, false otherwise
bool8 ShouldMonsterRunAway(struct entity *monster);
// Calls ShouldMonsterRunAway and returns its result. It also calls DisplayRunAwayIfTriggered if the result was true.
// monster: Entity pointer
// show_run_away_effect: Boolean value. If true, display a visual "poof" effect if the Run Away ability caused the monster to run away.
// return: Result of the call to ShouldMonsterRunAway
bool8 ShouldMonsterRunAwayAndShowEffect(struct entity *monster, bool8 show_run_away_effect);

#endif //PMDSKY_DUNGEON_AI_TARGETING_H
