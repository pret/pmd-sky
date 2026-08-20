#include "overlay_29_022E41CC.h"

extern void ChangeMonsterAnimation(struct entity *entity, s32 animation_id, s32 direction);

extern void PlaySeByIdIfShouldDisplayEntity(struct entity *entity, s32 se_id);

void ov29_022E41B0(struct entity *entity, s32 a)
{
    if (a == 0) {
        return;
    }

    PlaySeByIdIfShouldDisplayEntity(entity, 0x221);
}

void ov29_022E41CC(struct entity *entity)
{
    PlaySeByIdIfShouldDisplayEntity(entity, 0x310);
}

void ov29_022E41DC(struct entity *entity)
{
    ChangeMonsterAnimation(entity, 0xA, 8);
}
