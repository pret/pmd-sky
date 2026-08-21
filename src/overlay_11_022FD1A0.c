#include "overlay_11_022FD1A0.h"

extern void ResetAttributeBitfieldLiveObject(s16 id, u32 mask);

extern void SetAttributeBitfieldLiveObject(s16 id, u32 mask);

extern s32 ov11_022F49B0(void *p);

extern s32 ov11_022F4990(void *p);

extern s16 ov11_02321DC8[];

void SetHeightLiveObject(struct unk_022FD1A0 *obj, s32 height)
{
    obj->field_0x144 = height;
}

void GetDirectionLiveObject(struct unk_022FD1A0 *obj, s8 *dir)
{
    *dir = obj->field_0x130;
}

void SetDirectionLiveObject(struct unk_022FD1A0 *obj, s8 dir)
{
    if (dir != -1) {
        obj->field_0x130 = dir;
    }
}

void SetAnimationLiveObject(struct unk_022FD1A0 *obj, u16 anim)
{
    u16 sel;
    u16 low;
    s16 v;
    s16 cur;

    sel = (u16) (anim & 0x700);
    low = (u16) (anim & 0xFF);

    if (anim & 0x800) {
        obj->field_0x14E = 0x400;
        obj->field_0x14C = 1;
        return;
    }

    if (low != 0) {
        v = ov11_02321DC8[low];
    } else {
        v = obj->field_0x14E;
    }

    switch (sel) {
    case 0x100:
        v = (s16) (v | 0x300);
        break;
    case 0x200:
        v = (s16) (v | 0x100);
        break;
    case 0x300:
        break;
    case 0x400:
        v = (s16) (v | 0x200);
        break;
    }

    cur = obj->field_0x14E;

    if (cur != v) {
        obj->field_0x14E = v;
        obj->field_0x14C = 1;
        return;
    }

    if (cur & 0x1000) {
        obj->field_0x14C = 1;
    }
}

void SetEffectLiveObject(struct unk_022FD1A0 *obj, u16 a, u16 b)
{
    obj->field_0x150 = a;
    obj->field_0x152 = b;
}

s32 GetAnimationStatusLiveObject(struct unk_022FD1A0 *obj)
{
    if (obj->field_0x14C != 0) {
        return 1;
    }

    return ov11_022F4990(&obj->field_0x154);
}

s32 GetEffectStatusLiveObject(struct unk_022FD1A0 *obj)
{
    if (obj->field_0x152 != 0) {
        return 1;
    }

    return ov11_022F49B0(&obj->field_0x154);
}

void GetAttributeBitfieldLiveObject(struct unk_022FD1A0 *obj, s32 *out)
{
    *out = obj->field_0x12C;
}

void SetAttributeBitfieldLiveObjectWrapper(struct unk_022FD1A0 *obj, u32 mask)
{
    SetAttributeBitfieldLiveObject(obj->field_0x4, mask);
}

void ResetAttributeBitfieldLiveObjectWrapper(struct unk_022FD1A0 *obj, u32 mask)
{
    ResetAttributeBitfieldLiveObject(obj->field_0x4, mask);
}
