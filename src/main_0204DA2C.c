#include "main_0204DA2C.h"
#include "main_0200330C.h"
#include "save.h"

extern u8 ARM9_UNKNOWN_TABLE__NA_209E164[];

extern void InitBitstreamForRead(struct bitstream *stream, void* dst, s32 len);
extern void CopyBitsTo(struct bitstream *stream, void* buf_write, s32 nbits);
extern void BitstreamDebug(struct bitstream *stream);

s32 sub_0204DA2C(u8* arg0, void* arg1, u8 arg2)
{
    struct bitstream stream;
    u8 tmp2[54];
    u8 tmp1[34];

    for (int i = 0; i < 34; i++) {
        tmp1[i] = 0;
    }

    for (int i = 0; i < arg2; i++) {
        tmp2[i] = ARM9_UNKNOWN_TABLE__NA_209E164[*arg0];
        if (tmp2[i] == 0xff) {
            return 0;
        }

        arg0++;
    }

    s32 v1 = arg2 * 5;
    s32 v2 = (v1 & 7) + 7;
    InitBitstreamForRead(&stream, tmp1, (v1 >> 3) + (v2 >> 3));

    for (int i = 0; i < arg2; i++) {
        CopyBitsTo(&stream, &tmp2[i], 5);
    }

    BitstreamDebug(&stream);
    MemcpySimple(arg1, tmp1, (v1 >> 3) + (v2 >> 3));
    return 1;
}
