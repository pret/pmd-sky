#include "main_0205BD14.h"
#include "common.h"
#include "main_0200224C.h"
#include "main_02058FA4.h"
#include "main_02059A74.h"
#include "main_0205B690.h"
#include "main_0205C440.h"

extern union unkStruct_020B0A54_union _020B0A54;
extern u32 _022B57BC;

extern void sub_02050974(void *v0, u32 v1, u32 v2);
extern void CopyBitsFrom(void *read_info, void *buf_read, s32 nbits);
extern void* memset(void *s, s32 c, u32 n);
extern void Copy16BitsFrom(void *read_info, void *buf_read);
extern void CopyMovesetFrom(struct WriteMonsterInfoToSave_struct *read_info, void *dst);
extern void sub_020509BC(struct WriteMonsterInfoToSave_struct *write_info);
extern void sub_020634F4(void);
extern void sub_02050990(struct WriteMonsterInfoToSave_struct *write_info, u32 p1, u32 p2);
extern void CopyBitsTo(void *write_info, void* buf_write, s32 nbits);
extern void Copy16BitsTo(void *write_info, void *buf_write);
extern void CopyMovesetTo(struct WriteMonsterInfoToSave_struct *write_info, void *buffer_write);

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
    struct WriteMonsterInfoToSave_struct temp;

    sub_02050974(&temp, arg0, arg1);
    CopyBitsFrom(&temp, &_022B57BC, 32);

    for (s32 i = 0; i < 32; i++)
    {
        sub_0205C19C(&temp, &_020B0A54.struct0[i]);
    }

    struct ground_monster *monster = _020B0A54.struct1.unk8.monster;
    memset(monster, 0, 68);

    CopyBitsFrom(&temp, &monster->is_valid, 4);
    CopyBitsFrom(&temp, &monster->level, 7);
    Copy16BitsFrom(&temp, &monster->joined_at);
    CopyBitsFrom(&temp, &monster->id, 11);
    sub_02059AE8(&temp, &monster->level_at_first_evo);
    sub_02059AE8(&temp, &monster->level_at_second_evo);
    CopyBitsFrom(&temp, &monster->iq, 10);
    CopyBitsFrom(&temp, &monster->max_hp, 10);
    CopyBitsFrom(&temp, &monster->offensive_stats[0], 8);
    CopyBitsFrom(&temp, &monster->offensive_stats[1], 8);
    CopyBitsFrom(&temp, &monster->defensive_stats[0], 8);
    CopyBitsFrom(&temp, &monster->defensive_stats[1], 8);
    CopyBitsFrom(&temp, &monster->exp, 24);
    CopyBitsFrom(&temp, &monster->iq_skill_flags, 69);
    CopyBitsFrom(&temp, &monster->tactic, 4);
    CopyMovesetFrom(&temp, monster->moves);
    CopyBitsFrom(&temp, monster->name, 80);

    struct unkStruct_020B0A54_unk8_inner *inner = _020B0A54.struct1.unk8.unk8;
    memset(&inner->unk44, 0, 6);
    CopyBitsFrom(&temp, &inner->unk46, 11);
    CopyBitsFrom(&temp, &inner->unk48, 11);

    CopyBitsFrom(&temp, (void*) _020B0A54.struct1.unk4, 32);

    for (s32 i = 0; i < 32; i++)
    {
        CopyBitsFrom(&temp, _020B0A54.fp[1] + 4 + (i * 8), 64);
    }

    sub_020509BC(&temp);
    Rand16Bit();
    sub_020634F4();

    return temp.result;
}

u32 sub_0205BFB0(u32 p0, u32 p1)
{
    struct WriteMonsterInfoToSave_struct stack_var;

    sub_02050990(&stack_var, p0, p1);
    CopyBitsTo(&stack_var, &_022B57BC, 32);

    for (s32 i = 0; i < 32; i++)
    {
        sub_0205C440(&stack_var, &_020B0A54.struct0[i]);
    }

    struct ground_monster *monster = _020B0A54.struct1.unk8.monster;
    CopyBitsTo(&stack_var, &monster->is_valid, 4);
    CopyBitsTo(&stack_var, &monster->level, 7);
    Copy16BitsTo(&stack_var, &monster->joined_at);
    CopyBitsTo(&stack_var, &monster->id, 11);
    sub_02059AF8(&stack_var, &monster->level_at_first_evo);
    sub_02059AF8(&stack_var, &monster->level_at_second_evo);
    CopyBitsTo(&stack_var, &monster->iq, 10);
    CopyBitsTo(&stack_var, &monster->max_hp, 10);
    CopyBitsTo(&stack_var, &monster->offensive_stats[0], 8);
    CopyBitsTo(&stack_var, &monster->offensive_stats[1], 8);
    CopyBitsTo(&stack_var, &monster->defensive_stats[0], 8);
    CopyBitsTo(&stack_var, &monster->defensive_stats[1], 8);
    CopyBitsTo(&stack_var, &monster->exp, 24);
    CopyBitsTo(&stack_var, &monster->iq_skill_flags, 69);
    CopyBitsTo(&stack_var, &monster->tactic, 4);
    CopyMovesetTo(&stack_var, monster->moves);
    CopyBitsTo(&stack_var, monster->name, 80);

    struct unkStruct_020B0A54_unk8_inner *inner = _020B0A54.struct1.unk8.unk8;
    CopyBitsTo(&stack_var, &inner->unk46, 11);
    CopyBitsTo(&stack_var, &inner->unk48, 11);

    CopyBitsTo(&stack_var, (void*) _020B0A54.struct1.unk4, 32);

    for (s32 i = 0; i < 32; i++)
    {
        CopyBitsTo(&stack_var, _020B0A54.fp[1] + 4 + (i * 8), 64);
    }

    sub_020509BC(&stack_var);

    return stack_var.result;
}

void sub_0205C19C(struct WriteMonsterInfoToSave_struct *write_info, struct unkStruct_020B0A54 *arg1)
{
    CopyBitsFrom(write_info, &arg1->unk0, 4);
    Copy16BitsFrom(write_info, &arg1->unk4);
    CopyBitsFrom(write_info, &arg1->unk8.monster, 24);
    CopyBitsFrom(write_info, &arg1->unkC, 64);
    CopyBitsFrom(write_info, &arg1->unk14, 0x40);
    CopyBitsFrom(write_info, &arg1->unk1C, 4);
    CopyBitsFrom(write_info, &arg1->unk1D, 0x50);
    CopyBitsFrom(write_info, &arg1->unk32, 0x120);
    CopyBitsFrom(write_info, &arg1->unk56, 0x240);
    CopyBitsFrom(write_info, &arg1->unkA0, 0xb);
    CopyBitsFrom(write_info, &arg1->unkA2, 0xb);
    CopyBitsFrom(write_info, &arg1->unkA4, 0x40);
    CopyBitsFrom(write_info, &arg1->unkAC, 8);
    bool8 temp;
    CopyBitsFrom(write_info, &temp, 1);
    arg1->unkAD = temp != FALSE;
    CopyBitsFrom(write_info, &arg1->unkAE, 2);
}
