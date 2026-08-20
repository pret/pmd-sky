#include "overlay_29_022E4704.h"

extern void PlaySeByIdIfShouldDisplayEntity(struct entity *entity, s32 se_id);

void PlayInvisifySeIfShouldDisplayEntity(struct entity *entity)
{
    PlaySeByIdIfShouldDisplayEntity(entity, 0x21C);
}
