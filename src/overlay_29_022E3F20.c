#include "overlay_29_022E3F20.h"

extern s32 GetEffectAnimationWanOffset(s32 id);

extern void PlayEffectAnimationEntity(struct entity *entity, s32 id, s32 a, u8 b,
        s32 c, s32 d, s32 e, s32 f);

void ov29_022E3F20(void)
{

}

void ov29_022E3F24(struct entity *entity)
{
    PlayEffectAnimationEntity(entity, 0x141, 1, GetEffectAnimationWanOffset(0x141),
                              2, 0, -1, 0);
}

void ov29_022E3F74(void)
{

}

void ov29_022E3F78(void)
{

}

void ov29_022E3F7C(struct entity *entity)
{
    PlayEffectAnimationEntity(entity, 7, 1, GetEffectAnimationWanOffset(7),
                              2, 0, -1, 0);
}

void ov29_022E3FC8(void)
{

}

void ov29_022E3FCC(struct entity *entity)
{
    PlayEffectAnimationEntity(entity, 4, 0, GetEffectAnimationWanOffset(4),
                              2, 0, -1, 0);
}

void ov29_022E4014(void)
{

}

void PlayEffectAnimation0x171Full(struct entity *entity)
{
    PlayEffectAnimationEntity(entity, 0x171, 1, GetEffectAnimationWanOffset(0x171),
                              2, 0, -1, 0);
}

void ov29_022E4068(void)
{

}
