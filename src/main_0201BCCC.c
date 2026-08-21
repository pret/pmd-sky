#include "main_0201BCCC.h"

extern void GroupOamAttributesWrapper(struct unk_oam_sub *p);

extern void sub_0201AFB8(struct unk_oam_elem *e);

extern void sub_0200302C(s32 a);

extern void sub_020030FC(s32 a);

extern void CopyAttributesToOamWrapper(struct unk_oam_sub *p);

extern void sub_0201AECC(struct unk_oam_elem *e, s32 a, s32 b);

extern void sub_0201AEB4(struct unk_oam_elem *e, s32 a);

extern void sub_0201AD84(struct unk_oam_elem *e);

extern struct unk_0201BCCC *OBJ_GRAPHICS_CONTROLS_PTR;

extern void sub_0201AD7C(struct unk_oam_elem *e);

void sub_0201BCCC(s32 idx)
{
    sub_0201AD7C(&OBJ_GRAPHICS_CONTROLS_PTR->field_0x1DC8[idx]);
}

void sub_0201BCF4(s32 idx)
{
    sub_0201AD84(&OBJ_GRAPHICS_CONTROLS_PTR->field_0x1DC8[idx]);
}

void sub_0201BD1C(u32 a, s32 idx)
{
    struct unk_oam_elem *e;

    e = &OBJ_GRAPHICS_CONTROLS_PTR->field_0x1DC8[idx];
    e->field_0x78 = (u8) ((e->field_0x78 & ~1) | (a & 1));
}

void sub_0201BD50(s32 a, s32 idx)
{
    sub_0201AEB4(&OBJ_GRAPHICS_CONTROLS_PTR->field_0x1DC8[idx], a);
}

void sub_0201BD80(s32 a, s32 b, s32 idx)
{
    sub_0201AECC(&OBJ_GRAPHICS_CONTROLS_PTR->field_0x1DC8[idx], a, b);
}

void CopyAttributesToOamBothScreens(void)
{
    sub_0200302C(8);
    CopyAttributesToOamWrapper(&OBJ_GRAPHICS_CONTROLS_PTR->field_0x0[0]);
    CopyAttributesToOamWrapper(&OBJ_GRAPHICS_CONTROLS_PTR->field_0x0[1]);
    sub_020030FC(8);
}

void sub_0201BDEC(void)
{
    sub_0200302C(8);
    CopyAttributesToOamWrapper(&OBJ_GRAPHICS_CONTROLS_PTR->field_0x0[2]);
    CopyAttributesToOamWrapper(&OBJ_GRAPHICS_CONTROLS_PTR->field_0x0[3]);
    sub_020030FC(8);
}

void sub_0201BE28(void)
{
    sub_0201AFB8(&OBJ_GRAPHICS_CONTROLS_PTR->field_0x1DC8[0]);
    sub_0201AFB8(&OBJ_GRAPHICS_CONTROLS_PTR->field_0x1DC8[1]);
}

void GroupOamAttributesBothScreens(void)
{
    GroupOamAttributesWrapper(&OBJ_GRAPHICS_CONTROLS_PTR->field_0x0[0]);
    GroupOamAttributesWrapper(&OBJ_GRAPHICS_CONTROLS_PTR->field_0x0[1]);
}

void sub_0201BE84(void)
{
    GroupOamAttributesWrapper(&OBJ_GRAPHICS_CONTROLS_PTR->field_0x0[2]);
    GroupOamAttributesWrapper(&OBJ_GRAPHICS_CONTROLS_PTR->field_0x0[3]);
}
