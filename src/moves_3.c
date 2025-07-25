#include "moves_3.h"
#include "move_data.h"

extern struct move_data_table_outer DUNGEON_MOVE_TABLES;

bool8 IsUsableWhileTaunted(struct move *move)
{
    return DUNGEON_MOVE_TABLES.moves->moves[move->id].usable_while_taunted;
}
