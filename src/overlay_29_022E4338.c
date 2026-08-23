#include "overlay_29_022E4338.h"

extern s32 GetEffectAnimationWanOffset(s32 id);

extern void PlayEffectAnimationEntity(struct entity *entity, s32 id, s32 a, u8 b,
        s32 c, s32 d, s32 e, s32 f);

void ov29_022E4338(struct entity *entity)
{
    PlayEffectAnimationEntity(entity, 0x1A9, 1, GetEffectAnimationWanOffset(0x1A9),
                              2, 0, -1, 0);
}

void ov29_022E4388(struct entity *entity)
{
    PlayEffectAnimationEntity(entity, 0x13A, 1, GetEffectAnimationWanOffset(0x13A),
                              2, 0, -1, 0);
}

void ov29_022E43D8(struct entity *entity)
{
    PlayEffectAnimationEntity(entity, 0x13A, 1, GetEffectAnimationWanOffset(0x13A),
                              2, 0, -1, 0);
}

void ov29_022E4428(void)
{

}

void ov29_022E442C(void)
{

}

void ov29_022E4430(struct entity *entity)
{
    PlayEffectAnimationEntity(entity, 0x171, 1, GetEffectAnimationWanOffset(0x171),
                              2, 0, -1, 0);
}

void ov29_022E4480(struct entity *entity)
{
    PlayEffectAnimationEntity(entity, 7, 1, GetEffectAnimationWanOffset(7),
                              2, 0, -1, 0);
}

void PlaySpeedUpEffect(struct entity *entity)
{
    PlayEffectAnimationEntity(entity, 0x18B, 1, GetEffectAnimationWanOffset(0x18B),
                              2, 0, -1, 0);
}

void PlaySpeedDownEffect(struct entity *entity)
{
    PlayEffectAnimationEntity(entity, 0x18A, 1, GetEffectAnimationWanOffset(0x18A),
                              2, 0, -1, 0);
}

void ov29_022E456C(struct entity *entity)
{
    PlayEffectAnimationEntity(entity, 5, 1, GetEffectAnimationWanOffset(5),
                              2, 0, -1, 0);
}
