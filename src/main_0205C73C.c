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

bool8 sub_0205C870(enum mission_reward_type type, enum item_id* item1, enum item_id* item2)
{
    switch (type)
    {
        case 0:
        case 1:
        case 2:
        case 3:
        case 4:
            return (s16) *item1 == (s16) *item2;
        case 5:
            return TRUE;
        case 6:
            return (s16) *item1 == (s16) *item2;
        default:
            return FALSE;
    }
}

bool8 sub_0205C8E0(struct unkStruct_0205C8E0 *p1, struct unkStruct_0205C8E0 *p2)
{
    u8 type = p1->unk0;

    if (type != p2->unk0)
        return FALSE;

    if (type == 0)
    {
        if ((u16)p1->unk2 != (u16)p2->unk2)
            return FALSE;
    }

    if (type == 1)
    {
        if (p1->unk2 != p2->unk2)
            return FALSE;
    }

    return TRUE;
}

bool8 AreMissionsEquivalent(struct mission* mission1, struct mission* mission2)
{
    if (mission1->type != mission2->type) {
        return FALSE;
    }
    
    if (mission1->subtype.other != mission2->subtype.other) {
        return FALSE;
    }
    
    if (mission1->dungeon_id != mission2->dungeon_id) {
       return FALSE;
    }
    
    if (mission1->floor != mission2->floor) {
       return FALSE;
    }
    
    if (mission1->description_id != mission2->description_id) {
        return FALSE;
    }
    
    if (*(s16*)&mission1->client != *(s16*)&mission2->client) {
        return FALSE;
    }
    
    if (*(s16*)&mission1->target != *(s16*)&mission2->target) {
        return FALSE;
    }
    
    if (*(s16*)&mission1->outlaw_backup_species != *(s16*)&mission2->outlaw_backup_species) {
        return FALSE;
    }
    
    if (*(s16*)&mission1->item_wanted != *(s16*)&mission2->item_wanted) {
        return FALSE;
    }
    
    if (mission1->reward_type != mission2->reward_type) {
        return FALSE;
    }
    
    if (sub_0205C870(mission1->reward_type, &mission1->item_reward, &mission2->item_reward) == 0) {
        return FALSE;
    }
    
    if (sub_0205C8E0((struct unkStruct_0205C8E0*)&mission1->restriction_type, (struct unkStruct_0205C8E0*)&mission2->restriction_type) != 0) {
        return TRUE;
    }
    
    return FALSE;
}
