#include "overlay_29_02321238.h"

extern void ov29_0232119C(struct entity *entity, s32 a, s32 b);

void ov29_02321238(struct entity *entity)
{
    ov29_0232119C(entity, 0, 1);
}

void ov29_0232124C(struct entity *entity)
{
    ov29_0232119C(entity, 1, 1);
}

void ov29_02321260(struct entity *entity)
{
    ov29_0232119C(entity, 0, 0);
}
