#include "dg_random.h"
#include "dungeon.h"
#include "enums.h"
#include "random_trap.h"

extern struct dungeon *DUNGEON_PTR[];

u8 GetRandomSpawnTrapId() {
    s32 rnd = DungeonRandInt(10000);

    for(s32 i = 0; i < TRAP_NONE; i++) {
        u16 weight = DUNGEON_PTR[0]->trap_weights[i];
        if(weight == 0) {
            continue;
        }

        if(weight >= rnd) {
            return i;
        }
    }

    return TRAP_CHESTNUT_TRAP;
}

s32 GetRandomTrapId() {
    s32 trap_id;
    s32 i;
    for(i = 0; i < 30; i++) {
        trap_id = GetRandomSpawnTrapId();
        if(trap_id != TRAP_NULL_TRAP && trap_id != TRAP_RANDOM_TRAP && trap_id != TRAP_WONDER_TILE) {
            break;
        }
    }

    if(i == TRAP_0x1E) {
        return TRAP_CHESTNUT_TRAP;
    }

    return trap_id;
}
