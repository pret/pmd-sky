#include "overlay_29_022E46C0.h"

extern void PlaySeByIdIfShouldDisplayEntity(struct entity *entity, s32 se_id);

void ov29_022E46C0(struct entity *entity)
{
    PlaySeByIdIfShouldDisplayEntity(entity, 0x30C);
}
