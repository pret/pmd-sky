#ifndef PMDSKY_MAIN_0205D11C_H
#define PMDSKY_MAIN_0205D11C_H

#include "dungeon.h"
#include "util.h"
#include "mission.h"

bool8 sub_0205CF58(enum mission_type type, union mission_subtype* subtype, struct dungeon_floor_pair* df_pair);
bool8 sub_0205D008(enum mission_type type, union mission_subtype* subtype, enum monster_id outlaw_backup_species, bool8 arg3);
bool8 sub_0205D11C(u32 r0, u32 r1, s16 r2);
bool8 sub_0205D1F4(struct mission *mission);

#endif //PMDSKY_MAIN_0205D11C_H
