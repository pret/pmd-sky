#include "main_02058FA4.h"
#include "common.h"

extern struct team_member_table *TEAM_MEMBER_TABLE_PTR;

bool8 ExplorerMazeMonsterExists(void)
{
    return TEAM_MEMBER_TABLE_PTR->explorer_maze_monsters[0].id != MONSTER_NONE;
}
