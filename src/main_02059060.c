#include "main_02058FA4.h"
#include "common.h"
#include "main_0202593C.h"
#include "main_02058FA4.h"

extern struct team_member_table *TEAM_MEMBER_TABLE_PTR;

extern s32 GetLanguageType(void);
extern void StrncpySimpleNoPadSafe(u8* dest, const u8* src, u32 n);
extern void sub_02050990(struct WriteMonsterInfoToSave_struct *ptr, void *start_addr, u32 total_len);
extern void WriteMonsterToSave(struct WriteMonsterInfoToSave_struct *write_info, struct ground_monster *monster);
extern void CopyBitsTo(void *ctx, void *src, s32 nbits);
extern void sub_020509BC(struct WriteMonsterInfoToSave_struct *ptr);

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

void sub_020590DC(u64 param0)
{
    TEAM_MEMBER_TABLE_PTR->field_0x9878 = param0;
}

struct ground_monster* GetExplorerMazeMonster(s16 entry_number)
{
    return TEAM_MEMBER_TABLE_PTR->explorer_maze_monsters + entry_number;
}

s32 WriteMonsterInfoToSave(void* start_addr, u32 total_len)
{
    struct WriteMonsterInfoToSave_struct local_struct;

    sub_02050990(&local_struct, start_addr, total_len);

    for (s32 i = 0; i < MAX_GROUND_TEAM_MEMBERS; i++)
    {
        WriteMonsterToSave(&local_struct, &TEAM_MEMBER_TABLE_PTR->members[i]);
    }

    CopyBitsTo(&local_struct, &TEAM_MEMBER_TABLE_PTR->field_0x9878, 64);
    CopyBitsTo(&local_struct, &TEAM_MEMBER_TABLE_PTR->explorer_maze_team_native_language, 4);
    CopyBitsTo(&local_struct, &TEAM_MEMBER_TABLE_PTR->field_0x9881, 4);
    CopyBitsTo(&local_struct, &TEAM_MEMBER_TABLE_PTR->explorer_maze_team_name, 80);

    for (s32 i = 0; i < 4; i++)
    {
        WriteMonsterToSave(&local_struct, &TEAM_MEMBER_TABLE_PTR->explorer_maze_monsters[i]);
    }

    sub_020509BC(&local_struct);

    return local_struct.result;
}
