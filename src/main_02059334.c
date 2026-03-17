#include "main_02059334.h"

extern void CopyBitsTo(void *ctx, void *src, s32 nbits);
extern void sub_020515C4(struct WriteMonsterInfoToSave_struct *p0, void *p1);
extern void CopyMovesetTo(void *write_info, void *buffer_write);

void WriteMonsterToSave(struct WriteMonsterInfoToSave_struct *write_info, struct ground_monster *monster)
{
    CopyBitsTo(write_info, &monster->is_valid, 1);
    CopyBitsTo(write_info, &monster->level, 7);
    CopyBitsTo(write_info, &monster->id, 11);
    sub_020515C4(write_info, &monster->joined_at);
    CopyBitsTo(write_info, &monster->level_at_first_evo, 7);
    CopyBitsTo(write_info, &monster->level_at_second_evo, 7);
    CopyBitsTo(write_info, &monster->iq, 10);
    CopyBitsTo(write_info, &monster->max_hp, 10);
    CopyBitsTo(write_info, &monster->offensive_stats[0], 8);
    CopyBitsTo(write_info, &monster->offensive_stats[1], 8);
    CopyBitsTo(write_info, &monster->defensive_stats[0], 8);
    CopyBitsTo(write_info, &monster->defensive_stats[1], 8);
    CopyBitsTo(write_info, &monster->exp, 24);
    CopyBitsTo(write_info, &monster->iq_skill_flags, 69);
    CopyBitsTo(write_info, &monster->tactic, 4);
    CopyMovesetTo(write_info, &monster->moves);
    CopyBitsTo(write_info, &monster->name, 80);
}
