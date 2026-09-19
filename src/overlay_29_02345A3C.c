#include "overlay_29_02345A3C.h"
#include "dg_object.h"

extern bool8 SpawnDroppedItem(struct entity *entity, struct entity *item_entity, struct item *item, bool8 param_4, struct position *dir_xy, u32 param_6);

bool8 SpawnDroppedItemWrapper(struct entity *entity, struct position *pos, struct item *item, u32 param_4)
{
    struct entity item_entity;

    item_entity.type = ENTITY_ITEM;
    item_entity.field_0x24 = 0;
    item_entity.is_visible = TRUE;
    item_entity.transparent = 0;
    item_entity.info = item;
    item_entity.pos = *pos;

    SetEntityPixelPosXY(&item_entity, (pos->x * 24 + 4) << 8, (pos->y * 24 + 4) << 8);
    item_entity.spawn_genid = 0;
    return SpawnDroppedItem(entity, &item_entity, item, TRUE, NULL, param_4);
}
