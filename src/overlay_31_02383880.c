#include "overlay_31_02383880.h"
#include "dungeon.h"
#include "main_0202593C.h"
#include "overlay_31_02383478.h"

extern struct dungeon* DUNGEON_PTR[];

extern void DrawTextInWindow(struct window*, u32, u32, u8*);

void ov31_02383854(struct window* w)
{
    DrawTextInWindow(w, 2, 2, StringFromId(0x08e6));
}

void ov31_02383880(u8* arg1)
{
    u8 count;
    arg1[0] = 0;
    count = arg1[0] + 1;
    for (s32 i=0; i < MAX_TEAM_MEMBERS; i++) {
        u8 test = EntityIsValid__02383658(DUNGEON_PTR[0]->monster_slots.party_members[i]);
        if (!test) {
            arg1[i+1] = 0;
        } else {
            arg1[i+1] = count++;
        }
    }
}
