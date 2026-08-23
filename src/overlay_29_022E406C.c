#include "overlay_29_022E406C.h"

extern s32 GetEffectAnimationWanOffset(s32 id);

extern void PlayEffectAnimationEntity(struct entity *entity, s32 id, s32 a, u8 b,
        s32 c, s32 d, s32 e, s32 f);

void PlayEffectAnimation0x171(struct entity *entity)
{
    PlayEffectAnimationEntity(entity, 0x171, 0, GetEffectAnimationWanOffset(0x171),
                              2, 0, -1, 0);
}

void ov29_022E40B8(void)
{

}

void ov29_022E40BC(void)
{

}

void ov29_022E40C0(struct entity *entity)
{
    PlayEffectAnimationEntity(entity, 0x1AC, 0, GetEffectAnimationWanOffset(0x1AC),
                              2, 0, -1, 0);
}

void ov29_022E4108(void)
{

}

void ov29_022E410C(void)
{

}

void ov29_022E4110(struct entity *entity)
{
    PlayEffectAnimationEntity(entity, 4, 1, GetEffectAnimationWanOffset(4),
                              2, 0, -1, 0);
}

void ov29_022E415C(void)
{

}

void ov29_022E4160(struct entity *entity)
{
    PlayEffectAnimationEntity(entity, 0x1A8, 1, GetEffectAnimationWanOffset(0x1A8),
                              2, 0, -1, 0);
}

void ov29_022E41AC(void)
{

}
