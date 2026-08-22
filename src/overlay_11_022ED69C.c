#include "overlay_11_022ED69C.h"
#include "main_0200330C.h"

bool8 ov11_022ED69C(GroundBg *dst, GroundBg *src)
{
    LayerSpecs *ds;
    LayerSpecs *ss;
    s32 i;
    s32 j;
    s32 k;
    struct bg_list_entry entry;
    UnkGroundBg_4 *sub4Ptr;
    s32 n;
    u16 *vram;
    s32 si;
    s32 sj;
    s32 bgIdx;
    struct UnkStruct_2324CBC_Sub98 *unkSubPtr;
    const void *bplData;
    const RGB_Array *palData;
    const AnimationSpecification *spec;
    MapRender *srcRender;
    MapRender *dstRender;
    BplHeader *bplHeader;
    BplHeader *srcBpl;
    BmaHeader *dstBma;
    BmaHeader *srcBma;
    u16 palId;

    if (src->unk1BE == -1) {
        ov11_022EC08C(dst);
        return FALSE;
    }

    GroundBg_CloseOpenedFiles(dst);
    bplData = src->bplFile.iov_base;
    dst->newUnk0 = 3;
    dst->unk1C0 = 0;
    dst->unk1BE = src->unk1BE;
    dst->unk1C4 = src->unk1C4;
    LoadBackgroundAttributes(&entry, dst->unk1BE);

    bplHeader = &dst->bplHeader;
    srcBpl = &src->bplHeader;
    bplHeader->numPalettes = srcBpl->numPalettes;
    bplHeader->hasPalAnimations = srcBpl->hasPalAnimations;

    for (i = 0; i < NUM_LAYERS; i++) {
        ds = &dst->layerSpecs[i];
        ss = &src->layerSpecs[i];

        ds->numTiles = ss->numTiles;

        for (j = 0; j < MAX_BPA_SLOTS; j++) {
            ds->bpaSlotNumTiles[j] = ss->bpaSlotNumTiles[j];
        }

        ds->numChunks = ss->numChunks;
    }

    dstBma = &dst->bmaHeader;
    srcBma = &src->bmaHeader;
    dstBma->mapWidthTiles = srcBma->mapWidthTiles;
    dstBma->mapHeightTiles = srcBma->mapHeightTiles;
    dstBma->mapWidthChunks = srcBma->mapWidthChunks;
    dstBma->mapHeightChunks = srcBma->mapHeightChunks;
    dstBma->numLayers = srcBma->numLayers;
    dstBma->hasDataLayer = srcBma->hasDataLayer;
    dstBma->hasCollision = srcBma->hasCollision;

    unkSubPtr = &ov11_02324CBC->unk98[dst->unk2BC.unk0];
    palId = dst->unk2BC.unk6 * 16;
    palData = bplData + 4;
    for (i = 0; i < bplHeader->numPalettes && i < dst->unk2BC.unk8; i++) {
        CopyColorToPaletteDataRgba(unkSubPtr, palId++, &ov11_02320BF4);
        FillPaletteDataRgba(unkSubPtr, palId, palData, 15);
        palId += 15;
        palData += 15;
    }

    for (; i < dst->unk2BC.unk8; i++) {
        CopyColorToPaletteDataRgba(unkSubPtr, palId++, &ov11_02320BF4);

        for (j = 1; j < 16; j++) {
            CopyColorToPaletteDataRgba(unkSubPtr, palId++, &ov11_02320BE8);
        }
    }

    MarkPaletteDataAsNeedingUpdate(unkSubPtr);

    sub4Ptr = dst->unk4;
    n = 0;

    if (bplHeader->hasPalAnimations) {
        s32 numPals = bplHeader->numPalettes * 15;
        const void *afterSpecs;

        spec = bplData + 4 + numPals * 4;
        afterSpecs = spec + bplHeader->numPalettes;
        palData = afterSpecs;
        dst->animationSpecifications = spec;
        dst->unk1FB = 1;
        dst->unk1BC = 0;
        dst->unk1F8 = src->unk1F8;
        dst->unk1F9 = src->unk1FA;
        dst->unk1FA = src->unk1FA;
        dst->unk1EE = src->unk1EE;

        for (; n < bplHeader->numPalettes && n < dst->unk2BC.unk8;
             n++, sub4Ptr++, spec++) {
            if (spec->numFrames > 0) {
                sub4Ptr->unk4 = palData;
                palData += spec->numFrames * 15;
            } else {
                sub4Ptr->unk4 = NULL;
            }

            sub4Ptr->unk0 = 0;
            sub4Ptr->unk2 = 0;
            sub4Ptr->unk8 = NULL;
        }
    } else {
        dst->animationSpecifications = NULL;
        dst->unk1F8 = 0;
        dst->unk1F9 = 0;
        dst->unk1FA = 0;
        dst->unk1FB = 0;
        dst->unk1BC = 0;
    }

    for (; n < UNK_4_ARR_COUNT; n++, sub4Ptr++) {
        sub4Ptr->unk0 = 0;
        sub4Ptr->unk2 = 0;
        sub4Ptr->unk8 = NULL;
        sub4Ptr->unk4 = NULL;
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
        s32 c4Idx = (i == 0) ? 0 : 2;
        s32 bpaIdx = (i == 0) ? 0 : 4;
        LayerSpecs *sp = &dst->layerSpecs[i];
        u16 *layerVram = ov11_02320C18[dst->unk2BC.unk0][k];

        s32 tiles = dst->unk2BC.unkA;

        tiles += sp->numTiles;
        vram = layerVram + tiles * 16;

        for (j = 0; j < 2; j++, bpaIdx++, c4Idx++) {
            UnkGroundBg_C4 *srcC4 = &src->unkC4[c4Idx];
            UnkGroundBg_C4 *dstC4 = &dst->unkC4[c4Idx];

            const char *bpaName = entry.others_bpa[bpaIdx].name;

            if (bpaName[0] != 0) {
                struct BpaHeader *hdr;
                s32 *frames;
                void *end;
                s32 numFrames;

                dstC4->bpaFile = srcC4->bpaFile;
                dstC4->unk0 = 1;
                dstC4->unk1 = 1;
                hdr = dstC4->bpaFile.iov_base;
                dstC4->unk10 = hdr;
                frames = &hdr->durationPerFrame[0];
                numFrames = hdr->numFrames;
                dstC4->unk14 = dstC4->unk18 = frames;
                end = frames + numFrames;
                dstC4->unk1C = dstC4->unk20 = end;
                dstC4->unk2 = 0;
                dstC4->unk4 = *dstC4->unk18;
                dstC4->unk24 = vram;
                dstC4->unk28 = sp->bpaSlotNumTiles[j] * 32;
                vram += sp->bpaSlotNumTiles[j] * 16;
            }

        }

    }

    k = dst->unk2BC.unk2;

    for (si = 0; si < dst->unk2BC.numLayers; si++, k++) {
        LayerSpecs *sp = &src->layerSpecs[si];
        s32 total = sp->numTiles;

        for (sj = 0; sj < MAX_BPA_SLOTS; sj++) {
            total += sp->bpaSlotNumTiles[sj];
        }

        if (total > 0) {
            Memcpy16(ov11_02320C18[dst->unk2BC.unk0][k],
                     ov11_02320C18[src->unk2BC.unk0][k], total * 32);
        }

        dst->unk2DC[si] = src->unk2DC[si];
        dst->unk2E4[si] = src->unk2E4[si];
    }

    dst->unk1FC = src->unk1FC;
    srcRender = src->mapRender;
    dstRender = dst->mapRender;
    for (i = 0; i < dst->unk1FC; i++, dstRender++, srcRender++) {
        *dstRender = *srcRender;
        bgIdx = dstRender->unk2;

        for (j = 0; j < dstRender->numBgs && bgIdx < dst->unk2BC.numLayers;
             j++, bgIdx++) {
            dstRender->unk2C[j] = dst->unk2EC[bgIdx];
        }

        for (; j < 2; j++) {
            dstRender->unk1C[j] = NULL;
            dstRender->unk24[j] = NULL;
            dstRender->unk2C[j] = NULL;
        }

        ov11_022EE9B0(dstRender, dst->cameraPixelPosition);
    }

    for (; i < 2; i++, dstRender++) {
        ov11_022EE8CC(dstRender, dst, 0, 0, 0, 0);
    }

    return TRUE;
}
