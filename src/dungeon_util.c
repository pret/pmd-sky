#include "dungeon_util.h"
#include "dungeon_util_static.h"

const struct position DIRECTIONS_XY[] = {
    {0, 1},
    {1, 1},
    {1, 0},
    {1, -1},
    {0, -1},
    {-1, -1},
    {-1, 0},
    {-1, 1}
};

bool8 ShouldRunMonsterAi(struct entity *monster)
{
    struct monster *pokemon_info = GetEntInfo(monster);
    switch (pokemon_info->monster_behavior)
    {
        case BEHAVIOR_RESCUE_TARGET:
        case BEHAVIOR_NORMAL_ENEMY_0x9:
        case BEHAVIOR_ALLY:
        case BEHAVIOR_EXPLORER_MAZE_1:
        case BEHAVIOR_EXPLORER_MAZE_2:
        case BEHAVIOR_EXPLORER_MAZE_3:
        case BEHAVIOR_EXPLORER_MAZE_4:
        case BEHAVIOR_INVALID:
            return TRUE;
        case BEHAVIOR_NORMAL_ENEMY_0x0:
        case BEHAVIOR_OUTLAW:
        case BEHAVIOR_HIDDEN_OUTLAW:
        case BEHAVIOR_FLEEING_OUTLAW:
        case BEHAVIOR_OUTLAW_TEAM_LEADER:
        case BEHAVIOR_OUTLAW_TEAM_MINION:
        case BEHAVIOR_WANDERING_ENEMY_0x8:
        case BEHAVIOR_SECRET_BAZAAR_KIRLIA:
        case BEHAVIOR_SECRET_BAZAAR_MIME_JR:
        case BEHAVIOR_SECRET_BAZAAR_SWALOT:
        case BEHAVIOR_SECRET_BAZAAR_LICKILICKY:
        case BEHAVIOR_SECRET_BAZAAR_SHEDINJA:
            return FALSE;
    }
    return FALSE;
}
