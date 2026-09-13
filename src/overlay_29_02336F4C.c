#include "overlay_29_02336F4C.h"
#include "dungeon.h"
#include "overlay_29_02338604.h"

extern struct dungeon *DUNGEON_PTR[];
extern const s16 ov29_02352B9C[222];
extern const s16 ov29_02352D58[222];
extern u16 *ov29_02336DB0(struct dungeon_generation_info *a, s16 x, s16 y, s16 idx, bool8 can_see_traps, bool8 hallucinating, bool8 bazaar);
extern void sub_02051D8C(s16 x, s16 y, u16 val, s32 a, s32 b);
extern void sub_02051E60(s32, s32);

void UpdateTrapsVisibility(void)
{
    struct dungeon *dungeon;
    u16 *src;
    s32 y;
    s32 mapx;
    s32 mapy;
    s32 tx;
    s32 ty;
    s32 x;
    bool8 hallucinating;
    bool8 can_see_traps;
    bool8 bazaar;
    s32 i;
    s32 j;
    s32 k;

    dungeon = DUNGEON_PTR[0];
    hallucinating = dungeon->display_data.hallucinating;
    can_see_traps = dungeon->display_data.can_see_traps;
    bazaar = IsSecretBazaar();
    x = dungeon->display_data.camera_pixel_pos.x >> 3;
    k = 30 + x;
    tx = ov29_02352B9C[k];
    mapx = ov29_02352D58[k];
    for (i = 0; i < 33; i++) {
        y = (dungeon->display_data.camera_pixel_pos.y >> 3) - 1;
        x &= 0x3F;
        ty = ov29_02352B9C[30 + y];
        mapy = ov29_02352D58[30 + y];
        src = ov29_02336DB0(&dungeon->gen_info, mapx, mapy, tx + ty * 3, can_see_traps,
                            hallucinating, bazaar);
        for (j = 0; j < 27; j++) {
            y &= 0x1F;
            sub_02051D8C(x, y, *src, 1, 0);
            src += 3;
            y++;
            ty++;
            if (ty == 3) {
                ty = 0;
                mapy++;
                src = ov29_02336DB0(&dungeon->gen_info, mapx, mapy, tx, can_see_traps,
                                    hallucinating, bazaar);
            }
        }
        x++;
        tx++;
        if (tx == 3) {
            tx = 0;
            mapx++;
        }
    }
    sub_02051E60(1, 0);
}
