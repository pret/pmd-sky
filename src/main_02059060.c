#include "main_02059060.h"
#include "common.h"
#include "main_0202593C.h"
#include "main_02058FA4.h"

extern struct team_member_table *TEAM_MEMBER_TABLE_PTR;

s32 GetLanguageType(void);
void StrncpySimpleNoPadSafe(u8* dest, const u8* src, u32 n);

void GetExplorerMazeTeamName(u8 *dest)
{
    s8 *explorer_maze_team_native_language = &TEAM_MEMBER_TABLE_PTR->explorer_maze_team_native_language;
    if (ExplorerMazeMonsterExists())
    {
        if (GetLanguageType() == *explorer_maze_team_native_language)
        {
            u8 *explorer_maze_team_name = explorer_maze_team_native_language + 2;
#ifdef JAPAN
            StrncpySimpleNoPadSafe(dest, explorer_maze_team_name, 5);
#else
            StrncpySimpleNoPadSafe(dest, explorer_maze_team_name, 0xA);
#endif
            return;
        }
    }

#ifdef JAPAN
    GetStringFromFileVeneer(dest, 0x4C6);
#else
    GetStringFromFileVeneer(dest, 0x235);
#endif
}

u64 sub_020590C0(void)
{
    return TEAM_MEMBER_TABLE_PTR->field_0x9878;
}
