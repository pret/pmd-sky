#include "overlay_29_0233E43C.h"
#include "overlay_29_0233C9E8.h"
#include "dg_random.h"
#include "dungeon_map_access.h"

void CreateGridCellConnections(struct unk_0233C9E8 (*grid)[15], s32 grid_size_x, s32 grid_size_y, s32 *arg4, s32 *arg5, bool8 arg6)
{
    s32 i;
    s32 j;
    int jj;

    for (i = 0; i < grid_size_x; i++) {
        for (j = 0; j < grid_size_y; j++) {

            if (grid[i][j].field_0x8 != 0) {
                grid[i][j].field_0x11[6] = 0;
                grid[i][j].field_0x11[7] = 0;
                grid[i][j].field_0x11[8] = 0;
                grid[i][j].field_0x11[9] = 0;
            } else {
                if (i <= 0) {
                    grid[i][j].field_0x11[4] = 0;
                }
                if (j <= 0) {
                    grid[i][j].field_0x11[2] = 0;
                }
                if (i >= grid_size_x - 1) {
                    grid[i][j].field_0x11[5] = 0;
                }
                if (j >= grid_size_y - 1) {
                    grid[i][j].field_0x11[3] = 0;
                }
                grid[i][j].field_0x11[6] = grid[i][j].field_0x11[2];
                grid[i][j].field_0x11[7] = grid[i][j].field_0x11[3];
                grid[i][j].field_0x11[8] = grid[i][j].field_0x11[4];
                grid[i][j].field_0x11[9] = grid[i][j].field_0x11[5];
            }
        }
    }
    for (i = 0; i < grid_size_x; i++) {
        for (j = 0; j < grid_size_y; j++) {
            s32 v0, v1, t0, t1;

            jj = j;

            if (grid[i][j].field_0x8 != 0) {
                continue;
            }
            if (grid[i][j].field_0xa != 0) {
                v0 = DungeonRandRange(grid[i][j].field_0x0 + 1, grid[i][j].field_0x4 - 1);
                v1 = DungeonRandRange(grid[i][j].field_0x2 + 1, grid[i][j].field_0x6 - 1);
            } else {
                v0 = grid[i][j].field_0x0;
                v1 = grid[i][j].field_0x2;
            }

            if (grid[i][j].field_0x11[6] != 0) {
                if (grid[i][j - 1].field_0x8 == 0) {
                    if (grid[i][j - 1].field_0xa != 0) {
                        t0 = DungeonRandRange(grid[i][j - 1].field_0x0 + 1, grid[i][j - 1].field_0x4 - 1);
                    } else {
                        t0 = grid[i][j - 1].field_0x0;
                    }
                    CreateHallway(v0, grid[i][jj].field_0x2, t0, grid[i][jj - 1].field_0x6 - 1, TRUE,
                                  arg4[i], arg5[j]);
                }
                grid[i][j].field_0x11[6] = 0;
                grid[i][j - 1].field_0x11[7] = 0;
                grid[i][j].field_0xb = 1;
                grid[i][j - 1].field_0xb = 1;
            }

            if (grid[i][j].field_0x11[7] != 0) {
                if (grid[i][j + 1].field_0x8 == 0) {
                    if (grid[i][j + 1].field_0xa != 0) {
                        t0 = DungeonRandRange(grid[i][j + 1].field_0x0 + 1, grid[i][j + 1].field_0x4 - 1);
                    } else {
                        t0 = grid[i][j + 1].field_0x0;
                    }
                    CreateHallway(v0, grid[i][jj].field_0x6 - 1, t0, grid[i][jj + 1].field_0x2, TRUE,
                                  arg4[i], arg5[j + 1] - 1);
                }
                grid[i][j].field_0x11[7] = 0;
                grid[i][j + 1].field_0x11[6] = 0;
                grid[i][j].field_0xb = 1;
                grid[i][j + 1].field_0xb = 1;
            }

            if (grid[i][j].field_0x11[8] != 0) {
                if (grid[i - 1][j].field_0x8 == 0) {
                    if (grid[i - 1][j].field_0xa != 0) {
                        t1 = DungeonRandRange(grid[i - 1][j].field_0x2 + 1, grid[i - 1][j].field_0x6 - 1);
                    } else {
                        t1 = grid[i - 1][j].field_0x2;
                    }
                    CreateHallway(grid[i][jj].field_0x0, v1, grid[i - 1][jj].field_0x0 - 1, t1, FALSE,
                                  arg4[i], arg5[j]);
                }
                grid[i][j].field_0x11[8] = 0;
                grid[i - 1][j].field_0x11[9] = 0;
                grid[i][j].field_0xb = 1;
                grid[i - 1][j].field_0xb = 1;
            }

            if (grid[i][j].field_0x11[9] != 0) {
                if (grid[i + 1][j].field_0x8 == 0) {
                    if (grid[i + 1][j].field_0xa != 0) {
                        t1 = DungeonRandRange(grid[i + 1][j].field_0x2 + 1, grid[i + 1][j].field_0x6 - 1);
                    } else {
                        t1 = grid[i + 1][j].field_0x2;
                    }
                    CreateHallway(grid[i][jj].field_0x4 - 1, v1, grid[i + 1][jj].field_0x0, t1, FALSE,
                                  arg4[i + 1] - 1, arg5[j]);
                }
                grid[i][j].field_0x11[9] = 0;
                grid[i + 1][j].field_0x11[8] = 0;
                grid[i][j].field_0xb = 1;
                grid[i + 1][j].field_0xb = 1;
            }
        }
    }
    if (arg6) {
        return;
    }
    for (i = 0; i < grid_size_x; i++) {
        for (j = 0; j < grid_size_y; j++) {
            s32 chance = DungeonRandInt(100);

            if (chance < 5 &&
                grid[i][j].field_0x8 == 0 &&
                grid[i][j].field_0xb != 0 &&
                grid[i][j].field_0x11[1] == 0 &&
                grid[i][j].field_0x9 == 0 &&
                grid[i][j].field_0xa != 0)
            {
            switch (DungeonRandInt(4)) {
            case 0: {

                if (i >= 1 &&
                    grid[i - 1][j].field_0xb &&
                    !grid[i - 1][j].field_0x8 &&
                    grid[i - 1][j].field_0xa &&
                    !grid[i - 1][j].field_0x9 &&
                    !grid[i - 1][j].field_0x11[1]) {
                    s32 y, x;

                    s32 x0 = grid[i - 1][j].field_0x0;
                    s32 y0 = grid[i - 1][j].field_0x2 < grid[i][j].field_0x2 ? grid[i - 1][j].field_0x2 : grid[i][j].field_0x2;
                    s32 x1 = grid[i][j].field_0x4;
                    s32 y1 = grid[i - 1][j].field_0x6 > grid[i][j].field_0x6 ? grid[i - 1][j].field_0x6 : grid[i][j].field_0x6;
                    s32 room = GetTile(grid[i][j].field_0x0, grid[i][j].field_0x2)->room;
                    for (x = x0; x < x1; x++) {
                        for (y = y0; y < y1; y++) {
                            struct tile *t = GetTileSafe(x, y);

                            t->terrain_flags &= ~3;
                            t->terrain_flags |= 1;
                            t->room = room;
                        }
                    }
                    grid[i - 1][j].field_0x0 = x0;
                    grid[i - 1][j].field_0x4 = x1;
                    grid[i - 1][j].field_0x2 = y0;
                    grid[i - 1][j].field_0x6 = y1;
                    grid[i][j].field_0x11[1] = 1;
                    grid[i - 1][j].field_0x11[1] = 1;
                    grid[i][j].field_0xb = 0;
                    grid[i][j].field_0x11[0] = 1;
                }
                break;
            }
            case 1: {

                if (j >= 1 &&
                    grid[i][j - 1].field_0xb &&
                    !grid[i][j - 1].field_0x8 &&
                    grid[i][j - 1].field_0xa &&
                    !grid[i][j - 1].field_0x9 &&
                    !grid[i][j - 1].field_0x11[1]) {
                    s32 y, x;

                    s32 x0 = grid[i][j - 1].field_0x0 < grid[i][j].field_0x0 ? grid[i][j - 1].field_0x0 : grid[i][j].field_0x0;
                    s32 y0 = grid[i][j - 1].field_0x2;
                    s32 x1 = grid[i][j - 1].field_0x4 > grid[i][j].field_0x4 ? grid[i][j - 1].field_0x4 : grid[i][j].field_0x4;
                    s32 y1 = grid[i][j].field_0x6;
                    s32 room = GetTile(grid[i][j].field_0x0, grid[i][j].field_0x2)->room;
                    for (x = x0; x < x1; x++) {
                        for (y = y0; y < y1; y++) {
                            struct tile *t = GetTileSafe(x, y);

                            t->terrain_flags &= ~3;
                            t->terrain_flags |= 1;
                            t->room = room;
                        }
                    }
                    grid[i][j - 1].field_0x0 = x0;
                    grid[i][j - 1].field_0x4 = x1;
                    grid[i][j - 1].field_0x2 = y0;
                    grid[i][j - 1].field_0x6 = y1;
                    grid[i][j].field_0x11[1] = 1;
                    grid[i][j - 1].field_0x11[1] = 1;
                    grid[i][j].field_0xb = 0;
                    grid[i][j].field_0x11[0] = 1;
                }
                break;
            }
            case 2: {

                if (i <= grid_size_x - 2 &&
                    grid[i + 1][j].field_0xb &&
                    !grid[i + 1][j].field_0x8 &&
                    grid[i + 1][j].field_0xa &&
                    !grid[i + 1][j].field_0x9 &&
                    !grid[i + 1][j].field_0x11[1]) {
                    s32 y, x;

                    s32 x0 = grid[i][j].field_0x0;
                    s32 y0 = grid[i][j].field_0x2 < grid[i + 1][j].field_0x2 ? grid[i][j].field_0x2 : grid[i + 1][j].field_0x2;
                    s32 x1 = grid[i + 1][j].field_0x4;
                    s32 y1 = grid[i][j].field_0x6 > grid[i + 1][j].field_0x6 ? grid[i][j].field_0x6 : grid[i + 1][j].field_0x6;
                    s32 room = GetTile(grid[i][j].field_0x0, grid[i][j].field_0x2)->room;
                    for (x = x0; x < x1; x++) {
                        for (y = y0; y < y1; y++) {
                            struct tile *t = GetTileSafe(x, y);

                            t->terrain_flags &= ~3;
                            t->terrain_flags |= 1;
                            t->room = room;
                        }
                    }
                    grid[i][j].field_0x0 = x0;
                    grid[i][j].field_0x4 = x1;
                    grid[i][j].field_0x2 = y0;
                    grid[i][j].field_0x6 = y1;
                    grid[i + 1][j].field_0x11[1] = 1;
                    grid[i][j].field_0x11[1] = 1;
                    grid[i + 1][j].field_0xb = 0;
                    grid[i + 1][j].field_0x11[0] = 1;
                }
                break;
            }
            case 3: {

                if (j <= grid_size_y - 2 &&
                    grid[i][j + 1].field_0xb &&
                    !grid[i][j + 1].field_0x8 &&
                    grid[i][j + 1].field_0xa &&
                    !grid[i][j + 1].field_0x9 &&
                    !grid[i][j + 1].field_0x11[1]) {
                    s32 y, x;

                    s32 x0 = grid[i][j].field_0x0 < grid[i][j + 1].field_0x0 ? grid[i][j].field_0x0 : grid[i][j + 1].field_0x0;
                    s32 y0 = grid[i][j].field_0x2;
                    s32 x1 = grid[i][j].field_0x4 > grid[i][j + 1].field_0x4 ? grid[i][j].field_0x4 : grid[i][j + 1].field_0x4;
                    s32 y1 = grid[i][j + 1].field_0x6;
                    s32 room = GetTile(grid[i][j].field_0x0, grid[i][j].field_0x2)->room;
                    for (x = x0; x < x1; x++) {
                        for (y = y0; y < y1; y++) {
                            struct tile *t = GetTileSafe(x, y);

                            t->terrain_flags &= ~3;
                            t->terrain_flags |= 1;
                            t->room = room;
                        }
                    }
                    grid[i][j].field_0x0 = x0;
                    grid[i][j].field_0x4 = x1;
                    grid[i][j].field_0x2 = y0;
                    grid[i][j].field_0x6 = y1;
                    grid[i][j + 1].field_0x11[1] = 1;
                    grid[i][j].field_0x11[1] = 1;
                    grid[i][j + 1].field_0xb = 0;
                    grid[i][j + 1].field_0x11[0] = 1;
                }
                break;
            }
            }
            }
        }
    }


}
