#include "overlay_29_022E99F0.h"
#include "dungeon_mode.h"

extern struct position *FindNearbyUnoccupiedTile(struct position *out, struct position *origin, const s32 *displacements, s32 count, bool8 a);

extern const s32 DISPLACEMENTS_WITHIN_2_SMALLEST_FIRST[];

extern const s32 DISPLACEMENTS_WITHIN_2_LARGEST_FIRST[];

extern const s32 DISPLACEMENTS_WITHIN_3[];

struct position* FindClosestUnoccupiedTileWithin2(struct position* out, struct position* origin, bool8 a)
{
    return FindNearbyUnoccupiedTile(out, origin, DISPLACEMENTS_WITHIN_2_SMALLEST_FIRST, 0x19, a);
}

struct position* FindFarthestUnoccupiedTileWithin2(struct position* out, struct position* origin, bool8 a)
{
    return FindNearbyUnoccupiedTile(out, origin, DISPLACEMENTS_WITHIN_2_LARGEST_FIRST, 0x19, a);
}

struct position* FindUnoccupiedTileWithin3(struct position* out, struct position* origin, bool8 a)
{
    return FindNearbyUnoccupiedTile(out, origin, DISPLACEMENTS_WITHIN_3, 0x31, a);
}

u8 TickStatusTurnCounter(u8 *counter)
{
    u8 turns = *counter;

    if (turns == 0x7F)
        return turns;
    if (turns == 0)
        return turns;
    *counter = turns - 1;
    return *counter;
}
