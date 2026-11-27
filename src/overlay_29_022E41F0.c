#include "overlay_29_022E41F0.h"
#include "dg_effect.h"

extern s32 GetEffectAnimationWanOffset(s32 id);

void ov29_022E41F0(struct entity *entity)
{
    PlayEffectAnimationEntity(entity, 0x1A7, 1, GetEffectAnimationWanOffset(0x1A7),
                              2, 0, -1, 0);
}

void PlayParalysisEffect(struct entity *entity)
{
    PlayEffectAnimationEntity(entity, 0x1A7, 1, GetEffectAnimationWanOffset(0x1A7),
                              2, 0, -1, 0);
}

void ov29_022E4290(void)
{

}

void ov29_022E4294(struct entity *entity)
{
    PlayEffectAnimationEntity(entity, 0x4C, 1, GetEffectAnimationWanOffset(0x4C),
                              2, 0, -1, 0);
}

void ov29_022E42E0(void)
{

}

void ov29_022E42E4(void)
{

}