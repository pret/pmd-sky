#include "overlay_18_0238BF60.h"
#include "overlay_18_0238C950.h"

extern void ov18_0238BE28(s32 a);

extern u32 IsSimpleMenuActive(s32 window_id);

extern s32 GetSimpleMenuResult__0202B870(s8 window_id);

extern struct unk_0238C950 *LINK_SHOP_PTR;

void ov18_0238BF60(void)
{
    LINK_SHOP_PTR->field_0x88 = 3;
    LINK_SHOP_PTR->field_0x80 = 6;
}

void ov18_0238BF84(void)
{
    LINK_SHOP_PTR->field_0x88 = 0x23;
    LINK_SHOP_PTR->field_0x80 = 7;
}

void ov18_0238BFA8(void)
{
    s32 r;

    if (IsSimpleMenuActive(LINK_SHOP_PTR->field_0x4)) {
        return;
    }

    r = GetSimpleMenuResult__0202B870(LINK_SHOP_PTR->field_0x4);

    switch (r) {
    case 7:
        ov18_0238BE28(8);
        break;
    case 8:
        ov18_0238BE28(0xA);
        break;
    case 0xD:
        ov18_0238BE28(0xE);
        break;
    case 2:
    default:
        ov18_0238BE28(0);
        break;
    }
}

void ov18_0238C03C(void)
{
    LINK_SHOP_PTR->field_0x88 = 3;
    LINK_SHOP_PTR->field_0x80 = 9;
}

void ov18_0238C060(void)
{
    LINK_SHOP_PTR->field_0x80 = 5;
}

void ov18_0238C078(void)
{
    LINK_SHOP_PTR->field_0x88 = 3;
    LINK_SHOP_PTR->field_0x80 = 0xC;
}

void ov18_0238C09C(void)
{
    LINK_SHOP_PTR->field_0x88 = 3;
    LINK_SHOP_PTR->field_0x80 = 0xD;
}

void ov18_0238C0C0(void)
{
    LINK_SHOP_PTR->field_0x80 = 5;
}

void ov18_0238C0D8(void)
{
    LINK_SHOP_PTR->field_0x88 = 3;
    LINK_SHOP_PTR->field_0x80 = 0xF;
}

void ov18_0238C0FC(void)
{
    LINK_SHOP_PTR->field_0x80 = 5;
}
