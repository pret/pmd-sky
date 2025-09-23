#include "dungeon_recruitment.h"
#include "dungeon.h"

bool8 SpecificRecruitCheck(u32 monster_id) {
    if (DUNGEON_PTR[0]->recruiting_enabled == FALSE) {
        return FALSE;
    }

    // DebugRecruitingEnabled always returns TRUE
    if (DebugRecruitingEnabled(monster_id) == FALSE) {
        return FALSE;
    }

    if (monster_id == MONSTER_MEW) {
        // The cast is needed to produce assembly code that matches the original.
        // Accessing dungeon_objective using the enum directly gives
        // different assembly code.
        if (*(volatile s8 *)&DUNGEON_PTR[0]->dungeon_objective == OBJECTIVE_RESCUE) {
            return FALSE;
        }
    }

    if (monster_id == MONSTER_DEOXYS_ATTACK) {
        return FALSE;
    }

    if (monster_id == MONSTER_DEOXYS_DEFENSE) {
        return FALSE;
    }

    if (monster_id == MONSTER_DEOXYS_SPEED) {
        return FALSE;
    }

    if (monster_id == MONSTER_REGIROCK) {
        return FALSE;
    }

    if (monster_id == MONSTER_REGICE) {
        return FALSE;
    }

    if (monster_id == MONSTER_REGISTEEL) {
        return FALSE;
    } else {
        return TRUE;
    }
}
