#include "moves_3.h"
#include "move_data.h"

extern struct move_data_table_outer DUNGEON_MOVE_TABLES;

bool8 IsThawingMove(struct move *move)
{
    return DUNGEON_MOVE_TABLES.moves->moves[move->id].ai_can_use_against_frozen;
}

bool8 IsUsableWhileTaunted(struct move *move)
{
    return DUNGEON_MOVE_TABLES.moves->moves[move->id].usable_while_taunted;
}

u16 GetMoveRangeId(struct move *move)
{
    return DUNGEON_MOVE_TABLES.moves->moves[move->id].range_string_idx;
}

s32 GetMoveActualAccuracy(s32 move_id)
{
    struct move_data *move;
    u8 max_ginseng_boost;
    u8 global_acc;

    move = &DUNGEON_MOVE_TABLES.moves->moves[move_id];
    max_ginseng_boost = move->max_ginseng_boost;
    if (max_ginseng_boost == 0) {
        return move->accuracy[ACCURACY_1];
    }
    if (max_ginseng_boost == 0x63) {
        global_acc = move->accuracy[ACCURACY_1];
        if (global_acc == 0x7D) {
            return move->accuracy[ACCURACY_2];
        }
        return ((global_acc * move->accuracy[ACCURACY_2]) / 100);
    }
    return 0;
}

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

