#include "dg_object.h"

// file starts at 0x022e1608

bool8 EntityIsValid__022E1A1C(struct entity *entity)
{
    if (entity == NULL)
    {
        return FALSE;
    }
    return entity->type != ENTITY_NOTHING;
}

void UpdateEntityPixelPos(struct entity *entity, struct pixel_position *pixel_pos)
{
    if (pixel_pos != 0) {
        entity->pixel_pos.x = pixel_pos->x;
        entity->pixel_pos.y = pixel_pos->y;
    }
    else {
        entity->pixel_pos.x = ((((entity->pos.x)*0x18)+0x0c)<<8);
        entity->pixel_pos.y = ((((entity->pos.y)*0x18)+0x10)<<8);
    }
}

void SetEntityPixelPosXY(struct entity *entity, u32 x, u32 y)
{
    entity->pixel_pos.x = x;
    entity->pixel_pos.y = y;
}

void IncrementEntityPixelPosXY(struct entity *entity, u32 x, u32 y)
{
    entity->pixel_pos.x += x;
    entity->pixel_pos.y += y;
}
