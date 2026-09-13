#include "overlay_29_0233E43C.h"
#include "overlay_29_0233C9E8.h"
#include "dg_random.h"
#include "dungeon.h"
#include "dungeon_map_access.h"
#include "dungeon_util.h"
#include "dungeon_util_static.h"

extern const bool8 CORNER_CARDINAL_NEIGHBOR_IS_OPEN[4][NUM_DIRECTIONS];

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

void GenerateRoomImperfections(struct unk_0233C9E8 (*grid)[15], s32 grid_size_x, s32 grid_size_y)
{
    s32 x;
    s32 y;
    s32 counter;
    s32 move_x;
    s32 move_y;
    s32 length;
    s32 i;
    s32 v;
    s32 corner;
    s32 dir;
    s32 next_x;
    s32 next_y;
    s32 off_x;
    s32 off_y;
    s32 found;
    const struct tile *tile;
    bool8 is_open;
    s32 pt_y;
    s32 pt_x;

    for (x = 0; x < grid_size_x; x++) {
        for (y = 0; y < grid_size_y; y++) {
            if (grid[x][y].field_0x8 != 0 || grid[x][y].field_0x11[0] != 0
                || grid[x][y].field_0x11[1] != 0) {
                continue;
            }
            if (grid[x][y].field_0xb == 0 || grid[x][y].field_0xa == 0) {
                continue;
            }
            if (grid[x][y].field_0x9 != 0 || grid[x][y].field_0x10 != 0) {
                continue;
            }
            if (grid[x][y].field_0x11[0xb] == 0) {
                continue;
            }
            if (DungeonRandInt(100) < 60) {
                continue;
            }

            length = (grid[x][y].field_0x4 - grid[x][y].field_0x0)
                     + (grid[x][y].field_0x6 - grid[x][y].field_0x2);
            length /= 4;
            if (length == 0) {
                length = 1;
            }

            for (counter = 0; counter < length; counter++) {
                for (i = 0; i < 2; i++) {
                    corner = DungeonRandInt(4);

                    switch (corner) {
                    case 0:
                    default:
                        pt_x = grid[x][y].field_0x0;
                        pt_y = grid[x][y].field_0x2;
                        if (i != 0) {
                            move_x = 1;
                            move_y = 0;
                        } else {
                            move_x = 0;
                            move_y = 1;
                        }
                        break;
                    case 1:
                        pt_x = grid[x][y].field_0x4 - 1;
                        pt_y = grid[x][y].field_0x2;
                        if (i != 0) {
                            move_x = 0;
                            move_y = 1;
                        } else {
                            move_x = -1;
                            move_y = 0;
                        }
                        break;
                    case 2:
                        pt_x = grid[x][y].field_0x4 - 1;
                        pt_y = grid[x][y].field_0x6 - 1;
                        if (i != 0) {
                            move_x = -1;
                            move_y = 0;
                        } else {
                            move_x = 0;
                            move_y = -1;
                        }
                        break;
                    case 3:
                        pt_x = grid[x][y].field_0x0;
                        pt_y = grid[x][y].field_0x6 - 1;
                        if (i != 0) {
                            move_x = 0;
                            move_y = -1;
                        } else {
                            move_x = 1;
                            move_y = 0;
                        }
                        break;
                    }

                    for (v = 0; v < 10; v++) {
                        if (pt_x < grid[x][y].field_0x0 || pt_x >= grid[x][y].field_0x4) {
                            break;
                        }
                        if (pt_y < grid[x][y].field_0x2 || pt_y >= grid[x][y].field_0x6) {
                            break;
                        }

                        if (GetTerrainType(GetTile(pt_x, pt_y)) == TERRAIN_TYPE_NORMAL) {
                            dir = 0;
                            while (dir < NUM_DIRECTIONS) {
                                next_x = pt_x + DIRECTIONS_XY[dir].x;
                                next_y = pt_y + DIRECTIONS_XY[dir].y;
                                found = FALSE;

                                for (off_y = -1; off_y <= 1; off_y++) {
                                    for (off_x = -1; off_x <= 1; off_x++) {
                                        tile = GetTile(next_x + off_x, next_y + off_y);

                                        if (GetTerrainType(tile) != TERRAIN_TYPE_NORMAL) {
                                            continue;
                                        }
                                        if (tile->room == CORRIDOR_ROOM) {
                                            found = TRUE;
                                        }
                                        if (found) {
                                            break;
                                        }
                                    }
                                    if (found) {
                                        break;
                                    }
                                }
                                if (found) {
                                    break;
                                }
                                dir++;
                            }

                            if (dir == NUM_DIRECTIONS) {
                                dir = 0;
                                while (dir < NUM_DIRECTIONS) {
                                    next_x = DIRECTIONS_XY[dir].x;
                                    next_y = DIRECTIONS_XY[dir].y;
                                    is_open = (GetTerrainType(GetTile(pt_x + next_x, pt_y + next_y))
                                               == TERRAIN_TYPE_NORMAL);

                                    if (CORNER_CARDINAL_NEIGHBOR_IS_OPEN[corner][dir] != is_open) {
                                        break;
                                    }
                                    dir += 2;
                                }
                                if (dir == NUM_DIRECTIONS) {
                                    GetTileSafe(pt_x, pt_y)->terrain_flags &=
                                        ~(TERRAIN_TYPE_NORMAL | TERRAIN_TYPE_SECONDARY);
                                }
                            }
                            break;
                        } else {
                            pt_x += move_x;
                            pt_y += move_y;
                        }
                    }
                }
            }
        }
    }
}

