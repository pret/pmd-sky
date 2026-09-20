#include "main_02050D84.h"
#include "main_020504A4.h"
#include "progression.h"

struct unk_022AB918 {
#ifdef JAPAN
    u8 field_0x0[8];
#else
    u8 field_0x0[0xc];
#endif
    s32 field_0xc;
    u8 field_0x10;
};

extern struct unk_022AB918 TEAM_NAME;
#ifdef JAPAN
extern u8 _022AB918[8];
#else
extern u8 _022AB918[0xc];
#endif
extern s32 _022AB924;
extern u8 ARM9_UNKNOWN_DATA__NA_209E6BC;
extern u8 _0209E6BD;

s32 sub_02050D84(void *buf, s32 len)
{
    u8 value;
    struct bitstream stream;

    InitBitstreamForWrite(&stream, buf, len);
#ifdef JAPAN
    CopyBitsFrom(&stream, _022AB918, 0x28);
#else
    CopyBitsFrom(&stream, _022AB918, 0x50);
#endif
    CopyBitsFrom(&stream, &_022AB924, 0x20);
    CopyBitsFrom(&stream, &value, 1);
    TEAM_NAME.field_0x10 = (value & 1) != FALSE;
    BitstreamDebug(&stream);
    return stream.bit_idx;
}
