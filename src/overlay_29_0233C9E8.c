#include "overlay_29_0233C9E8.h"
#include "dg_random.h"
#include "dungeon_map_access.h"
#include "dungeon_util.h"

void GenerateExtraHallways(struct unk_0233C9E8 (*grid)[15], s32 grid_size_x, s32 grid_size_y, s32 n_extra_hallways)
{
    s32 i;
    s32 x;
    s32 dir;
    s32 k;
    s32 oob;
    s32 d;

    if (n_extra_hallways == 0) {
        return;
    }
    for (i = 0; i < n_extra_hallways; i++) {
        struct unk_0233C9E8 *cell;
        s32 ty;
        s32 tx;
        s32 y;
        s32 room;
        s32 seg;
        s32 bx;
        s32 by;

        x = DungeonRandInt(grid_size_x);
        y = DungeonRandInt(grid_size_y);
        cell = &grid[x][y];
        if (cell->field_0xa == 0 || cell->field_0xb == 0) {
            continue;
        }
        if (cell->field_0x8 != 0 || cell->field_0x10 != 0) {
            continue;
        }
        tx = DungeonRandRange(cell->field_0x0, cell->field_0x4);
        ty = DungeonRandRange(cell->field_0x2, cell->field_0x6);
        dir = DungeonRandInt(4) * 2;
        for (k = 0; k < 3; k++) {
            if (dir == 0 && y >= grid_size_y - 1) {
                dir = 2;
            }
            if (dir == 2 && x >= grid_size_x - 1) {
                dir = 4;
            }
            if (dir == 4 && y <= 0) {
                dir = 6;
            }
            if (dir == 6 && x <= 0) {
                dir = 0;
            }
        }
        room = GetTile(tx, ty)->room;
        for (;;) {
            if (GetTile(tx, ty)->room != room) {
                break;
            }
            tx += DIRECTIONS_XY[dir].x;
            ty += DIRECTIONS_XY[dir].y;
        }
        for (;;) {
            if ((GetTile(tx, ty)->terrain_flags & 3) != 1) {
                break;
            }
            tx += DIRECTIONS_XY[dir].x;
            ty += DIRECTIONS_XY[dir].y;
        }
        if ((GetTile(tx, ty)->terrain_flags & 3) == 2) {
            continue;
        }
        oob = 0;
        for (bx = tx - 2; bx <= tx + 2; bx++) {
            for (by = ty - 2; by <= ty + 2; by++) {
                if (bx < 0 || bx >= 56 || by < 0 || by >= 32) {
                    oob = 1;
                    break;
                }
            }
            if (oob) {
                break;
            }
        }
        if (oob) {
            continue;
        }
        d = (dir + 2) & 6;
        if ((GetTile(tx + DIRECTIONS_XY[d].x, ty + DIRECTIONS_XY[d].y)->terrain_flags & 3) == 1) {
            continue;
        }
        d = (dir - 2) & 6;
        if ((GetTile(tx + DIRECTIONS_XY[d].x, ty + DIRECTIONS_XY[d].y)->terrain_flags & 3) == 1) {
            continue;
        }
        seg = DungeonRandInt(3) + 3;
        for (;;) {
            int flag;

            if (tx <= 1 || ty <= 1) {
                break;
            }
            if (tx >= 0x37 || ty >= 0x1f) {
                break;
            }
            if ((GetTile(tx, ty)->terrain_flags & 3) == 1) {
                break;
            }
            if (GetTile(tx, ty)->terrain_flags & 0x10) {
                break;
            }
            flag = 1;
            if ((GetTile(tx + 1, ty)->terrain_flags & 3) == 1
                && (GetTile(tx + 1, ty + 1)->terrain_flags & 3) == 1
                && (GetTile(tx, ty + 1)->terrain_flags & 3) == 1) {
                flag = 0;
            }
            if ((GetTile(tx + 1, ty)->terrain_flags & 3) == 1) {
                s32 ym = ty - 1;

                if ((GetTile(tx + 1, ym)->terrain_flags & 3) == 1
                    && (GetTile(tx, ym)->terrain_flags & 3) == 1) {
                    flag = 0;
                }
            }
            {
            s32 xm = tx - 1;

            if ((GetTile(xm, ty)->terrain_flags & 3) == 1
                && (GetTile(xm, ty + 1)->terrain_flags & 3) == 1
                && (GetTile(tx, ty + 1)->terrain_flags & 3) == 1) {
                flag = 0;
            }
            if ((GetTile(xm, ty)->terrain_flags & 3) == 1) {
                s32 ym = ty - 1;

                if ((GetTile(xm, ym)->terrain_flags & 3) == 1
                    && (GetTile(tx, ym)->terrain_flags & 3) == 1) {
                    flag = 0;
                }
            }
            }
            if (flag) {
                struct tile *t = GetTileSafe(tx, ty);
                t->terrain_flags &= ~3;
                t->terrain_flags |= 1;
            }
            d = (dir + 2) & 6;
            if ((GetTile(tx + DIRECTIONS_XY[d].x, ty + DIRECTIONS_XY[d].y)->terrain_flags & 3) == 1) {
                break;
            }
            d = (dir - 2) & 6;
            if ((GetTile(tx + DIRECTIONS_XY[d].x, ty + DIRECTIONS_XY[d].y)->terrain_flags & 3) == 1) {
                break;
            }
            if (--seg == 0) {
                seg = DungeonRandInt(3) + 3;
                if (DungeonRandInt(100) < 50) {
                    dir += 2;
                } else {
                    dir -= 2;
                }
                dir &= 6;
                if (tx >= 0x20 && FLOOR_GENERATION_STATUS.field_0x6 == 1 && dir == 2) {
                    break;
                }
                if (tx >= 0x30 && FLOOR_GENERATION_STATUS.field_0x6 == 2 && dir == 2) {
                    break;
                }
            }
            tx += DIRECTIONS_XY[dir].x;
            ty += DIRECTIONS_XY[dir].y;
        }
    }

}
