#ifndef PMDSKY_OVERLAY_00_022DB0E0_H
#define PMDSKY_OVERLAY_00_022DB0E0_H

#include "util.h"

struct unk_022DB0E0 {
    u32 field_0x0;
    u32 field_0x4;
    u32 field_0x8;
};

bool8 Dwci_Acc_SetMaskBits(u32 *p, u32 value, u32 shift, u32 mask);
u64 Dwci_Acc_GetUserId(struct unk_022DB0E0* a);
u32 Dwci_Acc_GetPlayerId(struct unk_022DB0E0* a);
u64 Dwci_Acc_GetFriendKey(struct unk_022DB0E0* a);
u32 Dwci_Acc_GetGsProfileId(struct unk_022DB0E0* a);
void Dwci_Acc_SetUserId(struct unk_022DB0E0* a, u32 lo, u32 hi);
void Dwci_Acc_SetPlayerId(struct unk_022DB0E0* a, u32 v);
void Dwci_Acc_SetFriendKey(struct unk_022DB0E0* a, u32 lo, u32 hi);
void Dwci_Acc_SetGsProfileId(struct unk_022DB0E0* a, u32 v);
u32 Dwci_Acc_GetFlags(struct unk_022DB0E0* a);

#endif
