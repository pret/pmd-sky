#include "overlay_29_022E9628.h"
#include "dungeon.h"
#include "dungeon_map_access.h"
#include "dungeon_util_static.h"
#include "dg_uty.h"
#include "dg_random.h"
#include "main_02001188.h"
#include "MSL_C/stdlib.h"

extern struct dungeon *DUNGEON_PTR[2];

bool8 GetRandomTile(struct position *out, bool8 avoid_visited)
{
    struct entity *leader;
    s32 count;
    s32 i;
    s32 j;
    s32 y;
    s32 attempt;
    s32 x;
    s32 y_start;
    s32 ok;
    s32 leader_x;
    s32 leader_y;
    u8 tiles[DUNGEON_MAX_SIZE_X * DUNGEON_MAX_SIZE_Y][2];

    leader = GetLeader();
    count = 0;

    for (attempt = 0; attempt < 3; attempt++) {
        struct position leader_pos;

        x = DungeonRandInt(DUNGEON_MAX_SIZE_X);
        y_start = DungeonRandInt(DUNGEON_MAX_SIZE_Y);
        leader_pos = leader->pos;
        leader_x = leader_pos.x;
        leader_y = leader_pos.y;

        for (i = 0; i < DUNGEON_MAX_SIZE_X; i++) {
            y = y_start;
            if (count >= DUNGEON_MAX_SIZE_X * DUNGEON_MAX_SIZE_Y)
                break;

            for (j = 0; j < DUNGEON_MAX_SIZE_Y; j++) {
                struct tile *tile;

                ok = FALSE;
                tile = GetTile(x, y);
                if (count >= DUNGEON_MAX_SIZE_X * DUNGEON_MAX_SIZE_Y)
                    break;

                if (avoid_visited && (tile->terrain_flags & 0x800))
                    continue;

                if (attempt == 0) {
                    if (GetTerrainType(tile) == TERRAIN_TYPE_NORMAL
                        && tile->room != 0xFF && tile->object == NULL
                        && tile->monster == NULL
                        && (abs(leader_x - x) >= 6 || abs(leader_y - y) >= 6)) {
                        ok = TRUE;
                    }
                } else if (attempt == 1) {
                    if (GetTerrainType(tile) == TERRAIN_TYPE_NORMAL
                        && tile->room != 0xFF && tile->object == NULL
                        && tile->monster == NULL) {
                        ok = TRUE;
                    }
                } else {
                    if (GetTerrainType(tile) == TERRAIN_TYPE_NORMAL
                        && tile->object == NULL && tile->monster == NULL) {
                        ok = TRUE;
                    }
                }

                if (ok) {
                    tiles[count][0] = x;
                    tiles[count][1] = y;
                    count++;
                }

                y++;
                if (y >= DUNGEON_MAX_SIZE_Y)
                    y = 0;
            }

            x++;
            if (x >= DUNGEON_MAX_SIZE_X)
                x = 0;
        }

        if (count != 0) {
            s32 pick = DungeonRandInt(count);
            out->x = tiles[pick][0];
            out->y = tiles[pick][1];
            return TRUE;
        }
    }

    return FALSE;
}

bool32 FindNearbyUnoccupiedTile(struct position *out, struct position *origin,
                                const struct position *displacements, s32 count,
                                bool8 avoid_stairs)
{
    s16 *order;
    bool8 found;
    s32 i;

    found = FALSE;
    order = MemAlloc((count + 1) * sizeof(s16), 0);

    for (i = 0; i < count; i++)
        order[i] = i;

    if (avoid_stairs) {
        s16 rounds;
        s32 last;
        s32 j;
        s32 r;

        rounds = DungeonRandInt(4) + 1;
        last = count - 1;
        for (r = 0; r < rounds; r = (s16)(r + 1)) {
            for (j = 0; j < last; j = (s16)(j + 1)) {
                s16 k = DungeonRandInt(count);
                s16 tmp = order[j];
                order[j] = order[k];
                order[k] = tmp;
            }
        }
    }

    for (i = 0; i < count; i++) {
        s32 idx = order[i];
        s32 dx = displacements[idx].x;
        s32 x;
        s32 y;
        struct tile *tile;
        u16 flags;

        if (dx == 0x63)
            break;

        x = origin->x + dx;
        y = origin->y + displacements[idx].y;
        tile = GetTile(x, y);
        flags = tile->terrain_flags;
        if (flags & 0x800)
            continue;

        if (avoid_stairs) {
            if (tile->room == 0xFF)
                continue;
            if (DUNGEON_PTR[0]->gen_info.stairs_pos.x == x
                && DUNGEON_PTR[0]->gen_info.stairs_pos.y == y)
                continue;
        }

        if ((flags & 3) == TERRAIN_TYPE_NORMAL && tile->object == NULL
            && tile->monster == NULL) {
            out->x = x;
            out->y = y;
            found = TRUE;
            break;
        }
    }

    MemFree(order);
    return found;
}
