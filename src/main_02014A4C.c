#include "main_02014A4C.h"

extern void CopyBitsTo(struct bitstream *stream, void *src, u32 nbits);
extern void CopyBitsFrom(struct bitstream *stream, void *dst, u32 nbits);

void CopyMoveToStream(struct bitstream * stream, struct ground_move * move )
{
    CopyBitsTo(stream, &move->flags0, 4);
    CopyBitsTo(stream, &move->id, 10);
    CopyBitsTo(stream, &move->ginseng, 7);
}

void CopyMoveFromStream(struct bitstream * stream, struct ground_move * move )
{
    CopyBitsFrom(stream, &move->flags0, 4);
    CopyBitsFrom(stream, &move->id, 10);
    CopyBitsFrom(stream, &move->ginseng, 7);
}
