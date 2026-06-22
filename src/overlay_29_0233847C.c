#include "overlay_29_0233847C.h"
#include "dungeon.h"

extern struct dungeon *DUNGEON_PTR;

extern void SetVictoriesOnOneFloor(u32 nb_victories);
extern s16 GetVictoriesOnOneFloor();

void ov29_0233847C()
{
    DUNGEON_PTR->victory_counter++;
    if (DUNGEON_PTR->victory_counter > GetVictoriesOnOneFloor()) {
        SetVictoriesOnOneFloor(DUNGEON_PTR->victory_counter);
    }
}
