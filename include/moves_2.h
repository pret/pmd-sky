#ifndef PMDSKY_MOVES_2_H
#define PMDSKY_MOVES_2_H

#include "move.h"
#include "util.h"

// Gets the move target-and-range field.
s16 GetMoveTargetAndRange(struct move *move, bool8 is_ai);
// Gets the type of a move
enum type_id GetMoveType(struct move* move);

extern u8 _02098D64[];
extern s32 IsInvalidMoveset(s16 moveset_id);
u8 *GetMovesetLevelUpPtr(s16 monster_id);
u8 *GetMovesetHmTmPtr(s16 monster_id);
u8 *GetMovesetEggPtr(s16 monster_id);

#endif //PMDSKY_MOVES_2_H
