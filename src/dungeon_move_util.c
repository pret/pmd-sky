#include "dungeon_move_util.h"
#include "dungeon_util_static.h"
#include "move.h"

extern bool8 CanMonsterUseMove(struct entity *monster, struct move *move, bool8 extra_checks);

bool8 CanAiUseMove(struct entity *monster, u32 move_index, bool8 extra_checks)
{
    s32 i;
    struct monster *pokemon_info = GetEntInfo(monster);

    struct move *move = &pokemon_info->moves.moves[move_index];
    if (!MoveExists(move))
        return FALSE;

    if (move->flags0 & MOVE_FLAG_SUBSEQUENT_IN_LINK_CHAIN)
        return FALSE;

    if (move->flags0 & MOVE_FLAG_DISABLED)
        return FALSE;

    if (move->flags2 & MOVE_FLAG_SEALED)
        return FALSE;

    for (i = 0; i < MAX_MON_MOVES; i++) {
        if (CanMonsterUseMove(monster, move, extra_checks))
            return TRUE;

        move++;
        if (move >= &pokemon_info->moves.moves[MAX_MON_MOVES])
            break;

        if (!(move->flags0 & MOVE_FLAG_SUBSEQUENT_IN_LINK_CHAIN))
            break;
    }

    return FALSE;
}
