#include "overlay_00_022DB0E0.h"

u32 Dwci_Acc_GetFlag_DataType(struct unk_022DB0E0 *a)
{
    return Dwci_Acc_GetFlags(a) & 3;
}

u32 Dwc_IsBuddyFriendData(struct unk_022DB0E0 *a)
{
    return Dwci_IsBuddyFriendData(a) && Dwci_IsReverseBuddyFriendData(a);
}

u32 Dwci_IsBuddyFriendData(struct unk_022DB0E0 *a)
{
    if (Dwci_Acc_GetFlag_DataType(a) == 3) {
        return (Dwci_Acc_GetFlags(a) & 4) == 4;
    }

    return 0;
}

u32 Dwci_IsReverseBuddyFriendData(struct unk_022DB0E0 *a)
{
    return (Dwci_Acc_GetFlags(a) & 8) == 8;
}

u32 Dwci_IsBuddyMsgAlreadySent(struct unk_022DB0E0 *a)
{
    return (Dwci_Acc_GetFlags(a) & 0x20) == 0x20;
}

u32 Dwc_GetFriendDataType(struct unk_022DB0E0 *a)
{
    return Dwci_Acc_GetFlag_DataType(a);
}

void Dwci_Acc_SetFlags(struct unk_022DB0E0 *a, u32 v)
{
    Dwci_Acc_SetMaskBits((u32 *) a, v, 0xB, 0x1FFFFF);
}

void Dwci_Acc_SetFlag_DataType(struct unk_022DB0E0 *a, u32 type)
{
    u32 flags = Dwci_Acc_GetFlags(a);

    Dwci_Acc_SetFlags(a, (flags & ~3) | type);
}

void Dwci_SetBuddyFriendData(struct unk_022DB0E0 *a)
{
    u32 flags;

    if (Dwci_Acc_GetFlag_DataType(a) != 3) {
        return;
    }

    flags = Dwci_Acc_GetFlags(a) | 4;
    Dwci_Acc_SetFlags(a, flags);
}

void Dwci_SetReverseBuddyFlag(struct unk_022DB0E0 *a, bool8 on)
{
    u32 flags;

    if (on) {
        flags = Dwci_Acc_GetFlags(a) | 8;
    } else {
        flags = Dwci_Acc_GetFlags(a) & ~8;
    }

    Dwci_Acc_SetFlags(a, flags);
}
