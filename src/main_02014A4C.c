#include "main_02014A4C.h"

extern void CopyBitsTo(struct bitstream *stream, void *src, u32 nbits);
extern void CopyBitsFrom(struct bitstream *stream, void *dst, u32 nbits);

void CopyMoveToStream(struct bitstream * stream, struct ground_move * src )
{
    CopyBitsTo(stream, &src->flags0, 4);
    CopyBitsTo(stream, &src->id, 10);
    CopyBitsTo(stream, &src->ginseng, 7);
}

void CopyMoveFromStream(struct bitstream * stream, struct ground_move * dst )
{
    CopyBitsFrom(stream, &dst->flags0, 4);
    CopyBitsFrom(stream, &dst->id, 10);
    CopyBitsFrom(stream, &dst->ginseng, 7);
}

void CopyMovesetToStream(struct bitstream * stream, struct ground_move * src)
{
    for (s32 i = 0; i < 4; i++) {
        CopyMoveToStream(stream, &src[i]);
    }
}

void CopyMovesetFromStream(struct bitstream * stream, struct ground_move * dst)
{
    for (s32 i = 0; i < 4; i++) {
        CopyMoveFromStream(stream, &dst[i]);
    }
}
