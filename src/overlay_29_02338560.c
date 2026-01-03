#include "overlay_29_02338560.h"
#include "dungeon.h"
#include "fixed_room_data_1.h"

extern u16 ov29_02352B5C[2];

void ov29_02344E88(s16 *param_1);

void TrySpawnDoughSeedPoke(void)
{
    s16 arr[2];
    if (!DUNGEON_PTR[0]->gen_info.dough_seed_extra_poke_flag) {
        return;
    }
    if (!IsFullFloorFixedRoom()) {
        
        arr[0] = ov29_02352B5C[0];
        arr[1] = ov29_02352B5C[1];
        ov29_02344E88(arr);
    } 
    DUNGEON_PTR[0]->gen_info.dough_seed_extra_poke_flag = FALSE;
}


