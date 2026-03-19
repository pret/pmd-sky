#include "main_0205C19C.h"

extern void CopyBitsFrom(void *read_info, void *buf_read, s32 nbits);
extern void Copy16BitsFrom(void *read_info, void *buf_read);

void sub_0205C19C(struct WriteMonsterInfoToSave_struct *arg0, struct unkStruct_020B0A54 *arg1)
{
    CopyBitsFrom(arg0, &arg1->unk0, 4);
    Copy16BitsFrom(arg0, &arg1->unk4);
    CopyBitsFrom(arg0, &arg1->unk8.monster, 24);
    CopyBitsFrom(arg0, &arg1->unkC, 64);
    CopyBitsFrom(arg0, &arg1->unk14, 0x40);
    CopyBitsFrom(arg0, &arg1->unk1C, 4);
    CopyBitsFrom(arg0, &arg1->unk1D, 0x50);
    CopyBitsFrom(arg0, &arg1->unk32, 0x120);
    CopyBitsFrom(arg0, &arg1->unk56, 0x240);
    CopyBitsFrom(arg0, &arg1->unkA0, 0xb);
    CopyBitsFrom(arg0, &arg1->unkA2, 0xb);
    CopyBitsFrom(arg0, &arg1->unkA4, 0x40);
    CopyBitsFrom(arg0, &arg1->unkAC, 8);
    bool8 temp;
    CopyBitsFrom(arg0, &temp, 1);
    arg1->unkAD = temp != FALSE;
    CopyBitsFrom(arg0, &arg1->unkAE, 2);
}
