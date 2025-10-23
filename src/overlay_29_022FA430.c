#include "overlay_29_022FA430.h"
#include "dungeon.h"
#include "dungeon_map_access.h"
#include "math.h"
#include "overlay_29_022F7364.h"

extern s32 GetChebyshevDistance(struct position *position_a, struct position *position_b);
extern u8 GetStairsRoom();
extern s32 ov29_023018AC(struct entity*, struct entity*);

bool8 ShouldMonsterHeadToStairs(struct entity *entity)
{
    u8 stairs_room = GetStairsRoom();
    if (stairs_room == GetTile(entity->pos.x, entity->pos.y)->room) {
        s32 stairs_distance = GetChebyshevDistance(&entity->pos, &DUNGEON_PTR[0]->gen_info.stairs_pos);
        s32 min_stairs_distance = INFINITY_3;

        for (s32 i = 0; i < DUNGEON_MAX_POKEMON; i++)
        {
            struct entity *other_monster = DUNGEON_PTR[0]->active_monster_ptrs[i];
            if (EntityIsValid__022F7364(other_monster) && ov29_023018AC(entity, other_monster) == 1 && stairs_room == GetTile(other_monster->pos.x, other_monster->pos.y)->room) {
                s32 other_stairs_distance = GetChebyshevDistance(&other_monster->pos, &DUNGEON_PTR[0]->gen_info.stairs_pos);
                if (other_stairs_distance < min_stairs_distance)
                    min_stairs_distance = other_stairs_distance;
            }
        }

        if (min_stairs_distance == INFINITY_3 || (min_stairs_distance != INFINITY_3 && min_stairs_distance > stairs_distance))
            return TRUE;
    }
    return FALSE;
}
