#ifndef PMDSKY_OVERLAY_29_02344AF8_H
#define PMDSKY_OVERLAY_29_02344AF8_H

struct unk_023531A4 {
    u8 field_0x0[4];
};

#include "util.h"

#include "dungeon_mode.h"

// Checks if an entity pointer points to a valid entity (not entity type 0, which represents no entity).
bool8 EntityIsValid__02344AF8(struct entity *entity);
void ov29_02344B1C(void);
void ov29_02344B30(void);
void PrepareItemForPrinting__02345728(s32 a, s32 b);
void PrepareItemForPrinting__02345754(s32 a, s32 b);

#endif //PMDSKY_OVERLAY_29_02344AF8_H
