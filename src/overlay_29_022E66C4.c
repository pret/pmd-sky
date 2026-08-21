#include "overlay_29_022E66C4.h"

extern s32 GetEffectAnimationField0x19(s32 id);

extern void PlayEffectAnimationEntity(struct entity *entity, s32 id, s32 a, u8 b,
        s32 c, s32 d, s32 e, s32 f);

extern void PlayEffectAnimationPos(struct entity *entity, s32 effect_id, s32 a);

void ov29_022E66C4(struct entity *entity)
{
    PlayEffectAnimationPos(entity, 0x36, 1);
}

void ov29_022E66D8(struct entity *entity)
{
    PlayEffectAnimationEntity(entity, 0x15, 1, GetEffectAnimationField0x19(0x15),
                              2, 0, -1, 0);
}

void ov29_022E6724(struct entity *entity)
{
    PlayEffectAnimationEntity(entity, 0x1B4, 1, GetEffectAnimationField0x19(0x1B4),
                              2, 0, -1, 0);
}
