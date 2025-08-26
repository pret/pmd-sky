#include "ground_bg.h"

// TODO: Merge with ground_bg.c once the functions in the middle are decompiled

const u8 * BmaLayerNrlDecompressor(u16 **dstArray, const void *bmaData, UnkGroundBg_2BC *a2, BmaHeader *bmaHeader)
{
    s32 i, k, j, l;
    const u8 *src = bmaData;

    for (i = 0; i < a2->numLayers; i++) {
        // Interestingly enough it's just dstArray[i] in Red
        u16 *dst = dstArray[a2->numLayers - i - 1];
        for (j = 0; j < bmaHeader->mapHeightChunks; j++) {
            k = 0;
            if (j == 0) {
                while (k < bmaHeader->mapWidthChunks) {
                    s32 cmd = *src++;
                    if (cmd >= 0xc0) {
                        for (l = 0xC0; l <= cmd; l++) {
                            s32 dstVal = src[0] | (src[1] << 8) | (src[2] << 16); src += 3;
                            *dst++ = dstVal & 0xFFF;
                            *dst++ = (dstVal >> 12) & 0xFFF;
                        }
                        k += (cmd - 0xBF) * 2;
                    }
                    else if (cmd >= 0x80) {
                        s32 dstVal = src[0] | (src[1] << 8) | (src[2] << 16); src += 3;
                        for (l = 0x80; l <= cmd; l++) {
                            *dst++ = dstVal & 0xFFF;
                            *dst++ = (dstVal >> 12) & 0xFFF;
                        }
                        k += (cmd - 0x7F) * 2;
                    }
                    else {
                        for (l = 0; l <= cmd; l++) {
                            *dst++ = 0;
                            *dst++ = 0;
                        }
                        k += (cmd + 1) * 2;
                    }
                }
            }
            else {
                u16 *ptrVal = dst - 64;
                while (k < bmaHeader->mapWidthChunks) {
                    s32 cmd = *src++;
                    if (cmd >= 0xC0) {
                        for (l = 0xC0; l <= cmd; l++) {
                            s32 dstVal = src[0] | (src[1] << 8) | (src[2] << 16); src += 3;
                            *dst++ = *ptrVal++ ^ (dstVal & 0xFFF);
                            *dst++ = *ptrVal++ ^ ((dstVal >> 12) & 0xFFF);
                        }
                        k += (cmd - 0xBF) * 2;
                    }
                    else if (cmd >= 0x80) {
                        s32 dstVal = src[0] | (src[1] << 8) | (src[2] << 16); src += 3;
                        for (l = 0x80; l <= cmd; l++) {
                            *dst++ = *ptrVal++ ^ (dstVal & 0xFFF);
                            *dst++ = *ptrVal++ ^ ((dstVal >> 12) & 0xFFF);
                        }
                        k += (cmd - 0x7F) * 2;
                    }
                    else {
                        for (l = 0; l <= cmd; l++) {
                            *dst++ = *ptrVal++;
                            *dst++ = *ptrVal++;
                        }
                        k += (cmd + 1) * 2;
                    }
                }
            }

            for (; k < 64; k++) {
                *dst++ = 0;
            }
        }
        for (; j < a2->unk14; j++) {
            for (k = 0; k < 64; k++) {
                *dst++ = 0;
            }
        }
    }

    return src;
}
