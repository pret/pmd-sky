#include "moves_4.h"

extern struct move_data_table_outer DUNGEON_MOVE_TABLES;

u8 GetMoveAccuracyOrAiChance(struct move *move, enum accuracy_type which)
{
    return DUNGEON_MOVE_TABLES.moves->moves[move->id].accuracy[which];
}

u8 GetMoveBasePp(struct move* move)
{
    return DUNGEON_MOVE_TABLES.moves->moves[move->id].pp;
}
