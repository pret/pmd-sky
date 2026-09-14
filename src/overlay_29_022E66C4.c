#include "overlay_29_022E66C4.h"
#include "dg_effect.h"

extern s32 GetEffectAnimationWanOffset(s32 id);

extern void PlayEffectAnimationPos(struct entity *entity, s32 effect_id, s32 a);

void ov29_022E66C4(struct entity *entity)
{
    PlayEffectAnimationPos(entity, 0x36, 1);
}

void ov29_022E66D8(struct entity *entity)
{
    PlayEffectAnimationEntity(entity, 0x15, 1, GetEffectAnimationWanOffset(0x15),
                              2, 0, -1, 0);
}

void ov29_022E6724(struct entity *entity)
{
    PlayEffectAnimationEntity(entity, 0x1B4, 1, GetEffectAnimationWanOffset(0x1B4),
                              2, 0, -1, 0);
}
