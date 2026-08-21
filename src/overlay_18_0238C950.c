#include "overlay_18_0238C950.h"

extern s32 sub_0204159C(void);

extern s32 ov18_0238ABB0(s16 a);

extern void ov18_0238BE28(s32 a);

extern struct unk_0238C950 *LINK_SHOP_PTR;

void ov18_0238C950(void)
{
    LINK_SHOP_PTR->field_0x88 = 3;
    LINK_SHOP_PTR->field_0x80 = 0x2B;
}

void ov18_0238C974(void)
{
    ov18_0238BE28(0x19);
}

void ov18_0238C984(void)
{
    LINK_SHOP_PTR->field_0x88 = 3;
    LINK_SHOP_PTR->field_0x80 = 0x2D;
}

void ov18_0238C9A8(void)
{
    ov18_0238BE28(0x19);
}

void ov18_0238C9B8(void)
{
    if (sub_0204159C() == 0) {
        LINK_SHOP_PTR->field_0x80 = 0x2F;
        return;
    }

    if (ov18_0238ABB0(LINK_SHOP_PTR->field_0x38C) <= 0) {
        LINK_SHOP_PTR->field_0x80 = 0x31;
    } else {
        LINK_SHOP_PTR->field_0x80 = 0x33;
    }
}

void ov18_0238CA18(void)
{
    LINK_SHOP_PTR->field_0x88 = 3;
    LINK_SHOP_PTR->field_0x80 = 0x30;
}

void ov18_0238CA3C(void)
{
    ov18_0238BE28(0x11);
}

void ov18_0238CA4C(void)
{
    LINK_SHOP_PTR->field_0x88 = 3;
    LINK_SHOP_PTR->field_0x80 = 0x32;
}

void ov18_0238CA70(void)
{
    ov18_0238BE28(0x11);
}

void ov18_0238CA80(void)
{
    LINK_SHOP_PTR->field_0x88 = 3;
    LINK_SHOP_PTR->field_0x8C = 0;
    LINK_SHOP_PTR->field_0x80 = 0x34;
}
