#include "moves_1.h"

#include "moves.h"

void InitMove(struct move *move, enum move_id move_id)
{
    move->flags0 = MOVE_FLAG_ENABLED_FOR_AI | MOVE_FLAG_EXISTS;
    move->flags2 = 0;
    move->id = move_id;
    move->pp = GetMaxPp(move);
    move->ginseng = 0;
}
