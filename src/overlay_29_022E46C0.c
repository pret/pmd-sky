#include "overlay_29_022E46C0.h"
#include "dungeon_util_static.h"

extern bool8 ShouldDisplayEntityAdvanced(struct entity *entity);

extern void DisplayAnimatedNumbers(s32 amount, struct entity *entity, bool8 display_sign,
                                   s32 color);

extern void PlaySeByIdIfShouldDisplayEntity(struct entity *entity, s32 se_id);

void ov29_022E46C0(struct entity *entity)
{
    PlaySeByIdIfShouldDisplayEntity(entity, 0x30C);
}

void ov29_022E46D0(struct entity *entity)
{
}

void DisplayStockpileNumbers(struct entity *entity)
{
    if (!ShouldDisplayEntityAdvanced(entity))
        return;
    DisplayAnimatedNumbers(GetEntInfo(entity)->stockpile_stage, entity, TRUE,
                           0xB);
}
