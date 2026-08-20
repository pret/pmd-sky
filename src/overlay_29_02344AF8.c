#include "overlay_29_02344AF8.h"
#include "main_02001188.h"
#include "overlay_29_0234B024.h"

extern bool8 ov29_023537B0;

#include "dungeon_util_static.h"

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
