#include "overlay_31_02383478.h"
#include "dungeon.h"
#include "dungeon_map_access.h"
#include "overlay_29_022E1610.h"

extern struct loc_struct* OVERLAY31_UNKNOWN_POINTER__NA_238A26C;
extern struct bag_items* BAG_ITEMS_PTR_MIRROR;
extern u32 OVERLAY31_UNKNOWN_STRUCT__NA_2389EF0;
extern u8 ov31_02389F5C[];
extern struct dungeon* DUNGEON_PTR[];

extern void sub_0200D310(char*, struct item*, u32*, u32, u32);
extern u8* strcpy(u8* dest, const u8* src);
extern u32 ov31_02383658(struct entity*);
extern void sub_0200D894(struct item*);
extern void ov10_022BD394(char*, s32, u32, u32);

#define GET_BIT(BYTE, N) ((u8)(BYTE & (1 << N) ? 1 : 0))

char* ov31_02383478(char* arg1, s32 arg2, u32 arg3)
{
    u32 a = 1;
    if (arg2 >= 0) {
        OVERLAY31_UNKNOWN_POINTER__NA_238A26C->field_0x11F8[arg2] = 0;
    }
    if ( OVERLAY31_UNKNOWN_POINTER__NA_238A26C->field_0x11B4 != NULL &&
         arg2 >= 0 &&
         ( &(BAG_ITEMS_PTR_MIRROR->bag_items->bag_items[arg2]) == OVERLAY31_UNKNOWN_POINTER__NA_238A26C->field_0x11B4 ||
           BAG_ITEMS_PTR_MIRROR->bag_items->bag_items[arg2].held_by != 0 ) ) {
            OVERLAY31_UNKNOWN_POINTER__NA_238A26C->field_0x11F8[arg2] = 3;
            a = 0;
    }
    if ( OVERLAY31_UNKNOWN_POINTER__NA_238A26C->field_0x11B2 != 0 ||
         arg2 < 0 ) {
        s16 x = OVERLAY31_UNKNOWN_POINTER__NA_238A26C->field_0x119C[2];
        s16 y = OVERLAY31_UNKNOWN_POINTER__NA_238A26C->field_0x119C[3];
        struct tile* tile = GetTile(x, y);
        struct item* item = GetItemInfo(tile->object);

        if (GET_BIT(item->flags, 0)) {
            sub_0200D310(arg1, item, &OVERLAY31_UNKNOWN_STRUCT__NA_2389EF0, a, 1);
            OVERLAY31_UNKNOWN_POINTER__NA_238A26C->field_0x1277 = 0;
        } else {
            strcpy(arg1, ov31_02389F5C);
            OVERLAY31_UNKNOWN_POINTER__NA_238A26C->field_0x1277 = 3;
        }
    } else {
        if (GET_BIT(BAG_ITEMS_PTR_MIRROR->bag_items->bag_items[arg2].flags, 0) &&
            BAG_ITEMS_PTR_MIRROR->bag_items->bag_items[arg2].held_by) {
            u32 r1 = (BAG_ITEMS_PTR_MIRROR->bag_items->bag_items[arg2].held_by - 1);
            if (ov31_02383658(DUNGEON_PTR[0]->monster_slots.party_members[r1]) == 0) {
                sub_0200D894(&(BAG_ITEMS_PTR_MIRROR->bag_items->bag_items[arg2]));
            }
        }
        ov10_022BD394(arg1, arg2, a, arg3);
    }
    return arg1;
}
