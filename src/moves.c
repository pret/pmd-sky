#include "moves.h"
#include "move_data.h"

extern struct move_data_table_outer DUNGEON_MOVE_TABLES;

extern s16 MULTITALENT_PP_BOOST_AMOUNT;
extern s16 EXCLUSIVE_ITEM_PP_BOOST_AMOUNT;
extern s16 UNKNOWN_PP_BOOST_AMOUNT;

u32 GetMaxPp(struct move *move)
{
    s16 pp = DUNGEON_MOVE_TABLES.moves->moves[move->id].pp;

    if (move->flags2 & MOVE_FLAG_MULTITALENT_PP_BOOST)
        pp += MULTITALENT_PP_BOOST_AMOUNT;

    if (move->flags2 & MOVE_FLAG_EXCLUSIVE_ITEM_PP_BOOST)
        pp += EXCLUSIVE_ITEM_PP_BOOST_AMOUNT;

    if (move->flags2 & MOVE_FLAG_UNKNOWN_PP_BOOST)
        pp += UNKNOWN_PP_BOOST_AMOUNT;

    if (pp > 99)
        pp = 99;

    return pp;
}
