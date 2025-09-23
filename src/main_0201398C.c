#include "main_0201398C.h"
#include "move_data.h"

extern struct move_data_table_outer DUNGEON_MOVE_TABLES;

s16 GetMoveAiWeight(struct move *move)
{
    return DUNGEON_MOVE_TABLES.moves->moves[move->id].ai_weight;
}
