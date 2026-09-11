#include "overlay_29_0233E43C.h"
#include "overlay_29_0233C9E8.h"
#include "dg_random.h"
#include "dungeon_map_access.h"

void CreateGridCellConnections(struct unk_0233C9E8 (*grid)[15], s32 grid_size_x, s32 grid_size_y, s32 *arg4, s32 *arg5, bool8 arg6)
{
    s32 i;
    s32 j;

    for (i = 0; i < grid_size_x; i++) {
        for (j = 0; j < grid_size_y; j++) {

            if (grid[i][j].field_0x8 != 0) {
                grid[i][j].field_0x11[6] = 0;
                grid[i][j].field_0x11[7] = 0;
                grid[i][j].field_0x11[8] = 0;
                grid[i][j].field_0x11[9] = 0;
                continue;
            }
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
    for (i = 0; i < grid_size_x; i++) {
        for (j = 0; j < grid_size_y; j++) {
            s32 v0;
            s32 v1;

            if (grid[i][j].field_0x8 != 0) {
                continue;
            }
            if (grid[i][j].field_0xa == 0) {
                v0 = grid[i][j].field_0x0;
                v1 = grid[i][j].field_0x2;
            } else {
                v0 = DungeonRandRange(grid[i][j].field_0x0 + 1, grid[i][j].field_0x4 - 1);
                v1 = DungeonRandRange(grid[i][j].field_0x2 + 1, grid[i][j].field_0x6 - 1);
            }

            if (grid[i][j].field_0x11[6] != 0) {
                if (grid[i][j - 1].field_0x8 == 0) {
                    s32 t;
                    if (grid[i][j - 1].field_0xa == 0) {
                        t = grid[i][j - 1].field_0x0;
                    } else {
                        t = DungeonRandRange(grid[i][j - 1].field_0x0 + 1, grid[i][j - 1].field_0x4 - 1);
                    }
                    CreateHallway(v0, grid[i][(u32)j].field_0x2, t, grid[i][(u32)j - 1].field_0x6 - 1, TRUE,
                                  arg4[i], arg5[j]);
                }
                grid[i][j].field_0x11[6] = 0;
                grid[i][j - 1].field_0x11[7] = 0;
                grid[i][j].field_0xb = 1;
                grid[i][j - 1].field_0xb = 1;
            }

            if (grid[i][j].field_0x11[7] != 0) {
                if (grid[i][j + 1].field_0x8 == 0) {
                    s32 t;
                    if (grid[i][j + 1].field_0xa == 0) {
                        t = grid[i][j + 1].field_0x0;
                    } else {
                        t = DungeonRandRange(grid[i][j + 1].field_0x0 + 1, grid[i][j + 1].field_0x4 - 1);
                    }
                    CreateHallway(v0, grid[i][(u32)j].field_0x6 - 1, t, grid[i][(u32)j + 1].field_0x2, TRUE,
                                  arg4[i], arg5[j + 1] - 1);
                }
                grid[i][j].field_0x11[7] = 0;
                grid[i][j + 1].field_0x11[6] = 0;
                grid[i][j].field_0xb = 1;
                grid[i][j + 1].field_0xb = 1;
            }

            if (grid[i][j].field_0x11[8] != 0) {
                if (grid[i - 1][j].field_0x8 == 0) {
                    s32 t;
                    if (grid[i - 1][j].field_0xa == 0) {
                        t = grid[i - 1][j].field_0x2;
                    } else {
                        t = DungeonRandRange(grid[i - 1][j].field_0x2 + 1, grid[i - 1][j].field_0x6 - 1);
                    }
                    CreateHallway(grid[i][(u32)j].field_0x0, v1, grid[i - 1][(u32)j].field_0x0 - 1, t, FALSE,
                                  arg4[i], arg5[j]);
                }
                grid[i][j].field_0x11[8] = 0;
                grid[i - 1][j].field_0x11[9] = 0;
                grid[i][j].field_0xb = 1;
                grid[i - 1][j].field_0xb = 1;
            }

            if (grid[i][j].field_0x11[9] != 0) {
                if (grid[i + 1][j].field_0x8 == 0) {
                    s32 t;
                    if (grid[i + 1][j].field_0xa == 0) {
                        t = grid[i + 1][j].field_0x2;
                    } else {
                        t = DungeonRandRange(grid[i + 1][j].field_0x2 + 1, grid[i + 1][j].field_0x6 - 1);
                    }
                    CreateHallway(grid[i][(u32)j].field_0x4 - 1, v1, grid[i + 1][(u32)j].field_0x0, t, FALSE,
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
            struct unk_0233C9E8 *cell;

            if (DungeonRandInt(100) >= 5) {
                continue;
            }
            cell = &grid[i][j];
            if (cell->field_0x8 != 0) {
                continue;
            }
            if (cell->field_0xb == 0) {
                continue;
            }
            if (cell->field_0x11[1] != 0 || cell->field_0x9 != 0) {
                continue;
            }
            if (cell->field_0xa == 0) {
                continue;
            }
            switch (DungeonRandInt(4)) {
            case 0: {
                s32 x0, y0, y1;
                int x1;
                s32 y, x;
                s32 room;

                if (i < 1) {
                    break;
                }
                if (cell[-15].field_0xb == 0) {
                    break;
                }
                if (cell[-15].field_0x8 != 0) {
                    break;
                }
                if (cell[-15].field_0xa == 0) {
                    break;
                }
                if (cell[-15].field_0x9 != 0 || cell[-15].field_0x11[1] != 0) {
                    break;
                }
                x0 = cell[-15].field_0x0;
                y0 = cell[-15].field_0x2 < cell->field_0x2 ? cell[-15].field_0x2 : cell->field_0x2;
                x1 = cell->field_0x4;
                y1 = cell[-15].field_0x6 > cell->field_0x6 ? cell[-15].field_0x6 : cell->field_0x6;
                room = GetTile(cell->field_0x0, cell->field_0x2)->room;
                for (x = x0; x < x1; x++) {
                    for (y = y0; y < y1; y++) {
                        struct tile *t = GetTileSafe(x, y);
                        t->terrain_flags &= ~3;
                        t->terrain_flags |= 1;
                        t->room = room;
                    }
                }
                cell[-15].field_0x0 = x0;
                cell[-15].field_0x4 = x1;
                cell[-15].field_0x2 = y0;
                cell[-15].field_0x6 = y1;
                cell->field_0x11[1] = 1;
                cell[-15].field_0x11[1] = 1;
                cell->field_0xb = 0;
                cell->field_0x11[0] = 1;
                break;
            }
            case 1: {
                s32 x0, y0, y1;
                int x1;
                s32 y, x;
                s32 room;

                if (j < 1) {
                    break;
                }
                if (cell[-1].field_0xb == 0) {
                    break;
                }
                if (cell[-1].field_0x8 != 0) {
                    break;
                }
                if (cell[-1].field_0xa == 0) {
                    break;
                }
                if (cell[-1].field_0x9 != 0 || cell[-1].field_0x11[1] != 0) {
                    break;
                }
                x0 = cell[-1].field_0x0 < cell->field_0x0 ? cell[-1].field_0x0 : cell->field_0x0;
                y0 = cell[-1].field_0x2;
                x1 = cell[-1].field_0x4 > cell->field_0x4 ? cell[-1].field_0x4 : cell->field_0x4;
                y1 = cell->field_0x6;
                room = GetTile(cell->field_0x0, cell->field_0x2)->room;
                for (x = x0; x < x1; x++) {
                    for (y = y0; y < y1; y++) {
                        struct tile *t = GetTileSafe(x, y);
                        t->terrain_flags &= ~3;
                        t->terrain_flags |= 1;
                        t->room = room;
                    }
                }
                cell[-1].field_0x0 = x0;
                cell[-1].field_0x4 = x1;
                cell[-1].field_0x2 = y0;
                cell[-1].field_0x6 = y1;
                cell->field_0x11[1] = 1;
                cell[-1].field_0x11[1] = 1;
                cell->field_0xb = 0;
                cell->field_0x11[0] = 1;
                break;
            }
            case 2: {
                s32 x0, y0, x1, y1, y, x;
                s32 room;

                if (i > grid_size_x - 2) {
                    break;
                }
                if (grid[i + 1][j].field_0xb == 0) {
                    break;
                }
                if (grid[i + 1][j].field_0x8 != 0) {
                    break;
                }
                if (grid[i + 1][j].field_0xa == 0) {
                    break;
                }
                if (grid[i + 1][j].field_0x9 != 0 || grid[i + 1][j].field_0x11[1] != 0) {
                    break;
                }
                x0 = cell->field_0x0;
                y0 = cell->field_0x2 < grid[i + 1][j].field_0x2 ? cell->field_0x2 : grid[i + 1][j].field_0x2;
                x1 = grid[i + 1][j].field_0x4;
                y1 = cell->field_0x6 > grid[i + 1][j].field_0x6 ? cell->field_0x6 : grid[i + 1][j].field_0x6;
                room = GetTile(cell->field_0x0, cell->field_0x2)->room;
                for (x = x0; x < x1; x++) {
                    for (y = y0; y < y1; y++) {
                        struct tile *t = GetTileSafe(x, y);
                        t->terrain_flags &= ~3;
                        t->terrain_flags |= 1;
                        t->room = room;
                    }
                }
                cell->field_0x0 = x0;
                cell->field_0x4 = x1;
                cell->field_0x2 = y0;
                cell->field_0x6 = y1;
                grid[i + 1][j].field_0x11[1] = 1;
                cell->field_0x11[1] = 1;
                grid[i + 1][j].field_0xb = 0;
                grid[i + 1][j].field_0x11[0] = 1;
                break;
            }
            case 3: {
                s32 x0, y0, x1, y1, y, x;
                s32 room;

                if (j > grid_size_y - 2) {
                    break;
                }
                if (grid[i][j + 1].field_0xb == 0) {
                    break;
                }
                if (grid[i][j + 1].field_0x8 != 0) {
                    break;
                }
                if (grid[i][j + 1].field_0xa == 0) {
                    break;
                }
                if (grid[i][j + 1].field_0x9 != 0 || grid[i][j + 1].field_0x11[1] != 0) {
                    break;
                }
                x0 = cell->field_0x0 < grid[i][j + 1].field_0x0 ? cell->field_0x0 : grid[i][j + 1].field_0x0;
                y0 = cell->field_0x2;
                x1 = cell->field_0x4 > grid[i][j + 1].field_0x4 ? cell->field_0x4 : grid[i][j + 1].field_0x4;
                y1 = grid[i][j + 1].field_0x6;
                room = GetTile(cell->field_0x0, cell->field_0x2)->room;
                for (x = x0; x < x1; x++) {
                    for (y = y0; y < y1; y++) {
                        struct tile *t = GetTileSafe(x, y);
                        t->terrain_flags &= ~3;
                        t->terrain_flags |= 1;
                        t->room = room;
                    }
                }
                cell->field_0x0 = x0;
                cell->field_0x4 = x1;
                cell->field_0x2 = y0;
                cell->field_0x6 = y1;
                grid[i][j + 1].field_0x11[1] = 1;
                cell->field_0x11[1] = 1;
                grid[i][j + 1].field_0xb = 0;
                grid[i][j + 1].field_0x11[0] = 1;
                break;
            }
            }
        }
    }


}
