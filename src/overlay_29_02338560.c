#include "overlay_29_02338560.h"
#include "dungeon.h"
#include "fixed_room_data_1.h"

extern u16 ov29_02352B5C[2];

void ov29_02344E88(s16 *param_1);

void TrySpawnDoughSeedPoke(void)
{
    s16 arr[2];
#ifdef JAPAN
    if (DUNGEON_PTR[0]->traps[24].id == TRAP_NULL_TRAP) {
#else
    if (DUNGEON_PTR[0]->traps[65].id == TRAP_NULL_TRAP) {
#endif
        return;
    }
    if (!IsFullFloorFixedRoom()) {
        
        arr[0] = ov29_02352B5C[0];
        arr[1] = ov29_02352B5C[1];
        ov29_02344E88(arr);
    } 
#ifdef JAPAN
    DUNGEON_PTR[0]->traps[24].id = TRAP_NULL_TRAP;
#else
    DUNGEON_PTR[0]->traps[65].id = TRAP_NULL_TRAP;
#endif
}


