#include "overlay_11_022FAB44.h"

extern void ResetAttributeBitfieldLiveActor(s16 id, u32 mask);

extern void SetAttributeBitfieldLiveActor(s16 id, u32 mask);

extern s32 ov11_022F49B0(void *p);

extern s32 ov11_022F4990(void *p);

extern void ChangeActorAnimation(struct unk_022FAB44 *actor, u16 anim);

void SetHeightLiveActor(struct unk_022FAB44 *actor, s32 height)
{
    actor->field_0x16C = height;
}

void GetDirectionLiveActor(struct unk_022FAB44 *actor, s8 *dir)
{
    *dir = actor->field_0x15A;
}

void SetDirectionLiveActor(struct unk_022FAB44 *actor, s8 dir)
{
    if (dir != -1) {
        actor->field_0x15A = dir;

        if (actor->field_0x175 != actor->field_0x15A) {
            actor->field_0x174 = 1;
        }
    }
}

void SetAnimationLiveActor(struct unk_022FAB44 *actor, u16 anim)
{
    if (actor->field_0x0 <= 2 &&
        (actor->field_0xA == 0x119 || actor->field_0xA == 0x119 + 0x258)) {
        if ((u32) (anim & 0xFF) >= 0x16) {
            anim = (u16) ((anim & 0x1F00) | 0x53);
        }
    }

    ChangeActorAnimation(actor, anim);
}

void SetEffectLiveActor(struct unk_022FAB44 *actor, u16 a, u16 b, s32 c)
{
    actor->field_0x182 = a;
    actor->field_0x184 = b;
    actor->field_0x188 = c;
}

s32 GetAnimationStatusLiveActor(struct unk_022FAB44 *actor)
{
    if (actor->field_0x174 != 0) {
        return 1;
    }

    return ov11_022F4990(&actor->field_0x18C);
}

s32 GetEffectStatusLiveActor(struct unk_022FAB44 *actor)
{
    if (actor->field_0x184 != 0) {
        return 1;
    }

    return ov11_022F49B0(&actor->field_0x18C);
}

void GetAttributeBitfieldLiveActor(struct unk_022FAB44 *actor, s32 *out)
{
    *out = actor->field_0x128;
}

void SetAttributeBitfieldLiveActorWrapper(struct unk_022FAB44 *actor, u32 mask)
{
    SetAttributeBitfieldLiveActor((s16) actor->field_0x0, mask);
}

void ResetAttributeBitfieldLiveActorWrapper(struct unk_022FAB44 *actor, u32 mask)
{
    ResetAttributeBitfieldLiveActor((s16) actor->field_0x0, mask);
}
