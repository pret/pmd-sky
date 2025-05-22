#include "dungeon_logic_2.h"
#include "main_02052950.h"

bool8 MonsterCanThrowItems(struct monster *monster)
{
    return CanThrowItems(monster->id) ? TRUE : FALSE;
}
