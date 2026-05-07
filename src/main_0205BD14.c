#include "main_0205BD14.h"
#include "common.h"
#include "save.h"
#include "main_0200224C.h"
#include "main_02014A4C.h"
#include "main_02059A74.h"
#include "main_0205B690.h"
#include "main_0205C440.h"

extern union unkStruct_020B0A54_union _020B0A54;
extern u32 _022B57BC;

extern void InitBitstreamForWrite(struct bitstream *stream, u32 v1, u32 v2);
extern void CopyBitsFrom(struct bitstream *stream, void *buf_read, s32 nbits);
extern void* memset(void *s, s32 c, u32 n);
extern void Copy16BitsFrom(struct bitstream *stream, void *buf_read);
extern void BitstreamDebug(struct bitstream *stream);
extern void sub_020634F4(void);
extern void InitBitstreamForRead(struct bitstream *stream, u32 p1, u32 p2);
extern void CopyBitsTo(struct bitstream *stream, void* buf_write, s32 nbits);
extern void Copy16BitsTo(struct bitstream *stream, void *buf_write);

void sub_0205BD14(u32 *dest, s32 index)
{
    *dest = sub_0205BD40(_020B0A54.struct0[index].unkAE);
}

u32 sub_0205BD40(u32 val)
{
    if (val & 2)
    {
        return 0;
    }

    return val & 1 ? 2 : 1;
}

bool8 sub_0205BD5C(u32 val)
{
    return sub_0205BD40(val) == 0;
}

u8 sub_0205BD78(void)
{
    return RandInt(2) | 2;
}

u32 sub_0205BD90(u32 a0)
{
    return a0 & 1 | 2;
}

u32 sub_0205BD9C(u32 arg0, u32 arg1)
{
    struct bitstream stream;

    InitBitstreamForWrite(&stream, arg0, arg1);
    CopyBitsFrom(&stream, &_022B57BC, 32);

    for (s32 i = 0; i < 32; i++)
    {
        sub_0205C19C(&stream, &_020B0A54.struct0[i]);
    }

    struct ground_monster *monster = _020B0A54.struct1.unk8.monster;
    memset(monster, 0, 68);

    CopyBitsFrom(&stream, &monster->is_valid, 4);
    CopyBitsFrom(&stream, &monster->level, 7);
    Copy16BitsFrom(&stream, &monster->joined_at);
    CopyBitsFrom(&stream, &monster->id, 11);
    sub_02059AE8(&stream, &monster->level_at_first_evo);
    sub_02059AE8(&stream, &monster->level_at_second_evo);
    CopyBitsFrom(&stream, &monster->iq, 10);
    CopyBitsFrom(&stream, &monster->max_hp, 10);
    CopyBitsFrom(&stream, &monster->offensive_stats[0], 8);
    CopyBitsFrom(&stream, &monster->offensive_stats[1], 8);
    CopyBitsFrom(&stream, &monster->defensive_stats[0], 8);
    CopyBitsFrom(&stream, &monster->defensive_stats[1], 8);
    CopyBitsFrom(&stream, &monster->exp, 24);
    CopyBitsFrom(&stream, &monster->iq_skill_flags, 69);
    CopyBitsFrom(&stream, &monster->tactic, 4);
    CopyMovesetFromStream(&stream, monster->moves);
    CopyBitsFrom(&stream, monster->name, 80);

    struct unkStruct_020B0A54_unk8_inner *inner = _020B0A54.struct1.unk8.unk8;
    memset(&inner->unk44, 0, 6);
    CopyBitsFrom(&stream, &inner->unk46, 11);
    CopyBitsFrom(&stream, &inner->unk48, 11);

    CopyBitsFrom(&stream, (void*) _020B0A54.struct1.unk4, 32);

    for (s32 i = 0; i < 32; i++)
    {
        CopyBitsFrom(&stream, _020B0A54.fp[1] + 4 + (i * 8), 64);
    }

    BitstreamDebug(&stream);
    Rand16Bit();
    sub_020634F4();

    return stream.bit_idx;
}

u32 sub_0205BFB0(u32 p0, u32 p1)
{
    struct bitstream stream;

    InitBitstreamForRead(&stream, p0, p1);
    CopyBitsTo(&stream, &_022B57BC, 32);

    for (s32 i = 0; i < 32; i++)
    {
        sub_0205C440(&stream, &_020B0A54.struct0[i]);
    }

    struct ground_monster *monster = _020B0A54.struct1.unk8.monster;
    CopyBitsTo(&stream, &monster->is_valid, 4);
    CopyBitsTo(&stream, &monster->level, 7);
    Copy16BitsTo(&stream, &monster->joined_at);
    CopyBitsTo(&stream, &monster->id, 11);
    sub_02059AF8(&stream, &monster->level_at_first_evo);
    sub_02059AF8(&stream, &monster->level_at_second_evo);
    CopyBitsTo(&stream, &monster->iq, 10);
    CopyBitsTo(&stream, &monster->max_hp, 10);
    CopyBitsTo(&stream, &monster->offensive_stats[0], 8);
    CopyBitsTo(&stream, &monster->offensive_stats[1], 8);
    CopyBitsTo(&stream, &monster->defensive_stats[0], 8);
    CopyBitsTo(&stream, &monster->defensive_stats[1], 8);
    CopyBitsTo(&stream, &monster->exp, 24);
    CopyBitsTo(&stream, &monster->iq_skill_flags, 69);
    CopyBitsTo(&stream, &monster->tactic, 4);
    CopyMovesetToStream(&stream, monster->moves);
    CopyBitsTo(&stream, monster->name, 80);

    struct unkStruct_020B0A54_unk8_inner *inner = _020B0A54.struct1.unk8.unk8;
    CopyBitsTo(&stream, &inner->unk46, 11);
    CopyBitsTo(&stream, &inner->unk48, 11);

    CopyBitsTo(&stream, (void*) _020B0A54.struct1.unk4, 32);

    for (s32 i = 0; i < 32; i++)
    {
        CopyBitsTo(&stream, _020B0A54.fp[1] + 4 + (i * 8), 64);
    }

    BitstreamDebug(&stream);

    return stream.bit_idx;
}

void sub_0205C19C(struct bitstream *stream, struct unkStruct_020B0A54 *arg1)
{
    CopyBitsFrom(stream, &arg1->unk0, 4);
    Copy16BitsFrom(stream, &arg1->unk4);
    CopyBitsFrom(stream, &arg1->unk8.monster, 24);
    CopyBitsFrom(stream, &arg1->unkC, 64);
    CopyBitsFrom(stream, &arg1->unk14, 0x40);
    CopyBitsFrom(stream, &arg1->unk1C, 4);
    CopyBitsFrom(stream, &arg1->unk1D, 0x50);
    CopyBitsFrom(stream, &arg1->unk32, 0x120);
    CopyBitsFrom(stream, &arg1->unk56, 0x240);
    CopyBitsFrom(stream, &arg1->unkA0, 0xb);
    CopyBitsFrom(stream, &arg1->unkA2, 0xb);
    CopyBitsFrom(stream, &arg1->unkA4, 0x40);
    CopyBitsFrom(stream, &arg1->unkAC, 8);
    bool8 temp;
    CopyBitsFrom(stream, &temp, 1);
    arg1->unkAD = temp != FALSE;
    CopyBitsFrom(stream, &arg1->unkAE, 2);
}
