#include "main_02051FF0.h"
#include "main_020526EC.h"
#include "main_02008BD4.h"
#include "main_02001188.h"
#include "main_0202593C.h"
#include "monster_data.h"
#include "ground_bg.h"
#include <stdarg.h>

extern void LoadFileFromRom(struct iovec *iov, const char *filepath, u32 flags);
extern s32 GetAtSize(void *data);
extern void DecompressAtNormalVeneer(void *dest, u32 size, void *src);
extern void LoadM2nAndN2m(void);
extern s16 GetBaseForm(s16 id);
extern u8 *strncpy(u8 *dst, const u8 *src, u32 n);
extern s32 vsprintf(u8 *str, const u8 *format, va_list ap);

extern const char _020A31B8[];
extern const char _020A31D4[];
extern const char _020A31E4[];
extern const char _020A31F4[];
extern const char _020A31FC[];
#ifdef JAPAN
extern const char _020A45C8_JP[];
#endif
extern const char *const UNOWN_SPECIES_ADDITIONAL_CHAR_PTR_TABLE[28];
extern const RGB_Array ARM9_UNKNOWN_PTR__NA_20A2C84;

struct unk_020B09B0_sub {
    u8 field_0x0[0x10];
    u32 field_0x10;
    u8 field_0x14[4];
};

struct unk_020B09B0_job {
    s32 field_0x0;
    void *field_0x4;
    s32 field_0x8;
    s32 field_0xc;
    s32 field_0x10;
};

struct unk_020B09B0 {
    struct unk_020B09B0_sub field_0x0[2][2];
    struct unk_020B09B0_job field_0x60[16];
    s16 field_0x1a0;
    u8 field_0x1a2[0x1cc - 0x1a2];
    struct UnkStruct_2324CBC_Sub98 field_0x1cc[2];
};

extern struct unk_020B09B0 *_020B09B0;

extern void sub_02051804(struct unk_020B09B0_job *jobs, u32 a, const void *b,
                         s32 c, s32 d, u32 e);
extern void sub_02051D8C(s16 a, s32 b, u16 c, s32 d, s32 e);
extern void sub_02051E60(s32 a, s32 b);

s32 sub_02051FF0(const char *path, void **outPtr, s32 param2)
{
    struct iovec handle;

    LoadFileFromRom(&handle, path, param2);

    s32 size = GetAtSize(handle.iov_base);

    if (size <= 0) {
        *outPtr = handle.iov_base;
        size = handle.iov_len;
    } else {
        void *dest = MemAlloc((u32)size, 0);

        DecompressAtNormalVeneer(dest, (u32)size, handle.iov_base);
        *outPtr = dest;
        size = ((s32 *)dest)[3];
        UnloadFile(&handle);
    }

    return size;
}

void sub_02052060(const char *path, u32 a1, s32 a2, s32 a3, s32 a4, s32 a5)
{
    struct unk_02052060 *hdr;
    RGB_Array rgb;
    RGB_Array tmp;
    RGB_Array color;
    s32 sy;
    u32 row;
    u8 *map;
    u16 n;
    u16 limit;
    u8 *data;
    s32 size;
    u16 i;
    s32 k;
    s32 x;
    s32 y;
    u32 dst;
    const u8 *src;

    dst = _020B09B0->field_0x0[a5][a4].field_0x10;
    size = sub_02051FF0(path, (void **)&hdr, 0xF);
    data = (u8 *)hdr;
    sub_02051804(_020B09B0->field_0x60, dst + a1, data + hdr->field_0x8, size, 0, 0);
    sub_02051804(_020B09B0->field_0x60, 0, data, 0, 1, 0);

    map = data + hdr->field_0x10;
    limit = 0x20 - a2;
    y = a2;
    for (i = 0; i < limit; i++, y++) {
        row = (u32)(map + y * 64);
        sy = (s16)y;
        x = 0;
        for (n = 0; n < 0x20; n++) {
            u32 v = *(u16 *)((x << 1) + row);
            v = (u16)((u16)(v & 0xFFF) + (a1 >> 5)) |
                (u16)((a3 + ((v << 4) >> 16)) << 12);
            sub_02051D8C(x, sy, v,
                         a4, a5);
            x++;
        }
    }
    sub_02051E60(a4, a5);

    src = data + hdr->field_0x0;
    k = 0;
    color = ARM9_UNKNOWN_PTR__NA_20A2C84;
    for (; k < hdr->field_0x4 / 4; k++, src += 4) {
        s32 id;

        tmp = color;
        tmp.c[0] = src[0];
        tmp.c[1] = src[1];
        tmp.c[2] = src[2];
        tmp.c[3] = src[3];
        rgb = tmp;
        id = k + a3 * 16;
        if (id >= 0x100)
            break;
        CopyColorToPaletteDataRgba(&_020B09B0->field_0x1cc[a5], (u16)(s16)id, &rgb);
    }
    MarkPaletteDataAsNeedingUpdate(&_020B09B0->field_0x1cc[a5]);
}
