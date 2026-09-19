#ifndef PMDSKY_OVERLAY_29_022E37B8_H
#define PMDSKY_OVERLAY_29_022E37B8_H

#include "dungeon_mode.h"

struct unk_0201C000 {
    u16 field_0x0;
    u16 field_0x2;
    u16 field_0x4;
    u16 field_0x6;
    u16 field_0x8;
    u16 field_0xa;
};

struct unk_022BF274 {
    s32 field_0x0;
    s32 field_0x4;
    s32 field_0x8;
    s16 field_0xc;
    s16 field_0xe;
    s16 field_0x10;
    s16 field_0x12;
    s8 field_0x14;
    s32 field_0x18;
    struct unk_0201C000 field_0x1c;
    s32 field_0x28;
};

s32 PlayEffectAnimationEntity(struct entity *entity, s32 id, s32 param_3, u8 param_4, s32 param_5, u8 param_6, s16 param_7, struct unk_0201C000 *param_8);
// Checks if an entity pointer points to a valid entity (not entity type 0, which represents no entity).
bool8 EntityIsValid__022E37B8(struct entity *entity);

#endif //PMDSKY_OVERLAY_29_022E37B8_H
