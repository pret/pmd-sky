#include "main_0205C73C.h"
#include "mission.h"

extern struct mission_deliver_list MISSION_DELIVER_LIST_PTR;
extern u8 _022B6F10[];

extern void sub_020600CC(void);
extern void ClearMissionData(struct mission* mission);
extern bool8 IsMissionValid(struct mission *mission);

void sub_0205C73C(void)
{
    MISSION_DELIVER_LIST_PTR.unk18 = _022B6F10;
    sub_020600CC();
}

void sub_0205C75C(void)
{
    for (s32 i = 0; i < 8; i++)
    {
        ClearMissionData((struct mission*) (MISSION_DELIVER_LIST_PTR.unk18 + (s32)(s8)i * 32));
    }

    for (s32 i = 0; i < 8; i++)
    {
        ClearMissionData((struct mission*) (MISSION_DELIVER_LIST_PTR.unk18 + 0x100 + (s32)(s8)i * 32));
    }

    for (s32 i = 0; i < 8; i++)
    {
        ClearMissionData((struct mission*) (MISSION_DELIVER_LIST_PTR.unk18 + 0x200 + (s32)(s8)i * 32));
    }

    ClearMissionData((struct mission*) (MISSION_DELIVER_LIST_PTR.unk18 + 0x300));
    ClearMissionData((struct mission*) (MISSION_DELIVER_LIST_PTR.unk18 + 0x320));

    for (s32 i = 0; i < 16; i++)
    {
        MISSION_DELIVER_LIST_PTR.unk18[i * 12 + 0x340] = 0xFF;
        MISSION_DELIVER_LIST_PTR.unk18[i * 12 + 0x341] = 1;
        *(u32 *)&MISSION_DELIVER_LIST_PTR.unk18[i * 12 + 0x344] = 0;
        *(u32 *)&MISSION_DELIVER_LIST_PTR.unk18[i * 12 + 0x348] = 0;
    }
}

bool8 IsMissionSuspendedAndValid(struct mission *mission)
{
    if (mission->status != MISSION_STATUS_SUSPENDED)
    {
        return FALSE;
    }

    return IsMissionValid(mission);
}

u8 sub_0205C870(u32 type, s16 *ptr1, s16 *ptr2)
{
    switch (type)
    {
        case 0:
        case 1:
        case 2:
        case 3:
        case 4:
            return *ptr1 == *ptr2;
        case 5:
            return TRUE;
        case 6:
            return *ptr1 == *ptr2;
        default:
            return FALSE;
    }
}
