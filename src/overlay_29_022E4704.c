#include "overlay_29_022E4704.h"

extern bool8 MonsterIsType(struct entity *entity, enum type_id type_id);

extern s32 GetEffectAnimationField0x19(s32 id);

extern void PlayEffectAnimationEntity(struct entity *entity, s32 id, s32 a, u8 b,
        s32 c, s32 d, s32 e, s32 f);

extern void PlaySeByIdIfShouldDisplayEntity(struct entity *entity, s32 se_id);

void PlayInvisifySeIfShouldDisplayEntity(struct entity *entity)
{
    PlaySeByIdIfShouldDisplayEntity(entity, 0x21C);
}

void ov29_022E4714(void)
{

}

void ov29_022E4718(void)
{

}

void ov29_022E471C(struct entity *entity)
{
    PlayEffectAnimationEntity(entity, 0x131, 1, GetEffectAnimationField0x19(0x131),
                              2, 0, -1, 0);
}

void ov29_022E476C(struct entity *entity)
{
    PlayEffectAnimationEntity(entity, 0x30, 1, GetEffectAnimationField0x19(0x30),
                              2, 0, -1, 0);
}

void ov29_022E47B8(void)
{

}

void ov29_022E47BC(void)
{

}

void ov29_022E47C0(void)
{

}

void ov29_022E47C4(void)
{

}

void ov29_022E47C8(void)
{

}

void ov29_022E47CC(struct entity *entity, s32 id)
{
    if (MonsterIsType(entity, TYPE_GHOST)) {
        PlayEffectAnimationEntity(entity, id, 1, GetEffectAnimationField0x19(id),
                                  2, 0, -1, 0);
    } else {
        PlayEffectAnimationEntity(entity, 0xE, 1, GetEffectAnimationField0x19(0xE),
                                  2, 0, -1, 0);
    }
}
