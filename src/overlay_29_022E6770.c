#include "overlay_29_022E6770.h"

extern void PlayEffectAnimationPos(struct entity *entity, s32 effect_id, s32 a);

void ov29_022E6770(struct entity *entity)
{
    PlayEffectAnimationPos(entity, 0x37, 1);
}

void ov29_022E6784(struct entity *entity)
{
    PlayEffectAnimationPos(entity, 0x29, 1);
}
