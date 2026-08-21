#ifndef PMDSKY_OVERLAY_11_022FD1A0_H
#define PMDSKY_OVERLAY_11_022FD1A0_H

struct unk_022FD1A0 {
    u8 field_0x0[4];
    s16 field_0x4;
    u8 field_0x6[0x126];
    s32 field_0x12C;
    s8 field_0x130;
    u8 field_0x131[0x13];
    s32 field_0x144;
    u8 field_0x148[4];
    u8 field_0x14C;
    u8 field_0x14D;
    s16 field_0x14E;
    u16 field_0x150;
    s16 field_0x152;
    u8 field_0x154[4];
};

void SetHeightLiveObject(struct unk_022FD1A0 *obj, s32 height);
void GetDirectionLiveObject(struct unk_022FD1A0 *obj, s8 *dir);
void SetDirectionLiveObject(struct unk_022FD1A0 *obj, s8 dir);
void SetAnimationLiveObject(struct unk_022FD1A0 *obj, u16 anim);
void SetEffectLiveObject(struct unk_022FD1A0 *obj, u16 a, u16 b);
s32 GetAnimationStatusLiveObject(struct unk_022FD1A0 *obj);
s32 GetEffectStatusLiveObject(struct unk_022FD1A0 *obj);
void GetAttributeBitfieldLiveObject(struct unk_022FD1A0 *obj, s32 *out);
void SetAttributeBitfieldLiveObjectWrapper(struct unk_022FD1A0 *obj, u32 mask);
void ResetAttributeBitfieldLiveObjectWrapper(struct unk_022FD1A0 *obj, u32 mask);

#endif
