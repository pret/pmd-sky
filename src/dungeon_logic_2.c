#include "dungeon_logic_2.h"

extern bool8 CanThrowItems(s16 monster_id);

bool8 MonsterCanThrowItems(struct monster *monster)
{
    return CanThrowItems(monster->id) ? TRUE : FALSE;
}
