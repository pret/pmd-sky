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
u8 sub_0205C870(u32 type, s16 *ptr1, s16 *ptr2);
bool8 sub_0205C8E0(struct unkStruct_0205C8E0 *p1, struct unkStruct_0205C8E0 *p2);

#endif //PMDSKY_MAIN_0205C73C_H
