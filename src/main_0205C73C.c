#include "main_0205C73C.h"
#include "mission.h"

extern struct mission_deliver_list MISSION_DELIVER_LIST_PTR;
extern u8 _022B6F10[];

extern void sub_020600CC(void);
extern void ClearMissionData(struct mission* mission);

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
