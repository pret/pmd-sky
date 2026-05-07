#include "main_02059334.h"
#include "save.h"
#include "main_02014A4C.h"

extern void CopyBitsTo(void *ctx, void *src, s32 nbits);
extern void Copy16BitsTo(void *stream, void *buf_write);
extern void* memset(void *s, s32 c, u32 n);
extern void CopyBitsFrom(void *stream, void *buf_read, s32 nbits);
extern void Copy16BitsFrom(void *stream, void *buf_read);

void WriteMonsterToSave(struct bitstream *stream, struct ground_monster *monster)
{
    CopyBitsTo(stream, &monster->is_valid, 1);
    CopyBitsTo(stream, &monster->level, 7);
    CopyBitsTo(stream, &monster->id, 11);
    Copy16BitsTo(stream, &monster->joined_at);
    CopyBitsTo(stream, &monster->level_at_first_evo, 7);
    CopyBitsTo(stream, &monster->level_at_second_evo, 7);
    CopyBitsTo(stream, &monster->iq, 10);
    CopyBitsTo(stream, &monster->max_hp, 10);
    CopyBitsTo(stream, &monster->offensive_stats[0], 8);
    CopyBitsTo(stream, &monster->offensive_stats[1], 8);
    CopyBitsTo(stream, &monster->defensive_stats[0], 8);
    CopyBitsTo(stream, &monster->defensive_stats[1], 8);
    CopyBitsTo(stream, &monster->exp, 24);
    CopyBitsTo(stream, &monster->iq_skill_flags, 69);
    CopyBitsTo(stream, &monster->tactic, 4);
    CopyMovesetToStream(stream, (struct ground_move*)&monster->moves);
    CopyBitsTo(stream, &monster->name, 80);
}

void ReadMonsterFromSave(struct bitstream *stream, struct ground_monster *monster)
{
    memset(monster, 0, 68);
    CopyBitsFrom(stream, &monster->is_valid, 1);
    CopyBitsFrom(stream, &monster->level, 7);
    CopyBitsFrom(stream, &monster->id, 11);
    Copy16BitsFrom(stream, &monster->joined_at);
    CopyBitsFrom(stream, &monster->level_at_first_evo, 7);
    CopyBitsFrom(stream, &monster->level_at_second_evo, 7);
    CopyBitsFrom(stream, &monster->iq, 10);
    CopyBitsFrom(stream, &monster->max_hp, 10);
    CopyBitsFrom(stream, &monster->offensive_stats[0], 8);
    CopyBitsFrom(stream, &monster->offensive_stats[1], 8);
    CopyBitsFrom(stream, &monster->defensive_stats[0], 8);
    CopyBitsFrom(stream, &monster->defensive_stats[1], 8);
    CopyBitsFrom(stream, &monster->exp, 24);
    CopyBitsFrom(stream, &monster->iq_skill_flags, 69);
    CopyBitsFrom(stream, &monster->tactic, 4);
    CopyMovesetFromStream(stream, (struct ground_move*)&monster->moves);
    CopyBitsFrom(stream, &monster->name, 80);
}
