#include "overlay_11_022FE58C.h"
#include "overlay_11_022FE490.h"

void SetMovementRangeLivePerformer(struct unk_022FE490 *p, struct unk_022FE498 *a,
        struct unk_022FE498 *b)
{
    *(struct unk_022FE498 *) &p->field_0x2C = *a;
    *(struct unk_022FE498 *) &p->field_0x34 = *b;
}

extern void SetPositionLivePerformer(struct unk_022FE490 *p, struct unk_022FE498 *v);

void GetCollisionBoxCenterLivePerformer(struct unk_022FE490 *p, struct unk_022FE498 *out)
{
    out->field_0x0 = p->field_0x130 + p->field_0x18;
    out->field_0x4 = p->field_0x134 + p->field_0x1C;
}

void SetPositionLivePerformerVeneer(struct unk_022FE490 *p, struct unk_022FE498 *v)
{
    SetPositionLivePerformer(p, v);
}

void GetHeightLivePerformer(struct unk_022FE490 *p, s32 *a, s32 *b)
{
    *a = p->field_0x140;
    *b = p->field_0x144;
}

void SetHeightLivePerformer(struct unk_022FE490 *p, s32 h)
{
    p->field_0x140 = h;
}

void GetDirectionLivePerformer(struct unk_022FE490 *p, s8 *dir)
{
    *dir = p->field_0x12C;
}

void SetDirectionLivePerformer(struct unk_022FE490 *p, s8 dir)
{
    if (dir != -1) {
        p->field_0x12C = dir;
    }
}
