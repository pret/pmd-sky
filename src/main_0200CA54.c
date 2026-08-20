#include "main_0200CA54.h"
#include "main_0207F3E4.h"



extern u8 BAG_ITEMS[];

extern u8 *BAG_ITEMS_PTR_MIRROR;






extern s32 GetItemCategoryVeneer(enum item_id item_id);

extern void LoadItemPspi2n(void);

extern void SetActiveInventoryToMain(void);

extern void sub_0200FD38(void);

extern void sub_02010590(void);

extern void WipeRecycleShopRecords(void);

extern void AllInventoriesZInit(void);

extern void sub_0200FD3C(void);

extern void AllKecleonShopsZInit(void);

extern void SpecialEpisodeInventoryZInit(void);

extern void SpecialEpisodeKecleonShopZInit(void);

extern void RescueInventoryZInit(void);

s16 GetDamageSource(s32 a, enum item_id item_id)
{
    if (item_id != ITEM_NOTHING) {
        if (GetItemCategoryVeneer(item_id) == 9) {
            return 0x262;
        }

        return 0x263;
    }

    return a;
}

void sub_0200CA8C(void)
{
    BAG_ITEMS_PTR_MIRROR = BAG_ITEMS;
    LoadItemPspi2n();
    SetActiveInventoryToMain();
    sub_0200FD38();
    sub_02010590();
    WipeRecycleShopRecords();
}

void sub_0200CABC(void)
{
    AllInventoriesZInit();
    sub_0200FD3C();
    AllKecleonShopsZInit();
    WipeRecycleShopRecords();
}

void sub_0200CAD4(void)
{
    SpecialEpisodeInventoryZInit();
    SpecialEpisodeKecleonShopZInit();
}

void sub_0200CAE4(void)
{
    RescueInventoryZInit();
}
