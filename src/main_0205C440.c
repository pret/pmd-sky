#include "main_0205C440.h"
#include "save.h"

extern u8 _020A3673;
extern u8 _020A3670;

extern void CopyBitsTo(struct bitstream *stream, void* buf_write, s32 nbits);
extern void Copy16BitsTo(struct bitstream *stream, void *buf_write);

void sub_0205C440(struct bitstream *stream, struct unkStruct_020B0A54 *p1)
{
    CopyBitsTo(stream, &p1->unk0, 4);
    Copy16BitsTo(stream, &p1->unk4);
    CopyBitsTo(stream, &p1->unk8.monster, 24);
    CopyBitsTo(stream, &p1->unkC, 64);
    CopyBitsTo(stream, &p1->unk14, 0x40);
    CopyBitsTo(stream, &p1->unk1C, 4);
    CopyBitsTo(stream, &p1->unk1D, 0x50);
    CopyBitsTo(stream, &p1->unk32, 0x120);
    CopyBitsTo(stream, &p1->unk56, 0x240);
    CopyBitsTo(stream, &p1->unkA0, 0xb);
    CopyBitsTo(stream, &p1->unkA2, 0xb);
    CopyBitsTo(stream, &p1->unkA4, 0x40);
    CopyBitsTo(stream, &p1->unkAC, 8);
    CopyBitsTo(stream, p1->unkAD == TRUE ? &_020A3673 : &_020A3670, 1);
    CopyBitsTo(stream, &p1->unkAE, 2);
}
