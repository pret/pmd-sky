#include "overlay_29_023456BC.h"
#include "dungeon.h"
#include "dungeon_map_access.h"
#include "dungeon_util_static.h"
#include "item_util_1.h"
#include "item_util_4.h"
#include "main_0201BCCC.h"
#include "overlay_29_022E1610.h"
#include "overlay_29_022E272C.h"
#include "overlay_29_02345698.h"

struct unk_0237C864 {
    u16 field_0x0;
    u16 field_0x2;
    u16 field_0x4;
    u16 field_0x6;
    u8 field_0x8[0x1c];
};

extern struct dungeon *DUNGEON_PTR[];

extern struct unk_0201BCCC *OBJ_GRAPHICS_CONTROLS_PTR;

extern struct unk_0237C864 ov29_0237C864;

extern u8 ov29_023537B4[8];

extern u8 ov29_023537BC[8];

extern s32 AddSimpleObjToOam(void *controls, void *oam_data, s32 x);

bool8 RemoveGroundItem(struct position *pos, bool8 a)
{
    struct item *item;
    s32 i;
    s32 count;
    struct tile *tile;
    struct entity *object;

    tile = GetTileSafe(pos->x, pos->y);
    object = tile->object;
    if (object == NULL)
        return FALSE;
    if (object->type != ENTITY_ITEM)
        return FALSE;
    item = GetItemInfo(object);
    if (tile->terrain_flags & TERRAIN_TYPE_SHOP) {
        if (IsShoppableItem(item->id)) {
            if (item->flags & ITEM_FLAG_IN_SHOP) {
                if (a)
                    DUNGEON_PTR[0]->poke_buy_kecleon_shop -= GetActualBuyPrice(item);
            }
            else {
                DUNGEON_PTR[0]->poke_sold_kecleon_shop -= GetActualSellPrice(item);
            }
        }
    }
    tile->object = NULL;
    object->type = ENTITY_NOTHING;
    count = 0;
    for (i = 0; i < 64; i++) {
        if (EntityIsValid__02345698(DUNGEON_PTR[0]->item_ptrs[i]))
            count = i + 1;
    }
    DUNGEON_PTR[0]->n_items = count;
    return TRUE;
}

bool8 DisplayItem(struct entity *entity, bool8 a, bool8 b, u8 c, bool8 d)
{
    struct dungeon *dungeon;
    s32 terrain;
    s32 pal;
    s32 cam_y;
    s32 shake;
    s32 pixel_y;
    s32 ground;
    s32 x;
    s32 y;
    s32 mode;
    s32 prio;
    s32 sprite;

    mode = 0;
    if (!EntityIsValid__02345698(entity))
        return FALSE;
    if (b) {
        terrain = GetTerrainType(GetTile(entity->pos.x, entity->pos.y));
        if (terrain == TERRAIN_TYPE_WALL)
            return FALSE;
        if (terrain == TERRAIN_TYPE_SECONDARY)
            mode = 1;
        if (!ShouldDisplayEntityWrapper(entity))
            return FALSE;
    }
    dungeon = DUNGEON_PTR[0];
    x = ((s32)entity->pixel_pos.x >> 8) - dungeon->display_data.camera_pixel_pos.x;
    cam_y = dungeon->display_data.camera_pixel_pos.y;
    shake = dungeon->display_data.screen_shake_offset;
    pixel_y = entity->pixel_pos.y;
    ground = ((pixel_y >> 8) - cam_y) + shake;
    y = (((pixel_y - entity->elevation) >> 8) - cam_y) + shake;
    prio = (ground + 8) / 2;
    if (x >= -32 && y >= -32 && x <= 287 && y <= 224) {
        ov29_0237C864.field_0x2 &= ~0x3E00;
        if (a) {
            ov29_0237C864.field_0x4 &= ~0xF000;
            ov29_0237C864.field_0x4 |= 0xA000;
            sprite = 0x17;
        }
        else {
            sprite = GetItemSpriteId(((struct item *)entity->info)->id);
            if (c != 0xFF && (sprite == 0 || sprite == 0x3B)) {
                sprite = ov29_023537B4[c];
                ov29_0237C864.field_0x2 &= ~0x3E00;
                ov29_0237C864.field_0x2 |= (ov29_023537BC[c] & 3) << 12;
            }
            pal = sub_0200D1FC(((struct item *)entity->info)->id);
            ov29_0237C864.field_0x4 &= ~0xF000;
            ov29_0237C864.field_0x4 |= (pal & 0xF) << 12;
        }
        ov29_0237C864.field_0x6 &= ~0xFFF0;
        ov29_0237C864.field_0x6 |= (y & 0xFFF) << 4;
        ov29_0237C864.field_0x2 &= ~0x1FF;
        ov29_0237C864.field_0x2 |= x & 0x1FF;
        ov29_0237C864.field_0x0 &= ~0xC00;
        ov29_0237C864.field_0x0 |= (mode & 3) << 10;
        ov29_0237C864.field_0x4 &= ~0xC00;
        ov29_0237C864.field_0x4 |= 0xC00;
        ov29_0237C864.field_0x4 &= ~0x3FF;
        ov29_0237C864.field_0x4 |= (sprite * 2 + 0x110) & 0x3FF;
        if (!d)
            prio = 1;
        AddSimpleObjToOam(OBJ_GRAPHICS_CONTROLS_PTR, &ov29_0237C864, prio);
        return TRUE;
    }
    return FALSE;
}
