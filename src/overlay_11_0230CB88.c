#include "overlay_11_0230CB88.h"

extern struct struct_1 ov11_023230DC;

extern u32 sub_02034840(struct struct_1 *p);

extern struct struct_1 ov11_023230EC;

extern bool8 RECYCLE_SHOP_OVERLAY_STATUS;

extern void sub_020017EC(void);

extern struct struct_1 ov11_023230BC;

extern struct struct_1 ov11_023230CC;

extern bool8 SPINDA_CAFE_OVERLAY_STATUS;

extern struct struct_1 ov11_023230AC;

extern s32 ov11_0238A090;

extern struct struct_1 ov11_0232309C;

extern s32 ov11_0238A08C;

extern struct struct_1 ov11_0232308C;

extern struct struct_1 ov11_0232307C;

extern u32 InitMenu(struct struct_1 *dst);

extern void EntryOverlay13(s32 a);

extern struct struct_1 OVERLAY11_OVERLAY_LOAD_TABLE;

void ov11_0230CB88(s32 a)
{
    if (InitMenu(&OVERLAY11_OVERLAY_LOAD_TABLE)) {
        EntryOverlay13(a);
    }
}

u32 LoadDuskullBankOverlay(void)
{
    return InitMenu(&ov11_0232307C);
}

u32 LoadLuminousSpringOverlay(void)
{
    return InitMenu(&ov11_0232308C);
}

void LoadChimechoAssemblyOverlay(s32 a)
{
    if (InitMenu(&ov11_0232309C)) {
        ov11_0238A08C = a;
    }
}

void LoadElectivireLinkShopOverlay(s32 a)
{
    if (InitMenu(&ov11_023230AC)) {
        ov11_0238A090 = a;
    }
}

void LoadSpindaCafeOverlayInit(void)
{
    InitMenu(&ov11_023230CC);
    SPINDA_CAFE_OVERLAY_STATUS = FALSE;
}

void LoadSpindaCafeOverlayResume(void)
{
    InitMenu(&ov11_023230BC);
    SPINDA_CAFE_OVERLAY_STATUS = FALSE;
}

bool8 IsSpindaCafeOverlaySuspended(void)
{
    return SPINDA_CAFE_OVERLAY_STATUS;
}

void LoadRecycleShopOverlayInit(void)
{
    sub_020017EC();
    InitMenu(&ov11_023230EC);
    RECYCLE_SHOP_OVERLAY_STATUS = FALSE;
}

void LoadRecycleShopOverlayResume(void)
{
    if (!sub_02034840(&ov11_023230EC)) {
        InitMenu(&ov11_023230DC);
    }

    RECYCLE_SHOP_OVERLAY_STATUS = FALSE;
}
