#ifndef PMDSKY_MAIN_0205C73C_H
#define PMDSKY_MAIN_0205C73C_H

#include "mission.h"

struct unkStruct_0205C8E0 {
    u8 unk0;
    u8 unk1;
    s16 unk2;
};

void sub_0205C73C(void);
void sub_0205C75C(void);
bool8 IsMissionSuspendedAndValid(struct mission *mission);
bool8 sub_0205C870(enum mission_reward_type type, enum item_id* item1, enum item_id* item2);
bool8 sub_0205C8E0(struct unkStruct_0205C8E0 *p1, struct unkStruct_0205C8E0 *p2);
bool8 AreMissionsEquivalent(struct mission* mission1, struct mission* mission2);

#endif //PMDSKY_MAIN_0205C73C_H
