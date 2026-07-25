#ifndef PMDSKY_DUNGEON_AI_ITCM_H
#define PMDSKY_DUNGEON_AI_ITCM_H

#include "dungeon_ai_attack.h"
#include "dungeon_mode.h"

// Determines if an AI-controlled monster will use a move and which one it will use.
void ChooseAiMove(struct entity *monster);

void sub_01FFBD20(struct entity *monster, struct entity *target);
void sub_01FFBDF4(struct entity *monster);
struct entity *LightningRodStormDrainCheck(struct entity *monster, struct entity* target, struct move *move, s32 arg3);
bool8 sub_01FFBF78(struct entity *pokemon, struct entity *target);

#endif //PMDSKY_DUNGEON_AI_ITCM_H
