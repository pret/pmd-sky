#include "overlay_31_02383880.h"
#include "dungeon.h"
#include "main_0202593C.h"
#include "overlay_31_02383478.h"

extern struct dungeon* DUNGEON_PTR[];
extern struct loc_struct* OVERLAY31_UNKNOWN_POINTER__NA_238A26C;

extern u8 PositionHasItem(struct position* pos);
extern bool8 ov10_022BCD10(s8);
extern void AdvanceFrame(u8);
extern s32 sub_020282F4(s8);
extern void CloseInventoryMenu(s8);
extern void ov29_0234E988(u8*);
extern void CloseTextBox2();
extern void MemFree(void*);
extern void DrawTextInWindow(struct window*, u32, u32, u8*);

u8 ov31_0238372C(struct position* x)
{
    if (OVERLAY31_UNKNOWN_POINTER__NA_238A26C->field_0x11b1 != 0 &&
        PositionHasItem(&(x[1]))) {
        return 1;
    }
    return 0;
}

void ov31_02383768(s8* arg1)
{
    s32 x;

    if (arg1[0] == -2) {
        return;
    }

    if (ov10_022BCD10(arg1[0])) {
        do {
            AdvanceFrame(0x62);
            x = sub_020282F4(arg1[0]);
        } while (-5 != x && -4 != x);
    }
    CloseInventoryMenu(arg1[0]);
    arg1[0] = -2;
}

void ov31_023837C8(void)
{
    ov29_0234E988(&(OVERLAY31_UNKNOWN_POINTER__NA_238A26C->field_0x1192));
    if ((OVERLAY31_UNKNOWN_POINTER__NA_238A26C->field_0x1194) != -2)
        CloseTextBox2();
    if ((OVERLAY31_UNKNOWN_POINTER__NA_238A26C->field_0x1195) != -2)
        CloseTextBox2();
    ov31_02383768(&(OVERLAY31_UNKNOWN_POINTER__NA_238A26C->field_0x1193));
    MemFree(OVERLAY31_UNKNOWN_POINTER__NA_238A26C);
    OVERLAY31_UNKNOWN_POINTER__NA_238A26C = NULL;
}

void ov31_02383854(struct window* w)
{
    #ifdef JAPAN
    DrawTextInWindow(w, 2, 2, StringFromId(0x1d3e));
    #else
    DrawTextInWindow(w, 2, 2, StringFromId(0x08e6));
    #endif
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
