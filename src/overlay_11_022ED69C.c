#include "overlay_11_022ED69C.h"
#include "main_0200330C.h"

bool8 ov11_022ED69C(GroundBg *dst, GroundBg *src)
{
    LayerSpecs *ls1;
    LayerSpecs *ls2;
    s32 i;
    s32 j;
    s32 k;
    struct bg_list_entry entry;
    UnkGroundBg_4 *sub4;
    s32 n;
    u16 *p1;
    s32 i2;
    s32 j2;
    s32 idx;
    struct UnkStruct_2324CBC_Sub98 *unkSubPtr;
    const void *data1;
    const RGB_Array *rgb;
    const AnimationSpecification *spec;
    MapRender *render1;
    MapRender *render2;
    BplHeader *bpl1;
    BplHeader *bpl2;
    BmaHeader *bma1;
    BmaHeader *bma2;
    u16 v1;

    if (src->unk1BE == -1) {
        ov11_022EC08C(dst);
        return FALSE;
    }

    GroundBg_CloseOpenedFiles(dst);
    data1 = src->bplFile.iov_base;
    dst->newUnk0 = 3;
    dst->unk1C0 = 0;
    dst->unk1BE = src->unk1BE;
    dst->unk1C4 = src->unk1C4;
    LoadBackgroundAttributes(&entry, dst->unk1BE);

    bpl1 = &dst->bplHeader;
    bpl2 = &src->bplHeader;
    bpl1->numPalettes = bpl2->numPalettes;
    bpl1->hasPalAnimations = bpl2->hasPalAnimations;

    for (i = 0; i < NUM_LAYERS; i++) {
        ls1 = &dst->layerSpecs[i];
        ls2 = &src->layerSpecs[i];

        ls1->numTiles = ls2->numTiles;

        for (j = 0; j < MAX_BPA_SLOTS; j++) {
            ls1->bpaSlotNumTiles[j] = ls2->bpaSlotNumTiles[j];
        }

        ls1->numChunks = ls2->numChunks;
    }

    bma1 = &dst->bmaHeader;
    bma2 = &src->bmaHeader;
    bma1->mapWidthTiles = bma2->mapWidthTiles;
    bma1->mapHeightTiles = bma2->mapHeightTiles;
    bma1->mapWidthChunks = bma2->mapWidthChunks;
    bma1->mapHeightChunks = bma2->mapHeightChunks;
    bma1->numLayers = bma2->numLayers;
    bma1->hasDataLayer = bma2->hasDataLayer;
    bma1->hasCollision = bma2->hasCollision;

    unkSubPtr = &ov11_02324CBC->unk98[dst->unk2BC.unk0];
    v1 = dst->unk2BC.unk6 * 16;
    rgb = data1 + 4;
    for (i = 0; i < bpl1->numPalettes && i < dst->unk2BC.unk8; i++) {
        CopyColorToPaletteDataRgba(unkSubPtr, v1++, &ov11_02320BF4);
        FillPaletteDataRgba(unkSubPtr, v1, rgb, 15);
        v1 += 15;
        rgb += 15;
    }

    for (; i < dst->unk2BC.unk8; i++) {
        CopyColorToPaletteDataRgba(unkSubPtr, v1++, &ov11_02320BF4);

        for (j = 1; j < 16; j++) {
            CopyColorToPaletteDataRgba(unkSubPtr, v1++, &ov11_02320BE8);
        }
    }

    MarkPaletteDataAsNeedingUpdate(unkSubPtr);

    sub4 = dst->unk4;
    n = 0;

    if (bpl1->hasPalAnimations) {
        s32 v2 = bpl1->numPalettes * 15;
        const void *data2;

        spec = data1 + 4 + v2 * 4;
        data2 = spec + bpl1->numPalettes;
        rgb = data2;
        dst->animationSpecifications = spec;
        dst->unk1FB = 1;
        dst->unk1BC = 0;
        dst->unk1F8 = src->unk1F8;
        dst->unk1F9 = src->unk1FA;
        dst->unk1FA = src->unk1FA;
        dst->unk1EE = src->unk1EE;

        for (; n < bpl1->numPalettes && n < dst->unk2BC.unk8;
             n++, sub4++, spec++) {
            if (spec->numFrames > 0) {
                sub4->unk4 = rgb;
                rgb += spec->numFrames * 15;
            } else {
                sub4->unk4 = NULL;
            }

            sub4->unk0 = 0;
            sub4->unk2 = 0;
            sub4->unk8 = NULL;
        }
    } else {
        dst->animationSpecifications = NULL;
        dst->unk1F8 = 0;
        dst->unk1F9 = 0;
        dst->unk1FA = 0;
        dst->unk1FB = 0;
        dst->unk1BC = 0;
    }

    for (; n < UNK_4_ARR_COUNT; n++, sub4++) {
        sub4->unk0 = 0;
        sub4->unk2 = 0;
        sub4->unk8 = NULL;
        sub4->unk4 = NULL;
    }

    for (i = 0; i < UNK_C4_ARR_COUNT; i++) {
        UnkGroundBg_C4 *subC4 = &dst->unkC4[i];

        subC4->unk0 = 0;
        subC4->unk1 = 0;
        subC4->unk4 = 0;
        subC4->unk2 = 0;
        ZInit8(&subC4->bpaFile);
        subC4->unk10 = NULL;
        subC4->unk18 = NULL;
        subC4->unk14 = NULL;
        subC4->unk20 = NULL;
        subC4->unk24 = subC4->unk1C = NULL;
        subC4->unk28 = 0;
    }

    k = dst->unk2BC.unk2;

    for (i = 0; i < dst->unk2BC.numLayers; i++, k++) {
        s32 v3 = (i == 0) ? 0 : 2;
        s32 v4 = (i == 0) ? 0 : 4;
        LayerSpecs *ls3 = &dst->layerSpecs[i];
        u16 *p2 = ov11_02320C18[dst->unk2BC.unk0][k];

        s32 v5 = dst->unk2BC.unkA;

        v5 += ls3->numTiles;
        p1 = p2 + v5 * 16;

        for (j = 0; j < 2; j++, v4++, v3++) {
            UnkGroundBg_C4 *srcC4 = &src->unkC4[v3];
            UnkGroundBg_C4 *dstC4 = &dst->unkC4[v3];

            const char *bpaName = entry.others_bpa[v4].name;

            if (bpaName[0] != 0) {
                struct BpaHeader *bpa;
                s32 *p3;
                void *p4;
                s32 v6;

                dstC4->bpaFile = srcC4->bpaFile;
                dstC4->unk0 = 1;
                dstC4->unk1 = 1;
                bpa = dstC4->bpaFile.iov_base;
                dstC4->unk10 = bpa;
                p3 = &bpa->durationPerFrame[0];
                v6 = bpa->numFrames;
                dstC4->unk14 = dstC4->unk18 = p3;
                p4 = p3 + v6;
                dstC4->unk1C = dstC4->unk20 = p4;
                dstC4->unk2 = 0;
                dstC4->unk4 = *dstC4->unk18;
                dstC4->unk24 = p1;
                dstC4->unk28 = ls3->bpaSlotNumTiles[j] * 32;
                p1 += ls3->bpaSlotNumTiles[j] * 16;
            }

        }

    }

    k = dst->unk2BC.unk2;

    for (i2 = 0; i2 < dst->unk2BC.numLayers; i2++, k++) {
        LayerSpecs *ls3 = &src->layerSpecs[i2];
        s32 v7 = ls3->numTiles;

        for (j2 = 0; j2 < MAX_BPA_SLOTS; j2++) {
            v7 += ls3->bpaSlotNumTiles[j2];
        }

        if (v7 > 0) {
            Memcpy16(ov11_02320C18[dst->unk2BC.unk0][k],
                     ov11_02320C18[src->unk2BC.unk0][k], v7 * 32);
        }

        dst->unk2DC[i2] = src->unk2DC[i2];
        dst->unk2E4[i2] = src->unk2E4[i2];
    }

    dst->unk1FC = src->unk1FC;
    render1 = src->mapRender;
    render2 = dst->mapRender;
    for (i = 0; i < dst->unk1FC; i++, render2++, render1++) {
        *render2 = *render1;
        idx = render2->unk2;

        for (j = 0; j < render2->numBgs && idx < dst->unk2BC.numLayers;
             j++, idx++) {
            render2->unk2C[j] = dst->unk2EC[idx];
        }

        for (; j < 2; j++) {
            render2->unk1C[j] = NULL;
            render2->unk24[j] = NULL;
            render2->unk2C[j] = NULL;
        }

        ov11_022EE9B0(render2, dst->cameraPixelPosition);
    }

    for (; i < 2; i++, render2++) {
        ov11_022EE8CC(render2, dst, 0, 0, 0, 0);
    }

    return TRUE;
}
