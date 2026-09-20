#include "dungeon_range_2.h"
#include "dungeon.h"
#include "dungeon_map_access.h"
#include "main_0201BCCC.h"
#include "MSL_C/stdlib.h"

struct unk_0237C888 {
    u16 field_0x0;
    u16 field_0x2;
    u16 field_0x4;
    u16 field_0x6;
    s16 field_0x8;
    s16 field_0xa;
};

extern struct dungeon *DUNGEON_PTR[];
extern struct unk_0201BCCC *OBJ_GRAPHICS_CONTROLS_PTR;
extern struct unk_0237C888 ov29_0237C888[2][6];

extern s32 AddSimpleObjToOam(void *controls, void *oam_data, s32 x);

bool8 IsPositionWithinTwoTiles(struct position *origin, struct position *target)
{
    s32 i;
    s32 origin_x = origin->x;
    s32 origin_y;
    s32 diff = abs(origin_x - target->x);
    if (diff <= 1)
    {
        s32 y_diff = abs(origin->y - target->y);
        if (y_diff <= 1)
            return TRUE;
    }

    origin_y = origin->y;
    s32 y_diff = abs(origin_y - target->y);
    if (diff <= y_diff)
        diff = y_diff;

    if (diff == 2)
    {
        for (i = 0; i < 2; i++)
        {
            if (origin_x < target->x)
                origin_x++;

            if (origin_x > target->x)
                origin_x--;

            if (origin_y < target->y)
                origin_y++;

            if (origin_y > target->y)
                origin_y--;

            const struct tile *tile = GetTile(origin_x, origin_y);
            if (!(tile->terrain_flags & (TERRAIN_TYPE_NORMAL | TERRAIN_TYPE_SECONDARY)))
                return FALSE;
        }

        s32 target_x = target->x;
        s32 target_y = target->y;

        for (i = 0; i < 2; i++)
        {
            if (target_x < origin->x)
                target_x++;

            if (target_x > origin->x)
                target_x--;

            if (target_y < origin->y)
                target_y++;

            if (target_y > origin->y)
                target_y--;

            const struct tile *tile = GetTile(target_x, target_y);
            if (!(tile->terrain_flags & (TERRAIN_TYPE_NORMAL | TERRAIN_TYPE_SECONDARY)))
                return FALSE;
        }
        return TRUE;
    }
    return FALSE;
}

bool8 DisplayThrownItemShadow(s32 x, s32 y, u8 index)
{
    struct dungeon *dungeon = DUNGEON_PTR[0];
    s32 dx = x - dungeon->display_data.camera_pixel_pos.x;
    s32 dy = y - dungeon->display_data.camera_pixel_pos.y;

    if (dx >= -16 && dy >= -16 && dx < 271 && dy < 208)
    {
        s32 sx;
        s32 sy;

        sx = dx + ov29_0237C888[0][index].field_0x8;
        ov29_0237C888[0][index].field_0x2 &= ~0x1FF;
        ov29_0237C888[0][index].field_0x2 |= sx & 0x1FF;
        sy = dy + ov29_0237C888[0][index].field_0xa;
        ov29_0237C888[0][index].field_0x6 &= ~0xFFF0;
        ov29_0237C888[0][index].field_0x6 |= (sy & 0xFFF) << 4;
        AddSimpleObjToOam(OBJ_GRAPHICS_CONTROLS_PTR, &ov29_0237C888[0][index], 0);
        return TRUE;
    }
    return FALSE;
}