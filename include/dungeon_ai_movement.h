#ifndef PMDSKY_DUNGEON_AI_MOVEMENT_H
#define PMDSKY_DUNGEON_AI_MOVEMENT_H

#include "dungeon_mode.h"

// Calls ShouldMonsterRunAwayAndShowEffect. If the result is true, returns true. Otherwise, returns true only if the monster's behavior field is equal to monster_behavior::BEHAVIOR_FLEEING_OUTLAW.
// monster: Entity pointer
// show_run_away_effect: Boolean value. If true, display a visual "poof" effect if the Run Away ability caused the monster to run away.
// return: True if ShouldMonsterRunAway returns true or the monster is a fleeing outlaw
bool8 ShouldMonsterRunAwayAndShowEffectOutlawCheck(struct entity *monster, bool8 show_run_away_effect);
// Used by the AI to determine the direction in which a monster should move
// monster: Entity pointer
// show_run_away_effect: If the monster becomes terrified, this flag determines whether the "poof" visual effect will show.
void AiMovement(struct entity *monster, bool8 show_run_away_effect);
// Calculates the target position of an AI-controlled monster and stores it in the monster's ai_target_pos field
bool8 CalculateAiTargetPos(struct entity *monster);

#endif //PMDSKY_DUNGEON_AI_MOVEMENT_H
