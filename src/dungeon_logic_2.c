#include "dungeon_logic_2.h"
#include "main_0205283C.h"

bool8 MonsterCanThrowItems(struct monster *monster)
{
    return CanThrowItems(monster->id) ? TRUE : FALSE;
}
