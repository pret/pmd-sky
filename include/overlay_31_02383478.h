#ifndef PMDSKY_OVERLAY_31_02383478_H
#define PMDSKY_OVERLAY_31_02383478_H

#include "dungeon_mode.h"

struct loc_struct {
    u8 PAD_0x0[0x1192];
    u8 field_0x1192;
    u8 field_0x1193;
    s8 field_0x1194;
    s8 field_0x1195;
    u8 PAD_0x1196[6];
    s16* field_0x119C;
    u8 PAD_0x11A0[17];
    u8 field_0x11b1;
    u8 field_0x11B2;
    u8 field_0x11B3;
    struct item* field_0x11B4;
    u8 PAD_0x11B8[64];
    u8 field_0x11F8[127];
    u8 field_0x1277;
};

char* ov31_02383478(char* arg1, s32 arg2, u32 arg3);
// Checks if an entity pointer points to a valid entity (not entity type 0, which represents no entity).
bool8 EntityIsValid__02383658(struct entity *entity);

#endif //PMDSKY_OVERLAY_31_02383478_H
