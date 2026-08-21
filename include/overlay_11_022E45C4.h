#ifndef PMDSKY_OVERLAY_11_022E45C4_H
#define PMDSKY_OVERLAY_11_022E45C4_H

#include "file.h"

void ov11_022E45C4(void);
void ov11_022E45DC(void);
void ov11_022E45F4(s8 *p);
void ov11_022E4600(s8 *dst, s8 *src);
s32 ov11_022E4630(s8 *p);
s32 ov11_022E465C(s8 *a, char *b);
void ov11_022E466C(s8 *src, s8 *dst);
void ov11_022E469C(s8 *src, s8 *dst);
void LoadFileFromRomVeneer(struct iovec *iov, const char *filepath, u32 flags);
s32 ov11_022E46E8(struct iovec *iov, const char *filepath);

#endif
