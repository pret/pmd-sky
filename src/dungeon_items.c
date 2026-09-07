#include "dungeon_items.h"
#include "dg_random.h"
#include "dungeon_util_static.h"
#include "dungeon.h"
#include "overlay_29_022E0A04.h"
#include "overlay_29_02349208.h"

extern s32 MONEY_QUANTITY_TABLE[0xC8];
extern struct dungeon *DUNGEON_PTR;

extern s32 YesNoMenu(s32, s32, s32, s32, s32);

bool8 HasHeldItem(struct entity* entity, enum item_id item_id)
{
    struct monster *pokemon_info = GetEntInfo(entity);
    if (!ItemExists(pokemon_info->held_item.flags))
        return FALSE;

    if (ItemSticky(pokemon_info->held_item.flags))
        return FALSE;

    if (pokemon_info->held_item.id != item_id)
        return FALSE;

    return TRUE;
}

void GenerateMoneyQuantity(struct bulk_item* item, s32 arg1)
{
    s32 rand;

    rand = DungeonRandInt(0x64);

    for(s32 loopIndex = 0; loopIndex < 0xC8; loopIndex++)
    {
        if (MONEY_QUANTITY_TABLE[rand] <= arg1) {
            item->quantity = rand;
            return;
        }
        rand /= 2;
    }
    item->quantity = 1;
}

void ov29_02346888(void)
{
    u8 old_field;

    old_field = DUNGEON_PTR->field_0xc;
    IsCurrentMissionType(MISSION_DELIVER_ITEM);
    DUNGEON_PTR->field_0xc = 0;
    if ((DUNGEON_PTR->field_0xc == 1) && (old_field == 0)) {
#ifndef JAPAN
        if (YesNoMenu(0, 0xBE0, 0, 0, 0) == 1) {
#else
        if (YesNoMenu(0, 0x91F, 0, 0, 0) == 1) {
#endif
            SetDungeonEscapeFields(2, TRUE);
        }
    }
}
