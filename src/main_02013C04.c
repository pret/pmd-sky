#include "main_02013C04.h"
#include "move_data.h"

extern struct move_data_table_outer DUNGEON_MOVE_TABLES;

bool32 IsMoveRangeStringUser(struct move *move)
{
    return DUNGEON_MOVE_TABLES.moves->moves[move->id].range_string_idx == MOVE_RANGE_STRING_USER;
}
