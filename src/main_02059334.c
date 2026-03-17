#include "main_02059334.h"

extern void CopyBitsTo(void *ctx, void *src, s32 nbits);
extern void Copy16BitsTo(struct WriteMonsterInfoToSave_struct *p0, void *p1);
extern void CopyMovesetTo(void *write_info, void *buffer_write);
extern void* memset(void *s, s32 c, u32 n);
extern void CopyBitsFrom(void *read_info, void *buf_read, s32 nbits);
extern void Copy16BitsFrom(void *read_info, void *buf_read);
extern void CopyMovesetFrom(struct WriteMonsterInfoToSave_struct *read_info, void *dst);

void WriteMonsterToSave(struct WriteMonsterInfoToSave_struct *write_info, struct ground_monster *monster)
{
    CopyBitsTo(write_info, &monster->is_valid, 1);
    CopyBitsTo(write_info, &monster->level, 7);
    CopyBitsTo(write_info, &monster->id, 11);
    Copy16BitsTo(write_info, &monster->joined_at);
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

void ReadMonsterFromSave(struct WriteMonsterInfoToSave_struct *read_info, struct ground_monster *monster)
{
    memset(monster, 0, 68);
    CopyBitsFrom(read_info, &monster->is_valid, 1);
    CopyBitsFrom(read_info, &monster->level, 7);
    CopyBitsFrom(read_info, &monster->id, 11);
    Copy16BitsFrom(read_info, &monster->joined_at);
    CopyBitsFrom(read_info, &monster->level_at_first_evo, 7);
    CopyBitsFrom(read_info, &monster->level_at_second_evo, 7);
    CopyBitsFrom(read_info, &monster->iq, 10);
    CopyBitsFrom(read_info, &monster->max_hp, 10);
    CopyBitsFrom(read_info, &monster->offensive_stats[0], 8);
    CopyBitsFrom(read_info, &monster->offensive_stats[1], 8);
    CopyBitsFrom(read_info, &monster->defensive_stats[0], 8);
    CopyBitsFrom(read_info, &monster->defensive_stats[1], 8);
    CopyBitsFrom(read_info, &monster->exp, 24);
    CopyBitsFrom(read_info, &monster->iq_skill_flags, 69);
    CopyBitsFrom(read_info, &monster->tactic, 4);
    CopyMovesetFrom(read_info, &monster->moves);
    CopyBitsFrom(read_info, &monster->name, 80);
}
