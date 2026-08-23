#include "overlay_29_02344AF8.h"
#include "dungeon_util_static.h"
#include "main_02001188.h"
#include "overlay_29_0234B024.h"

extern struct unk_023531A4 ov29_023531A4;
extern struct unk_023531A4 ov29_023531BC;
extern bool8 ov29_023537B0;

extern void SubstitutePlaceholderItemTags(s32 tag_id, struct item *item, struct unk_023531A4 *param_3);

bool8 EntityIsValid__02344AF8(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return GetEntityType(entity) != ENTITY_NOTHING;
}

void ov29_02344B1C(void)
{
    ov29_023537B0 = TRUE;
}

void ov29_02344B30(void)
{
    ov29_023537B0 = FALSE;
}

void PrepareItemForPrinting__02345728(s32 tag_id, struct item *item)
{
    SetPreprocessorArgsIdVal(tag_id, tag_id | 0x40000);
    SubstitutePlaceholderItemTags(tag_id, item, &ov29_023531BC);
}

void PrepareItemForPrinting__02345754(s32 tag_id, struct item *item)
{
    SetPreprocessorArgsIdVal(tag_id, tag_id | 0x40000);
    SubstitutePlaceholderItemTags(tag_id, item, &ov29_023531A4);
}
