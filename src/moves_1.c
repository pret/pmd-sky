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

void InitMoveCheckId(struct move* move, enum move_id move_id)
{
    if (move_id == 0) {
        move->flags0 = 0;
        return;
    }
    move->flags0 = MOVE_FLAG_ENABLED_FOR_AI | MOVE_FLAG_EXISTS;
    move->flags2 = 0;
    move->id = move_id;
    move->pp = GetMaxPp(move);
    move->ginseng = 0;
}

void GetInfoMoveGround(struct ground_move* move, enum move_id move_id)
{
    move->flags0 = MOVE_FLAG_ENABLED_FOR_AI | MOVE_FLAG_EXISTS;
    move->id = move_id;
    move->ginseng = 0;
}
