#include "moves_3.h"
#include "move_data.h"
#include "main_0202593C.h"

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

u8 *GetMoveMessageFromId(s32 move_id)
{

#ifdef JAPAN
    #define MESSAGE_ID 0x153C
#else
    #define MESSAGE_ID 0xF14  
#endif
    
    return StringFromId((u16)(DUNGEON_MOVE_TABLES.moves->moves[move_id].message_string_idx + MESSAGE_ID));
}

#define GET_BIT(BYTE, N) ((u8)(BYTE & (1 << N) ? 1 : 0))

s32 GetNbMoves(struct moves *moves)
{
    s32 index;
    s32 num_moves;

    num_moves = 0;

    for(index = 0; index < 4; index++)
    {
        // struct move needs to be size 0x6 for this to match
        //u8 flag = moves->moves[index].flags0 & 1;
        
        // fake
        u8 flag = *(u8*)((u32)moves + (index * 6));

        if(GET_BIT(flag, 0))
            num_moves++;
        
    }
    return num_moves;
}
