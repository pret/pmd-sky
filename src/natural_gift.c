#include "natural_gift.h"
#include "dungeon_util_static.h"
#include "overlay_29_0231A9D4.h"

extern struct natural_gift_item_info NATURAL_GIFT_ITEM_TABLE[34];

struct natural_gift_item_info* GetEntityNaturalGiftInfo(struct entity* entity)
{
    if (IsMonster__0231A9D4(entity)) {
        struct monster *monster = GetEntInfo(entity);
        if (((struct item_volatile*)(&monster->held_item))->id != ITEM_NOTHING) {
            bool8 found_item = FALSE;
            s16 i = 0;
            s16 natural_gift_item_id;

            loop_start:
            natural_gift_item_id = ((volatile struct natural_gift_item_info*)NATURAL_GIFT_ITEM_TABLE)[i].item_id;
            if (natural_gift_item_id != ITEM_NOTHING)
            {
                if (monster->held_item.id == natural_gift_item_id)
                    found_item = TRUE;
                else
                {
                    i++;
                    goto loop_start;
                }
            }

            if (found_item)
                return &NATURAL_GIFT_ITEM_TABLE[i];
        }
    }
    return NULL;
}