void CreateHallway(s32 x, s32 y, s32 end_x, s32 end_y, bool8 vertical, s32 turn_x, s32 turn_y)
{
    s32 start_x = x;
    s32 start_y = y;
    s32 i;
    struct tile *t;

    if (vertical) {
        i = 0;
        while (y != turn_y) {
            if (i++ >= DUNGEON_MAX_SIZE_X) {
                return;
            }
            if (GetTerrainType(GetTile(x, y)) != TERRAIN_TYPE_NORMAL) {
                t = GetTileSafe(x, y);
                t->terrain_flags &= ~3;
                t->terrain_flags |= 1;
            } else if (x != start_x || y != start_y) {
                return;
            }
            if (y < turn_y) {
                y++;
            } else {
                y--;
            }
        }
        i = 0;
        while (x != end_x) {
            if (i++ >= DUNGEON_MAX_SIZE_X) {
                return;
            }
            if (GetTerrainType(GetTile(x, y)) != TERRAIN_TYPE_NORMAL) {
                t = GetTileSafe(x, y);
                t->terrain_flags &= ~3;
                t->terrain_flags |= 1;
            } else if (x != start_x || y != start_y) {
                return;
            }
            if (x < end_x) {
                x++;
            } else {
                x--;
            }
        }
        i = 0;
        while (y != end_y) {
            if (i++ >= DUNGEON_MAX_SIZE_X) {
                return;
            }
            if (GetTerrainType(GetTile(x, y)) != TERRAIN_TYPE_NORMAL) {
                t = GetTileSafe(x, y);
                t->terrain_flags &= ~3;
                t->terrain_flags |= 1;
            } else if (x != start_x || y != start_y) {
                return;
            }
            if (y < end_y) {
                y++;
            } else {
                y--;
            }
        }
    } else {
        i = 0;
        while (x != turn_x) {
            if (i++ >= DUNGEON_MAX_SIZE_X) {
                return;
            }
            if (GetTerrainType(GetTile(x, y)) != TERRAIN_TYPE_NORMAL) {
                t = GetTileSafe(x, y);
                t->terrain_flags &= ~3;
                t->terrain_flags |= 1;
            } else if (x != start_x || y != start_y) {
                return;
            }
            if (x < turn_x) {
                x++;
            } else {
                x--;
            }
        }
        i = 0;
        while (y != end_y) {
            if (i++ >= DUNGEON_MAX_SIZE_X) {
                return;
            }
            if (GetTerrainType(GetTile(x, y)) != TERRAIN_TYPE_NORMAL) {
                t = GetTileSafe(x, y);
                t->terrain_flags &= ~3;
                t->terrain_flags |= 1;
            } else if (x != start_x || y != start_y) {
                return;
            }
            if (y < end_y) {
                y++;
            } else {
                y--;
            }
        }
        i = 0;
        while (x != end_x) {
            if (i++ >= DUNGEON_MAX_SIZE_X) {
                return;
            }
            if (GetTerrainType(GetTile(x, y)) != TERRAIN_TYPE_NORMAL) {
                t = GetTileSafe(x, y);
                t->terrain_flags &= ~3;
                t->terrain_flags |= 1;
            } else if (x != start_x || y != start_y) {
                return;
            }
            if (x < end_x) {
                x++;
            } else {
                x--;
            }
        }
    }
}
