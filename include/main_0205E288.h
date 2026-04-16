#ifndef PMDSKY_MAIN_0205E288_H
#define PMDSKY_MAIN_0205E288_H

#include "mission.h"

bool8 sub_0205E1E8(struct mission* mission);
bool8 IsMissionTypeSpecialEpisode(struct mission* mission);
bool8 sub_0205E258(struct mission* mission);
struct unkStruct_0205E3F8 {
    u32 data[8];
};

bool8 sub_0205E288(struct mission *mission, u32 val, u8 *ptr2);
bool8 sub_0205E2B8(u32 arg0, u8 *arg1);
bool8 sub_0205E3F8(struct unkStruct_0205E3F8 *src, s32 limit, struct unkStruct_0205E3F8 *destArray);

#endif //PMDSKY_MAIN_0205E288_H
