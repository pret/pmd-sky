#ifndef PMDSKY_OVERLAY_29_02308FBC_H
#define PMDSKY_OVERLAY_29_02308FBC_H

#include "dungeon_mode.h"

struct unk_02308FE0 {
    s32 field_0x0;
    s32 field_0x4;
    s32 field_0x8;
    u8 field_0xc;
    u8 field_0xd;
    bool8 field_0xe;
    bool8 field_0xf;
    bool8 field_0x10;
    u8 field_0x11;
    u8 field_0x12;
    u8 field_0x13;
};

// Checks if an entity pointer points to a valid entity (not entity type 0, which represents no entity).
bool8 EntityIsValid__02308FBC(struct entity *entity);
bool8 ApplyDamage(struct entity *attacker, struct entity *defender,
                  struct unk_02308FE0 *damage_data, int a4, int a5,
                  enum damage_source_non_move damage_source, int a7);

#endif //PMDSKY_OVERLAY_29_02308FBC_H
