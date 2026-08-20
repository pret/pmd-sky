#include "overlay_00_022DB0E0.h"

extern bool8 Dwci_Acc_SetMaskBits(u32 *p, u32 value, u32 shift, u32 mask);

bool8 Dwci_Acc_SetMaskBits(u32 *p, u32 value, u32 shift, u32 mask)
{
    if ((value & ~mask) != 0) {
        return FALSE;
    }

    *p = (*p & ~(mask << shift)) | (value << shift);

    return TRUE;
}

u64 Dwci_Acc_GetUserId(struct unk_022DB0E0* a)
{
    return ((u64) (a->field_0x0 & 0x7FF) << 32) | a->field_0x4;
}

u32 Dwci_Acc_GetPlayerId(struct unk_022DB0E0* a)
{
    return a->field_0x8;
}

u64 Dwci_Acc_GetFriendKey(struct unk_022DB0E0* a)
{
    return ((u64) a->field_0x8 << 32) | a->field_0x4;
}

u32 Dwci_Acc_GetGsProfileId(struct unk_022DB0E0* a)
{
    return a->field_0x4;
}

void Dwci_Acc_SetUserId(struct unk_022DB0E0* a, u32 lo, u32 hi)
{
    Dwci_Acc_SetMaskBits(&a->field_0x0, hi, 0, 0x7FF);
    a->field_0x4 = lo;
}

void Dwci_Acc_SetPlayerId(struct unk_022DB0E0* a, u32 v)
{
    a->field_0x8 = v;
}

void Dwci_Acc_SetFriendKey(struct unk_022DB0E0* a, u32 lo, u32 hi)
{
    a->field_0x4 = lo;
    a->field_0x8 = hi;
}

void Dwci_Acc_SetGsProfileId(struct unk_022DB0E0* a, u32 v)
{
    a->field_0x4 = v;
}

u32 Dwci_Acc_GetFlags(struct unk_022DB0E0* a)
{
    return (a->field_0x0 >> 11) & 0x1FFFFF;
}
