#include "main_02058FA4.h"
#include "common.h"
#include "main_020251AC.h"

extern struct team_member_table *TEAM_MEMBER_TABLE_PTR;

void sub_02055F04(struct ground_monster *dest, const u8 *src);
void sub_0204D018(u32 a, u32 b);

bool8 ExplorerMazeMonsterExists(void)
{
    return TEAM_MEMBER_TABLE_PTR->explorer_maze_monsters[0].id != MONSTER_NONE;
}

void sub_02058FCC(struct unkStruct_sub_02058FCC *ptr)
{
    if (ptr != NULL)
    {
        TEAM_MEMBER_TABLE_PTR->explorer_maze_team_native_language = ptr->explorer_maze_team_native_language;
        TEAM_MEMBER_TABLE_PTR->field_0x9881 = ptr->field_0x1;

        StrncpySimple(TEAM_MEMBER_TABLE_PTR->explorer_maze_team_name, ptr->explorer_maze_team_name, 20);

        for (s32 i = 0; i < 4; i++)
        {
            sub_02055F04(&TEAM_MEMBER_TABLE_PTR->explorer_maze_monsters[i], ptr->field_0x18[i]);
        }

        sub_0204D018(0xbe, 1);
    }
}
