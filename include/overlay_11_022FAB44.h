#ifndef PMDSKY_OVERLAY_11_022FAB44_H
#define PMDSKY_OVERLAY_11_022FAB44_H

struct unk_022FAB44 {
    u16 field_0x0;
    u8 field_0x2[8];
    s16 field_0xA;
    u8 field_0xC[0x11C];
    s32 field_0x128;
    u8 field_0x12C[0x2E];
    s8 field_0x15A;
    u8 field_0x15B[0x11];
    s32 field_0x16C;
    u8 field_0x170[4];
    u8 field_0x174;
    s8 field_0x175;
    u8 field_0x176[0xC];
    u16 field_0x182;
    s16 field_0x184;
    u8 field_0x186[2];
    s32 field_0x188;
    u8 field_0x18C[4];
};

void SetHeightLiveActor(struct unk_022FAB44 *actor, s32 height);
void GetDirectionLiveActor(struct unk_022FAB44 *actor, s8 *dir);
void SetDirectionLiveActor(struct unk_022FAB44 *actor, s8 dir);
void SetAnimationLiveActor(struct unk_022FAB44 *actor, u16 anim);
void SetEffectLiveActor(struct unk_022FAB44 *actor, u16 a, u16 b, s32 c);
s32 GetAnimationStatusLiveActor(struct unk_022FAB44 *actor);
s32 GetEffectStatusLiveActor(struct unk_022FAB44 *actor);
void GetAttributeBitfieldLiveActor(struct unk_022FAB44 *actor, s32 *out);
void SetAttributeBitfieldLiveActorWrapper(struct unk_022FAB44 *actor, u32 mask);
void ResetAttributeBitfieldLiveActorWrapper(struct unk_022FAB44 *actor, u32 mask);

#endif
