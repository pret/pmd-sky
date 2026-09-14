#include "overlay_29_022E45B8.h"
#include "dg_effect.h"

extern s32 GetEffectAnimationWanOffset(s32 id);
extern void PlaySeByIdIfShouldDisplayEntity(struct entity *entity, s32 se_id);

void ov29_022E45B8(struct entity *entity)
{
    PlaySeByIdIfShouldDisplayEntity(entity, 0x227);
}

void ov29_022E45CC(struct entity *entity)
{
}

void ov29_022E45D0(struct entity *a, struct entity *b)
{
    PlayEffectAnimationEntity(b, 0x2F, 1, GetEffectAnimationWanOffset(0x2F),
                              2, 0, -1, 0);
    PlayEffectAnimationEntity(a, 0x30, 1, GetEffectAnimationWanOffset(0x30),
                              2, 0, -1, 0);
}
