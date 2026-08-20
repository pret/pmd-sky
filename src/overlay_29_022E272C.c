#include "overlay_29_022E272C.h"

extern bool8 ShouldDisplayEntity(struct entity *entity, s32 a);

bool8 ShouldDisplayEntityWrapper(struct entity *entity)
{
    return ShouldDisplayEntity(entity, FALSE);
}

bool8 ov29_022E273C(struct entity *entity)
{
    return ShouldDisplayEntity(entity, TRUE);
}
