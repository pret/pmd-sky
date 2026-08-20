#include "overlay_11_0230CD48.h"

extern struct struct_1 ov11_0232318C;

extern struct struct_1 ov11_0232317C;

extern struct struct_1 ov11_0232316C;

extern struct struct_1 ov11_0232315C;

extern struct struct_1 ov11_0232314C;

extern struct struct_1 ov11_0232313C;

extern struct struct_1 ov11_0232312C;

extern struct struct_1 ov11_0232311C;

extern s32 ov11_0238A134;

extern struct struct_1 ov11_0232310C;

extern s32 ov11_0238A130;

extern u32 InitMenu(struct struct_1 *dst);

extern struct struct_1 ov11_023230FC;

u32 LoadCroagunkSwapShopOverlay(void)
{
    return InitMenu(&ov11_023230FC);
}

void LoadKecleonShopOverlay(s32 a)
{
    if (InitMenu(&ov11_0232310C)) {
        ov11_0238A130 = a;
    }
}

u32 LoadKangaskhanOverlay(s32 a)
{
    ov11_0238A134 = a;

    return InitMenu(&ov11_0232311C);
}

u32 LoadChanseyDaycareOverlay(void)
{
    return InitMenu(&ov11_0232312C);
}

u32 LoadXatuAppraisalOverlay(void)
{
    return InitMenu(&ov11_0232313C);
}

u32 LoadRecycleShopOverlay(void)
{
    return InitMenu(&ov11_0232314C);
}

u32 LoadRuleDungeonEffectsOverlay(void)
{
    return InitMenu(&ov11_0232315C);
}

u32 ov11_0230CDF4(void)
{
    return InitMenu(&ov11_0232316C);
}

u32 ov11_0230CE08(void)
{
    return InitMenu(&ov11_0232317C);
}

u32 ov11_0230CE1C(void)
{
    return InitMenu(&ov11_0232318C);
}
