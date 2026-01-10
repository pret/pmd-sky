#ifndef PMDSKY_MAIN_0201398C_H
#define PMDSKY_MAIN_0201398C_H

#include "move.h"
#include "common.h"

s16 GetMoveAiWeight(struct move *move);
u8 GetMoveNbStrikes(struct move* move);
s16 GetMoveBasePower(struct move* move);
s16 GetMoveBasePowerGround(struct ground_move* move);


#endif //PMDSKY_MAIN_0201398C_H
