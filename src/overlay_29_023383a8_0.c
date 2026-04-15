#include "overlay_29_023383A8.h"

#include "dungeon.h"
#include "dungeon_mode.h"

extern void TryRevealAttackedTrap(struct position* pos, int param1);
extern bool32 PositionIsOnHiddenStairs(struct position* pos);
extern void HiddenStairsTrigger(bool32 param0);

void RevealAttackedTile(struct position *pos) {
    TryRevealAttackedTrap(pos, 1);
    if (PositionIsOnHiddenStairs(pos) == FALSE) {
        return;
    }
    HiddenStairsTrigger(TRUE);
}


void ResetVictoryCounter() {
    DUNGEON_PTR[0]->victory_counter = 0;
}