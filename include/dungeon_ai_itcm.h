#ifndef PMDSKY_DUNGEON_AI_ITCM_H
#define PMDSKY_DUNGEON_AI_ITCM_H

#include "dungeon_mode.h"

struct ai_possible_move
{
    bool8 can_be_used;
    u8 direction;
    s32 weight;
};

void ChooseAiMove(struct entity *monster);

#endif //PMDSKY_DUNGEON_AI_ITCM_H
