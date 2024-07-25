#include "overlay_3102382820.h"

extern u32 DUNGEON_WINDOW_PARAMS_3[];
extern struct {u32* a; u32 b;} OVERLAY31_UNKNOWN_POINTER__NA_238A260;

extern void* MemAlloc(u32 len, u32 flags);
extern void* sub_020348E4(u32*);


void EntryOverlay31(void) {
    u32* r0 = (u32*)sub_020348E4(DUNGEON_WINDOW_PARAMS_3);
    if (r0 == NULL) {
        return;
    }
    r0 = (u32*)MemAlloc(16, 0x8);
    OVERLAY31_UNKNOWN_POINTER__NA_238A260.a = r0;
    r0[1] = 0;
    OVERLAY31_UNKNOWN_POINTER__NA_238A260.b = 0xa;

    return;
}
