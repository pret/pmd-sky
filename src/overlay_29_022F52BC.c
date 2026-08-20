#include "overlay_29_022F52BC.h"

extern void UseSingleUseItem(struct entity *user, struct entity *target);

void UseSingleUseItemSelf(struct entity *entity)
{
    UseSingleUseItem(entity, entity);
}
