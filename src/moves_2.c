#include "moves_2.h"
#include "move_data.h"

extern struct move_data_table_outer DUNGEON_MOVE_TABLES;

s16 GetMoveTargetAndRange(struct move *move, bool8 is_ai)
{
    return DUNGEON_MOVE_TABLES.moves->moves[move->id].target_range[is_ai];
}
