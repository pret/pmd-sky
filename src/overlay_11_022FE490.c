#include "overlay_11_022FE490.h"

s16 GetIdLivePerformer(struct unk_022FE490 *p)
{
    return p->field_0x4;
}

void GetCollisionBoxLivePerformer(struct unk_022FE490 *p, struct unk_022FE498 *out)
{
    *out = *(struct unk_022FE498 *) &p->field_0x10;
}
