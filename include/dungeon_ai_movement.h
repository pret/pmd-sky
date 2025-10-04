#ifndef PMDSKY_DUNGEON_AI_MOVEMENT_H
#define PMDSKY_DUNGEON_AI_MOVEMENT_H

#include "dungeon_mode.h"

// Used by the AI to determine the direction in which a monster should move
// monster: Entity pointer
// show_run_away_effect: If the monster becomes terrified, this flag determines whether the "poof" visual effect will show.
void AiMovement(struct entity *monster, bool8 show_run_away_effect);
// Calculates the target position of an AI-controlled monster and stores it in the monster's ai_target_pos field
bool8 CalculateAiTargetPos(struct entity *monster);

#endif //PMDSKY_DUNGEON_AI_MOVEMENT_H
