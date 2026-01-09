#include "main_02013C04.h"
#include "move_data.h"

extern struct move_data_table_outer DUNGEON_MOVE_TABLES;

s16 GetMoveBasePowerFromId(s32 move_id)
{
    struct move_data *move;
    move = &DUNGEON_MOVE_TABLES.moves->moves[move_id];
    return move->base_power;
}

bool32 IsMoveRangeStringUser(struct move *move)
{
    return DUNGEON_MOVE_TABLES.moves->moves[move->id].range_string_idx == MOVE_RANGE_STRING_USER;
}
