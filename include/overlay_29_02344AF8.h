#ifndef PMDSKY_OVERLAY_29_02344AF8_H
#define PMDSKY_OVERLAY_29_02344AF8_H

#include "util.h"
#include "dungeon_mode.h"

struct unk_023531A4 {
    u8 field_0x0[4];
};

// Checks if an entity pointer points to a valid entity (not entity type 0, which represents no entity).
bool8 EntityIsValid__02344AF8(struct entity *entity);
void ov29_02344B1C(void);
void ov29_02344B30(void);
void PrepareItemForPrinting__02345728(s32 tag_id, struct item *item);
void PrepareItemForPrinting__02345754(s32 tag_id, struct item *item);

#endif //PMDSKY_OVERLAY_29_02344AF8_H
