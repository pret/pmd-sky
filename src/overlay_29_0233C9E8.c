#include "overlay_29_0233C9E8.h"
#include "dg_random.h"
#include "dungeon.h"
#include "dungeon_map_access.h"
#include "dungeon_util.h"
#include "dungeon_util_static.h"

void GenerateExtraHallways(struct unk_0233C9E8 (*grid)[15], s32 grid_size_x, s32 grid_size_y, s32 n_extra_hallways)
{
    s32 i;
    s32 x;
    s32 dir;
    s32 k;
    s32 oob;

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
        if (cell->field_0xa == 0 || cell->field_0xb == 0
            || cell->field_0x8 != 0 || cell->field_0x10 != 0) {
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
            if (GetTerrainType(GetTile(tx, ty)) != TERRAIN_TYPE_NORMAL) {
                break;
            }
            tx += DIRECTIONS_XY[dir].x;
            ty += DIRECTIONS_XY[dir].y;
        }
        if (GetTerrainType(GetTile(tx, ty)) == TERRAIN_TYPE_SECONDARY) {
            continue;
        }
        oob = 0;
        for (bx = tx - 2; bx <= tx + 2; bx++) {
            for (by = ty - 2; by <= ty + 2; by++) {
                if (bx < 0 || bx >= DUNGEON_MAX_SIZE_X || by < 0 || by >= DUNGEON_MAX_SIZE_Y) {
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
        if (GetTerrainType(GetTile(tx + DIRECTIONS_XY[(dir + 2) & 6].x, ty + DIRECTIONS_XY[(dir + 2) & 6].y)) == TERRAIN_TYPE_NORMAL) {
            continue;
        }
        if (GetTerrainType(GetTile(tx + DIRECTIONS_XY[(dir - 2) & 6].x, ty + DIRECTIONS_XY[(dir - 2) & 6].y)) == TERRAIN_TYPE_NORMAL) {
            continue;
        }
        seg = DungeonRandInt(3) + 3;
        for (;;) {
            s32 flag;

            if (tx <= 1 || ty <= 1) {
                break;
            }
            if (tx >= DUNGEON_MAX_SIZE_X - 1 || ty >= DUNGEON_MAX_SIZE_Y - 1) {
                break;
            }
            if (GetTerrainType(GetTile(tx, ty)) == TERRAIN_TYPE_NORMAL) {
                break;
            }
            if (GetTile(tx, ty)->terrain_flags & TERRAIN_TYPE_IMPASSABLE_WALL) {
                break;
            }
            flag = 1;
            if (GetTerrainType(GetTile(tx + 1, ty)) == TERRAIN_TYPE_NORMAL
                && GetTerrainType(GetTile(tx + 1, ty + 1)) == TERRAIN_TYPE_NORMAL
                && GetTerrainType(GetTile(tx, ty + 1)) == TERRAIN_TYPE_NORMAL) {
                flag = 0;
            }
            if (GetTerrainType(GetTile(tx + 1, ty)) == TERRAIN_TYPE_NORMAL) {
                s32 ym = ty - 1;

                if (GetTerrainType(GetTile(tx + 1, ym)) == TERRAIN_TYPE_NORMAL
                    && GetTerrainType(GetTile(tx, ym)) == TERRAIN_TYPE_NORMAL) {
                    flag = 0;
                }
            }
            s32 xm = tx - 1;

            if (GetTerrainType(GetTile(xm, ty)) == TERRAIN_TYPE_NORMAL
                && GetTerrainType(GetTile(xm, ty + 1)) == TERRAIN_TYPE_NORMAL
                && GetTerrainType(GetTile(tx, ty + 1)) == TERRAIN_TYPE_NORMAL) {
                flag = 0;
            }
            if (GetTerrainType(GetTile(xm, ty)) == TERRAIN_TYPE_NORMAL) {
                s32 ym = ty - 1;

                if (GetTerrainType(GetTile(xm, ym)) == TERRAIN_TYPE_NORMAL
                    && GetTerrainType(GetTile(tx, ym)) == TERRAIN_TYPE_NORMAL) {
                    flag = 0;
                }
            }
            if (flag) {
                struct tile *t = GetTileSafe(tx, ty);
                t->terrain_flags &= ~(TERRAIN_TYPE_NORMAL | TERRAIN_TYPE_SECONDARY);
                t->terrain_flags |= TERRAIN_TYPE_NORMAL;
            }
            if (GetTerrainType(GetTile(tx + DIRECTIONS_XY[(dir + 2) & 6].x, ty + DIRECTIONS_XY[(dir + 2) & 6].y)) == TERRAIN_TYPE_NORMAL) {
                break;
            }
            if (GetTerrainType(GetTile(tx + DIRECTIONS_XY[(dir - 2) & 6].x, ty + DIRECTIONS_XY[(dir - 2) & 6].y)) == TERRAIN_TYPE_NORMAL) {
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
