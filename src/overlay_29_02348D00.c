#include "overlay_29_02348D00.h"

extern enum item_id GetSpecialTargetItem();

bool8 IsItemUnkMissionItem2(struct item *item)
{
    if (item->id != ITEM_NOTHING && item->id == GetSpecialTargetItem() && item->flags & ITEM_FLAG_UNK_MISSION_ITEM_2)
        return TRUE;
    return FALSE;
}
