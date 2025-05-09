#include "moves.h"
#include "move_data.h"

extern struct move_data_table_outer DUNGEON_MOVE_TABLES;

extern s16 MULTITALENT_PP_BOOST_AMOUNT;
extern s16 EXCLUSIVE_ITEM_PP_BOOST_AMOUNT;
extern s16 UNKNOWN_PP_BOOST_AMOUNT;

u32 GetMaxPp(struct move *move)
{
    struct move_data *moves = DUNGEON_MOVE_TABLES.moves->moves;
    s16 pp = moves[move->id].pp;

    if (move->flags2 & MOVE_FLAGS_MULTITALENT_PP_BOOST)
        pp += MULTITALENT_PP_BOOST_AMOUNT;

    if (move->flags2 & MOVE_FLAGS_EXCLUSIVE_ITEM_PP_BOOST)
        pp += EXCLUSIVE_ITEM_PP_BOOST_AMOUNT;

    if (move->flags2 & MOVE_FLAGS_UNKNOWN_PP_BOOST)
        pp += UNKNOWN_PP_BOOST_AMOUNT;

    if (pp > 99)
        pp = 99;

    return pp;
}
