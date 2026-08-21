#include "overlay_11_022E45C4.h"

extern s32 SsbLoad2(struct iovec *iov, const char *filepath);

extern void LoadFileFromRom(struct iovec *iov, const char *filepath, u32 flags);

extern s8 sub_0200238C(s8 c);

extern s32 sub_020023F8(s8 *a, char *b, s32 n);

extern u8 ov11_02324F70;

extern char ov11_0231968C[8];

extern s32 GetLanguage();

void ov11_022E45C4(void)
{
    ov11_02324F70 = GetLanguage();
}

void ov11_022E45DC(void)
{
    ov11_02324F70 = GetLanguage();
}

void ov11_022E45F4(s8 *p)
{
    *p = 0;
}

void ov11_022E4600(s8 *dst, s8 *src)
{
    s32 i;

    for (i = 0; i < 8; i++) {
        s8 *cur = dst;

        *dst++ = *src++;

        if (*cur == 0) {
            return;
        }
    }
}

s32 ov11_022E4630(s8 *p)
{
    if (p == NULL || *p == 0) {
        return 1;
    }

    return sub_020023F8(p, ov11_0231968C, 8);
}

s32 ov11_022E465C(s8 *a, char *b)
{
    return sub_020023F8(a, b, 8);
}

void ov11_022E466C(s8 *src, s8 *dst)
{
    s32 i;

    for (i = 0; i < 8; i++) {
        s8 c = *src++;

        if (c == 0) {
            break;
        }

        *dst++ = c;
    }

    *dst = 0;
}

void ov11_022E469C(s8 *src, s8 *dst)
{
    s32 i;

    for (i = 0; i < 8; i++) {
        s8 c = *src++;

        if (c == 0) {
            break;
        }

        *dst++ = sub_0200238C(c);
    }

    *dst = 0;
}

void LoadFileFromRomVeneer(struct iovec *iov, const char *filepath, u32 flags)
{
    LoadFileFromRom(iov, filepath, flags);
}

s32 ov11_022E46E8(struct iovec *iov, const char *filepath)
{
    iov->iov_base = NULL;
    return SsbLoad2(iov, filepath);
}
