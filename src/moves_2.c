#include "moves_2.h"
#include "move_data.h"

extern struct move_data_table_outer DUNGEON_MOVE_TABLES;

s16 GetMoveTargetAndRange(struct move *move, bool8 is_ai)
{
    return DUNGEON_MOVE_TABLES.moves->moves[move->id].target_range[is_ai];
}

enum type_id GetMoveType(struct move* move)
{
    return DUNGEON_MOVE_TABLES.moves->moves[move->id].type;
}

u8 *GetMovesetLevelUpPtr(s16 monster_id)
{
    s16 id = monster_id;
    if (id >= 0x258)
        id = (s16)(id - 0x258);
    if (IsInvalidMoveset(id) != 0)
        return _02098D64;
    return DUNGEON_MOVE_TABLES.movesets[id].levelup_moves;
}

s32 IsInvalidMoveset(s16 moveset_id)
{
    if (moveset_id <= 0)
        goto invalid;
    if (moveset_id < 0x229)
        goto valid;
invalid:
    return 1;
valid:
    return 0;
}

u8 *GetMovesetHmTmPtr(s16 monster_id)
{
    s16 id = monster_id;
    if (id >= 0x258)
        id = (s16)(id - 0x258);
    if (IsInvalidMoveset(id) != 0)
        return _02098D64;
    return DUNGEON_MOVE_TABLES.movesets[id].hmtm_moves;
}

u8 *GetMovesetEggPtr(s16 monster_id)
{
    s16 id = monster_id;
    if (id >= 0x258)
        id = (s16)(id - 0x258);
    if (IsInvalidMoveset(id) != 0)
        return _02098D64;
    return DUNGEON_MOVE_TABLES.movesets[id].egg_moves;
}
