#include "ground_bg.h"
#include "file_rom.h"

// TODO: Move these to headers
#define RGB_R 0
#define RGB_G 1
#define RGB_B 2
#define RGB_UNK 3
#define RGB_FIELDS_COUNT 4

#define VRAM      0x6000000

typedef struct RGB_Array
{
    u8 c[RGB_FIELDS_COUNT];
} RGB_Array;

struct UnkStruct_2324CBC_Sub98
{
    u8 fill0[7];
    u8 unk8;
    u8 fill9[0x18 - 0x9];
    RGB_Array *unk18;
    u8 fill1C[0x28-0x1c];
};

struct UnkStruct_2324CBC_Sub0
{
    u8 fill0[0x1C];
};

struct UnkStruct_2324CBC
{
    struct UnkStruct_2324CBC_Sub0 unk0[2][2];
    u8 fill70[0x28];
    struct UnkStruct_2324CBC_Sub98 unk98[2];
};

extern struct UnkStruct_2324CBC *ov11_02324CBC;

extern void FileClose(struct file_stream* file);
extern void ZInit8(struct iovec *dst);
extern void* MemAlloc(u32 len, u32 flags);
extern void MemFree(void* ptr);
extern BOOL PointsToZero(struct iovec* ptr);
extern void UnloadFile(struct iovec* ptr);
extern void sub_0200A590(struct UnkStruct_2324CBC_Sub98 *, s32 id, const RGB_Array *src);
extern void sub_0200A504(struct UnkStruct_2324CBC_Sub98 *);
extern s32 sprintf(u8* str, const u8* format, ...);
extern void LoadFileFromRom(struct iovec* iov, const char* filepath, u32 flags);
extern void sub_0200A5B0(struct UnkStruct_2324CBC_Sub98 *, s32 id, const RGB_Array *src, s32);

#define FREE_AND_SET_NULL(ptr)          \
{                                       \
    MemFree(ptr);                       \
    ptr = NULL;                         \
}

#define TRY_FREE_AND_SET_NULL(ptr) if (ptr != NULL) FREE_AND_SET_NULL(ptr)
#define TRY_CLOSE_FILE(f) if (!PointsToZero(&f)) {UnloadFile(&f);}

extern const char ov11_02320C44[];
extern const char ov11_02320C58[];
extern const char ov11_02320C94[];
extern const char ov11_02320C6C[];
extern const char ov11_02320C80[];
extern void *ov11_02320C18[][2]; // Vram ptrs

// Todo: make these static
const RGB_Array ov11_02320BF4 = {0, 0, 0, 0};
const RGB_Array ov11_02320BF0 = {0, 0, 0, 0};
const PixelPos sPositionZero = {0};
const RGB_Array ov11_02320BE8 = {0xFF, 0xFF, 0xFF, 0};
const RGB_Array ov11_02320BEC = {0, 0, 0, 0};
const RGB_Array ov11_02320BE4 = {0, 0, 0, 0};

#define FILE_BG_LIST_ENTRY_SIZE (BG_NAME_LEN * (BPA_MAX_ENTRIES + 3))

void LoadBackgroundAttributes(struct bg_list_entry* entry, int bgId)
{
    s32 i;
    struct file_stream file;

    FileRom_InitDataTransfer();
    FileRom_Veneer_FileInit(&file);
    FileRom_HandleOpen(&file, ov11_02320C44);
    FileRom_HandleSeek(&file, FILE_BG_LIST_ENTRY_SIZE * bgId, 0);

    FileRom_HandleRead(&file, entry->bpl.name, BG_NAME_LEN);
    entry->bpl.name[BG_NAME_LEN] = '\0';
    FileRom_HandleRead(&file, entry->bpc.name, BG_NAME_LEN);
    entry->bpc.name[BG_NAME_LEN] = '\0';
    FileRom_HandleRead(&file, entry->bma.name, BG_NAME_LEN);
    entry->bma.name[BG_NAME_LEN] = '\0';

    for (i = 0; i < BPA_MAX_ENTRIES; i++) {
        FileRom_HandleRead(&file, entry->others_bpa[i].name, BG_NAME_LEN);
        entry->others_bpa[i].name[BG_NAME_LEN] = '\0';
    }

    FileClose(&file);
    FileRom_StopDataTransfer();
}

void ov11_022EBF60(GroundBg *groundBg);
void *sub_0200B500(void *unk);
void sub_02063600(struct UnkGroundBg_1A0 *);
void sub_0206367C(struct UnkGroundBg_1A0 *);
void sub_020635C8(struct UnkGroundBg_194 *);
void sub_020635D8(struct UnkGroundBg_194 *);
void ov11_022EE620(GroundBg *groundBg, s32 a1);

void GroundBg_Init(GroundBg *groundBg, const SubStruct_52C *a1)
{
    SubStruct_0 *unk0Ptr;
    s32 id, unk0Id, unk3E0Id;
    s32 i;
    s32 id2;
    s32 memGroup;

    groundBg->unk52C = *a1;
    memGroup = (groundBg->unk52C.unk0 == 0) ? 6 : 15;
    id2 = groundBg->unk52C.unk2;
    for (id = 0; id < groundBg->unk52C.numLayers; id++, id2++) {
        if (groundBg->unk52C.unkE[id] > 0) {
            groundBg->unk2DC[id] = MemAlloc(groundBg->unk52C.unkE[id] * 18u, memGroup);
        }
        else {
            groundBg->unk2DC[id] = NULL;
        }
    }
    for (; id < NUM_LAYERS; id++, id2++) {
        groundBg->unk2DC[id] = NULL;
    }

    id = groundBg->unk52C.unk2;
    for (id2 = 0; id2 < groundBg->unk52C.numLayers; id2++, id++) {

        if (groundBg->unk52C.unk0 == 0) {
            groundBg->unk2EC[id2] = sub_0200B500(&ov11_02324CBC->unk0[0][id]);
        }
        else {
            groundBg->unk2EC[id2] = sub_0200B500(&ov11_02324CBC->unk0[1][id]);
        }

        if (groundBg->unk52C.unkE[id2] > 0) {
            groundBg->unk2E4[id2] = MemAlloc(groundBg->unk52C.unk14 * 128, memGroup);
        }
        else {
            groundBg->unk2E4[id2] = NULL;
        }
    }
    for (; id2 < 2; id2++) {
        groundBg->unk2EC[id2] = NULL;
        groundBg->unk2E4[id2] = NULL;
    }

    groundBg->unk2D8 = (groundBg->unk52C.unk18 == 0) ? NULL : MemAlloc(groundBg->unk52C.unk12 * 256, memGroup);
    ov11_022EBF60(groundBg);
    groundBg->newUnk0 = 0;
    groundBg->unk1C0 = 0;
    groundBg->unk2BA = 0;
    groundBg->unk1BE = -1;
    groundBg->unk1F0 = 0;
    groundBg->bmaHeader.mapWidthTiles = 0;
    groundBg->bmaHeader.mapHeightTiles = 0;
    groundBg->bmaHeader.mapWidthChunks = 0;
    groundBg->bmaHeader.mapHeightChunks = 0;
    groundBg->unk1EE = 0;
    groundBg->animationSpecifications = NULL;
    groundBg->unk1F8 = 0;
    groundBg->unk1F9 = 0;
    groundBg->unk1FA = 0;
    groundBg->unk1FB = 0;
    groundBg->unk1BC = 0;

    unk0Ptr = &groundBg->unk0[0];
    for (unk0Id = 0; unk0Id < UNK_0_ARR_COUNT; unk0Id++, unk0Ptr++) {
        unk0Ptr->unk0 = 0;
        unk0Ptr->unk2 = 0;
        unk0Ptr->unk4 = unk0Ptr->unk8 = 0;
    }

    for (unk3E0Id = 0; unk3E0Id < UNK_3E0_ARR_COUNT; unk3E0Id++) {
        SubStruct_3E0 *unkPtr = &groundBg->unk3E0[unk3E0Id];
        unkPtr->unk0 = 0;
        unkPtr->unk1 = 0;
        unkPtr->unk2 = 0;
        unkPtr->unk4 = 0;
        unkPtr->unk10 = 0;
        unkPtr->unk18 = 0;
        unkPtr->unk14 = 0;
        unkPtr->unk20 = 0;
        unkPtr->unk24 = unkPtr->unk1C = 0;
        unkPtr->unk28 = 0;
    }

    for (i = 0; i < NUM_LAYERS; i++) {
        groundBg->cameraPixelPosition[i] = sPositionZero;
    }
}

void ov11_022EBEAC(GroundBg *groundBg)
{
    s32 i;

    GroundBg_CloseOpenedFiles(groundBg);
    TRY_FREE_AND_SET_NULL(groundBg->unk2D8);

    for (i = 0; i < NUM_LAYERS; i++) {
        if (groundBg->unk2DC[i] != NULL) {
            if (groundBg->unk52C.unkE[i] > 0) {
                MemFree(groundBg->unk2DC[i]);
            }
            groundBg->unk2DC[i] = NULL;
        }
        if (groundBg->unk2EC[i] != NULL) {
            groundBg->unk2EC[i] = NULL;
        }
        if (groundBg->unk2E4[i] != NULL) {
            if (groundBg->unk52C.unkE[i] > 0) {
                MemFree(groundBg->unk2E4[i]);
            }
            groundBg->unk2E4[i] = NULL;
        }
    }
}

void ov11_022EBF60(GroundBg *groundBg)
{
    s32 i;

    for (i = 0; i < UNK_3E0_ARR_COUNT; i++) {
        SubStruct_3E0 *unkPtr = &groundBg->unk3E0[i];
        ZInit8(&unkPtr->bpaFile);
    }

    sub_02063600(&groundBg->unk1A0);
    sub_020635C8(&groundBg->unk194);
    groundBg->unk1BC = 0;

    ZInit8(&groundBg->bplFile);
    ZInit8(&groundBg->unk17C);
    ZInit8(&groundBg->bpcFile);
    ZInit8(&groundBg->bmaFile);
}

void GroundBg_CloseOpenedFiles(GroundBg *groundBg)
{
    s32 i;
    if (groundBg->newUnk0 == 3) {
        ov11_022EBF60(groundBg);
        return;
    }

    for (i = 0; i < UNK_3E0_ARR_COUNT; i++) {
        SubStruct_3E0 *unkPtr = &groundBg->unk3E0[i];
        TRY_CLOSE_FILE(unkPtr->bpaFile);
    }
    sub_0206367C(&groundBg->unk1A0);
    sub_020635D8(&groundBg->unk194);

    TRY_CLOSE_FILE(groundBg->bplFile);
    TRY_CLOSE_FILE(groundBg->unk17C);
    TRY_CLOSE_FILE(groundBg->bpcFile);
    TRY_CLOSE_FILE(groundBg->bmaFile);
}

void ov11_022EC08C(GroundBg *groundBg)
{
    u8 unkId;
    u16 palId;
    s32 i, j;
    SubStruct_0 *unk0Ptr;
    s32 unk0Id, unk3E0Id;
    struct UnkStruct_2324CBC_Sub98 *unkSubPtr;

    GroundBg_CloseOpenedFiles(groundBg);
    groundBg->newUnk0 = 0;
    groundBg->unk1C0 = 0;
    groundBg->unk1BE = -1;
    groundBg->unk2B8 = 0;
    groundBg->bmaHeader.mapWidthTiles = 0;
    groundBg->bmaHeader.mapHeightTiles = 0;
    groundBg->bmaHeader.mapWidthChunks = 0;
    groundBg->bmaHeader.mapHeightChunks = 0;
    groundBg->unk1EE = 0;
    groundBg->animationSpecifications = NULL;
    groundBg->unk1F8 = 0;
    groundBg->unk1F9 = 0;
    groundBg->unk1FA = 0;
    groundBg->unk1FB = 0;
    groundBg->unk1BC = 0;

    unk0Ptr = &groundBg->unk0[0];
    for (unk0Id = 0; unk0Id < UNK_0_ARR_COUNT; unk0Id++, unk0Ptr++) {
        unk0Ptr->unk0 = 0;
        unk0Ptr->unk2 = 0;
        unk0Ptr->unk4 = unk0Ptr->unk8 = 0;
    }

    for (unk3E0Id = 0; unk3E0Id < UNK_3E0_ARR_COUNT; unk3E0Id++) {
        SubStruct_3E0 *unkPtr = &groundBg->unk3E0[unk3E0Id];
        unkPtr->unk0 = 0;
        unkPtr->unk1 = 0;
        unkPtr->unk2 = 0;
        unkPtr->unk4 = 0;
        ZInit8(&unkPtr->bpaFile);
        unkPtr->unk10 = 0;
        unkPtr->unk18 = 0;
        unkPtr->unk14 = 0;
        unkPtr->unk20 = 0;
        unkPtr->unk24 = unkPtr->unk1C = 0;
        unkPtr->unk28 = 0;
    }

    unkId = groundBg->unk52C.unk0;
    unkSubPtr = &ov11_02324CBC->unk98[unkId];
    palId = groundBg->unk52C.unk6 * 16;
    for (i = 0; i < groundBg->unk52C.unk8; i++) {
        sub_0200A590(unkSubPtr, palId++, &ov11_02320BF4);
        for (j = 1; j < 16; j++) {
            sub_0200A590(unkSubPtr, palId++, &ov11_02320BE8);
        }
    }
    sub_0200A504(unkSubPtr);

    if (groundBg->unk52C.numLayers > 0) {
        ov11_022EE620(groundBg, 1);
    }
    else {
        ov11_022EE620(groundBg, 0);
    }

    groundBg->mapRender[0].tilemapRenderFunc(&groundBg->mapRender[0]);
    groundBg->unk2BA = 1;
}

void ov11_022EC240(GroundBg *groundBg, s32 bgId)
{
    ov11_022EC08C(groundBg);
    if (bgId != -1) {
        struct bg_list_entry entry;

        groundBg->unk1BE = bgId;
        LoadBackgroundAttributes(&entry, groundBg->unk1BE); // This loads bg attributes and doesn't do anything with them.
    }
}

#ifdef NONMATCHING
// Regswaps - https://decomp.me/scratch/0bm90
void ov11_022EC27C(GroundBg *groundBg, s32 bgId)
{
    u32 flags;
    s32 sp20;
    void *sp44[2];
    struct bg_list_entry entry;
    u8 textBuf[0x80];
    const u16 *bpcData;
    const void *bplData;
    s32 i, j;
    struct UnkStruct_2324CBC_Sub98 *unkSubPtr;
    const RGB_Array *rgbPal;
    s32 unk0Id;
    SubStruct_0 *sub0Ptr;
    s32 unk3E0Id;
    BmaHeader *bmaHeader;
    BplHeader *bplHeader;
    const void *bmaData;
    u16 palId;
    s32 r7;

    flags = (groundBg->unk52C.unk0 == 0) ? 6 : 15;
    if (bgId == -1) {
        ov11_022EC08C(groundBg);
        return;
    }
    GroundBg_CloseOpenedFiles(groundBg);
    groundBg->newUnk0 = 1;
    groundBg->unk1C0 = 0;
    groundBg->unk1BE = bgId;
    LoadBackgroundAttributes(&entry, groundBg->unk1BE);

    sprintf(textBuf, ov11_02320C58, entry.bpl.name);
    LoadFileFromRom(&groundBg->bplFile, textBuf, flags);

    sprintf(textBuf, ov11_02320C6C, entry.bpc.name);
    LoadFileFromRom(&groundBg->bpcFile, textBuf, 0x30F);

    sprintf(textBuf, ov11_02320C80, entry.bma.name);
    LoadFileFromRom(&groundBg->bmaFile, textBuf, 0x30F);

    bplData = groundBg->bplFile.iov_base;
    bpcData = groundBg->bpcFile.iov_base;
    bmaData = groundBg->bmaFile.iov_base;

    if (bpcData[0] != 0) {
        sp44[0] = bpcData + bpcData[0] / 2;
        if (bpcData[1] == 0) {
            sp44[1] = 0;
            groundBg->unk1C4 = 1;
        }
        else {
            sp44[1] = bpcData + bpcData[1] / 2;
            groundBg->unk1C4 = 2;
        }
    }
    else {
        sp44[0] = 0;
        sp44[1] = 0;
        groundBg->unk1C4 = 0;
    }
    bpcData += 2;

    bplHeader = &groundBg->bplHeader;
    bplHeader->numPalettes = *(u8 *)(bplData); bplData += 2;
    bplHeader->hasPalAnimations = *(u8 *)(bplData); bplData += 2;

    for (i = 0; i < NUM_LAYERS; i++) {
        LayerSpecs *layerSpecs = &groundBg->layerSpecs[i];
        s32 r6;
        if (sp44[i] != NULL) {
            layerSpecs->numTiles = *bpcData++;
            for (r6 = 0; r6 < MAX_BPA_SLOTS; r6++) {
                layerSpecs->bpaSlotNumTiles[r6] = *bpcData++;
            }
            layerSpecs->numChunks = *bpcData++;
        }
        else {
            layerSpecs->numTiles = 0;
            for (r6 = 0; r6 < MAX_BPA_SLOTS; r6++) {
                layerSpecs->bpaSlotNumTiles[r6] = 0;
            }
            layerSpecs->numChunks = 0;
        }
    }

    bmaHeader = &groundBg->bmaHeader;
    bmaHeader->mapWidthTiles = *(u8 *)(bmaData); bmaData += 1;
    bmaHeader->mapHeightTiles = *(u8 *)(bmaData); bmaData += 1;
    /*bmaHeader->tilingWidth* = *(u8 *)(bmaData);*/ bmaData += 1;
    /*bmaHeader->tilingHeight* = *(u8 *)(bmaData);*/ bmaData += 1;
    bmaHeader->mapWidthChunks = *(u8 *)(bmaData); bmaData += 1;
    bmaHeader->mapHeightChunks = *(u8 *)(bmaData); bmaData += 1;
    bmaHeader->numLayers = *(u8 *)(bmaData); bmaData += 2;
    bmaHeader->hasDataLayer = *(u8 *)(bmaData); bmaData += 2;
    bmaHeader->hasCollision = *(u8 *)(bmaData); bmaData += 2;

    rgbPal = bplData;
    unkSubPtr = &ov11_02324CBC->unk98[groundBg->unk52C.unk0];
    palId = groundBg->unk52C.unk6 * 16;
    for (i = 0; i < bplHeader->numPalettes && i < groundBg->unk52C.unk8; i++) {
        sub_0200A590(unkSubPtr, palId++, &ov11_02320BF4);
        sub_0200A5B0(unkSubPtr, palId, rgbPal, 15);
        palId += 15;
        rgbPal += 15;
    }
    for (; i < groundBg->unk52C.unk8; i++) {
        sub_0200A590(unkSubPtr, palId++, &ov11_02320BF4);
        for (j = 1; j < 16; j++) {
            sub_0200A590(unkSubPtr, palId++, &ov11_02320BE8);
        }
    }
    sub_0200A504(unkSubPtr);

    // Bpc decompressor
    sp20 = groundBg->unk52C.unk2;
    for (i = 0; i < groundBg->unk52C.unk4; sp20++, i++) {
        const u8 *srcStart = sp44[i];
        if (srcStart != NULL) {
            s32 k; // r1
            u16 unkOrVal;
            s32 nbWordsToOutput;
            u16 *tilemapR7, *tilemapR3, *tilemapR12;
            LayerSpecs *layerSpecs = &groundBg->layerSpecs[i]; // r9
            s32 r3 = groundBg->unk52C.unk0;
            u16 *dstR11 = ov11_02320C18[r3][sp20] + groundBg->unk52C.unkA * 32; // r11 fp
            u16 *dstSP10 = ov11_02320C18[r3][sp20] + layerSpecs->numTiles * 32; // sp 10
            const u8 *src = srcStart; // r6
            u16 leftoverVal2 = 0; // r7
            u16 leftoverBuf = 0; // sp #0x14
            u16 leftoverVal1 = 0; // r2
            bool8 hasLeftover = FALSE; // r3

            for (s32 k = 0; k < 16; k++) {
                *dstR11++ = 0;
            }

            // Copy tiles
            while (dstR11 < dstSP10) {
                s32 nbbytestocopy;
                s32 cmd = *src++;
                if (cmd < 0x80) {
                    if (cmd == 0x7f) {
                        nbbytestocopy = (src[1] << 8) | src[0]; src += 2;
                    }
                    else if (cmd == 0x7e) {
                        nbbytestocopy = *src++;
                    }
                    else {
                        nbbytestocopy = cmd;
                    }

                    if (hasLeftover) {
                        *dstR11++ = leftoverVal1 | (*src++ << 8);
                        hasLeftover = FALSE;
                        nbbytestocopy--;
                    }

                    for (k = 0; k < nbbytestocopy; k += 2) {
                        u16 word = (src[1] << 8) | src[0]; src += 2;
                        *dstR11++ = word;
                    }

                    if (k <= nbbytestocopy) {
                        hasLeftover = TRUE;
                        leftoverVal1 = *src++;
                    }
                }
                else {
                    if (cmd < 0xC0) {
                        if (cmd == 0xBf) {
                            nbbytestocopy = *src;
                            src++;
                        }
                        else {
                            nbbytestocopy = cmd - 0x80;
                        }

                        leftoverBuf = leftoverVal2;
                        leftoverVal2 = *src++;
                    }
                    else if (cmd < 0xE0) {
                        if (cmd == 0xDF) {
                            nbbytestocopy = *src++;
                        }
                        else {
                            nbbytestocopy = cmd - 0xC0;
                        }
                    }
                    else {
                        u16 tmp;
                        if (cmd == 0xFF) {
                            nbbytestocopy = *src++;
                        }
                        else {
                            nbbytestocopy = cmd - 0xE0;
                        }

                        SWAP(leftoverBuf, leftoverVal2, tmp);
                    }

                    if (hasLeftover) {
                        *dstR11++ = leftoverVal1 | (leftoverVal2 << 8);
                        hasLeftover = FALSE;
                        nbbytestocopy--;
                    }
                    leftoverVal1 = leftoverVal2 | (leftoverVal2 << 8);

                    for (k = 0; k < nbbytestocopy; k += 2) {
                        *dstR11++ = leftoverVal1;
                    }

                    if (k <= nbbytestocopy) {
                        hasLeftover = TRUE;
                        leftoverVal1 = leftoverVal2;
                    }
                }
            }

            // Align by 2
            if ((src - srcStart) & 1) {
                src++;
            }

            // Copy tilemaps
            for (r7 = layerSpecs->numTiles; r7 < groundBg->unk52C.unkC; r7++) {
                for (k = 0; k < 16; k++) {
                    *dstR11++ = 0xFFFF;
                }
            }

            unkOrVal = (groundBg->unk52C.unk6 << 12) | groundBg->unk52C.unkA;
            tilemapR12 = groundBg->unk2DC[i];
            tilemapR3 = tilemapR12;
            groundBg->unk2B8 = 1;
            nbWordsToOutput = (layerSpecs->numChunks - 1) * 9;
            tilemapR7 = tilemapR12 + nbWordsToOutput;
            // Decompress and copy upper table
            while (tilemapR3 < tilemapR7) {
                s32 k;
                s32 cmd = *src++;

                if (cmd >= 0xC0) {
                    for (k = 0xC0; k <= cmd; k++) {
                        u16 word = *src++ << 8;
                        *tilemapR3++ = word;
                    }
                }
                else if (cmd >= 0x80) {
                    u16 word = *src++ << 8;
                    for (k = 0x80; k <= cmd; k++) {
                        *tilemapR3++ = word;
                    }
                }
                else {
                    for (k = 0; k <= cmd; k++) {
                        *tilemapR3++ = 0;
                    }
                }
            }
            // Decompress and copy lower table
            tilemapR3 = tilemapR12;
            while (tilemapR3 < tilemapR7) {
                s32 k;
                s32 cmd = *src++;

                if (cmd >= 0xC0) {
                    for (k = 0xC0; k <= cmd; k++) {
                        u16 *currDst = tilemapR3++;
                        *currDst |= *src++;
                    }
                }
                else if (cmd >= 0x80) {
                    u8 param = *src++;
                    for (k = 0x80; k <= cmd; k++) {
                        u16 *currDst = tilemapR3++;
                        *currDst |= param;
                    }
                }
                else {
                    tilemapR3 += cmd + 1;
                }
            }

            // ?
            s32 unk = (layerSpecs->numChunks * 9);
            u16 *dst = tilemapR12 + unk;
            s32 id;
            for (id = 1; id < layerSpecs->numChunks; id++) {
                for (k = 0; k < 9; k++) {
                    *(--dst) = *(--tilemapR7) + unkOrVal;
                }
            }

            for (k = 0; k < 9; k++) {
                *tilemapR12++ = 0;
            }
        }
    }

    bmaData = BmaLayerNrlDecompressor(groundBg->unk2E4, bmaData, &groundBg->unk52C, &groundBg->bmaHeader);
    groundBg->unk1F0 = bmaData;
    if (groundBg->unk2D8 != NULL) {
        groundBg->unk52C.unk18(groundBg->unk2D8, bmaData, bmaHeader, groundBg->unk52C.unk12);
    }

    groundBg->unk1EE = 0;
    sub0Ptr = groundBg->unk0;
    unk0Id = 0;

    if (bplHeader->hasPalAnimations) {
        s32 numPals = bplHeader->numPalettes * 15;
        const AnimationSpecification *animSpecifications = bplData + (numPals * 4);
        const RGB_Array *animationPalette = ((void *) animSpecifications) + bplHeader->numPalettes * 4;

        groundBg->animationSpecifications = animSpecifications;
        groundBg->unk1F8 = 1;
        groundBg->unk1F9 = 1;
        groundBg->unk1FA = 1;
        groundBg->unk1FB = 1;
        groundBg->unk1BC = 0;
        for (; unk0Id < bplHeader->numPalettes && unk0Id < groundBg->unk52C.unk8; unk0Id++, sub0Ptr++, animSpecifications++) {
            if (animSpecifications->numFrames > 0) {
                sub0Ptr->unk4 = animationPalette;
                animationPalette += animSpecifications->numFrames * 15;
            }
            else {
                sub0Ptr->unk4 = NULL;
            }
            sub0Ptr->unk0 = 0;
            sub0Ptr->unk2 = 0;
            sub0Ptr->unk8 = 0;
        }
    }
    else {
        groundBg->animationSpecifications = NULL;
        groundBg->unk1F8 = 0;
        groundBg->unk1F9 = 0;
        groundBg->unk1FA = 0;
        groundBg->unk1FB = 0;
        groundBg->unk1BC = 0;
    }

    for (; unk0Id < UNK_0_ARR_COUNT; unk0Id++, sub0Ptr++) {
        sub0Ptr->unk0 = 0;
        sub0Ptr->unk2 = 0;
        sub0Ptr->unk4 = sub0Ptr->unk8 = 0;
    }

    for (unk3E0Id = 0; unk3E0Id < UNK_3E0_ARR_COUNT; unk3E0Id++) {
        SubStruct_3E0 *sub3E0 = &groundBg->unk3E0[unk3E0Id];
        sub3E0->unk0 = 0;
        sub3E0->unk1 = 0;
        sub3E0->unk4 = 0;
        sub3E0->unk2 = 0;
        ZInit8(&sub3E0->bpaFile);
        sub3E0->unk10 = 0;
        sub3E0->unk18 = 0;
        sub3E0->unk14 = 0;
        sub3E0->unk20 = 0;
        sub3E0->unk24 = sub3E0->unk1C = 0;
        sub3E0->unk28 = 0;
    }

    r7 = groundBg->unk52C.unk2;
    s32 r5;
    for (r5 = 0; r5 < groundBg->unk52C.unk4; r5++, r7++) {
        LayerSpecs *layerSpecs = &groundBg->layerSpecs[r5];
        s32 vramId = (groundBg->unk52C.unkA + layerSpecs->numTiles);
        void *vramPtr = ov11_02320C18[groundBg->unk52C.unk0][r7] + (vramId * 32);
        s32 r8 = (r5 == 0) ? 0 : 2;
        s32 r9 = (r5 == 0) ? 0 : 4;
        layerSpecs = &groundBg->layerSpecs[r5];
        s32 r6;

        for (r6 = 0; r6 < 2; r6++, r9++, r8++) {

            SubStruct_3E0 *sub3E0 = &groundBg->unk3E0[r8];
            if (entry.others_bpa[r9].name[0] != '\0' && groundBg->unk52C.unk0 == 0) {
                const struct BpaHeader *bpaHeader;
                const void *r1, *r0;

                sprintf(textBuf, ov11_02320C94, entry.others_bpa[r9].name);
                LoadFileFromRom(&sub3E0->bpaFile, textBuf, flags);
                sub3E0->unk0 = 1;
                sub3E0->unk1 = 1;
                bpaHeader = sub3E0->bpaFile.iov_base;
                sub3E0->unk10 = bpaHeader;
                r1 = &bpaHeader->durationPerFrame;
                r0 = r1 + bpaHeader->numFrames * 4;
                sub3E0->unk14 = sub3E0->unk18 = r1;
                sub3E0->unk1C = sub3E0->unk20 = r0;
                sub3E0->unk2 = 0;
                sub3E0->unk4 = *((u32 *)sub3E0->unk18); // hm...
                sub3E0->unk24 = vramPtr;
                sub3E0->unk28 = layerSpecs->bpaSlotNumTiles[r6] * 32;

                vramPtr += layerSpecs->bpaSlotNumTiles[r6] * 32;
            }
        }
    }

    if (groundBg->unk52C.unk4 > 0) {
        ov11_022EE620(groundBg, 1);
    }
    else {
        ov11_022EE620(groundBg, 0);
    }
    groundBg->mapRender[0].tilemapRenderFunc(&groundBg->mapRender[0]);
    groundBg->unk2BA = 1;
    TRY_CLOSE_FILE(groundBg->bpcFile);
    TRY_CLOSE_FILE(groundBg->bmaFile);
}

#else
asm void ov11_022EC27C(GroundBg *groundBg, s32 bgId)
{
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
	sub sp, sp, #0x13c
	mov r10, r0
	ldrb r0, [r10, #0x2bc]
	mov r4, r1
	cmp r0, #0
	moveq r0, #6
	streq r0, [sp]
	movne r0, #0xf
	strne r0, [sp]
	mvn r0, #0
	cmp r4, r0
	mov r0, r10
	bne _022EC2BC
	bl ov11_022EC08C
	b _022ECCF4
_022EC2BC:
	bl GroundBg_CloseOpenedFiles
	mov r0, #1
	strh r0, [r10]
	mov r0, #0
	strb r0, [r10, #0x1c0]
	add r0, r10, #0x100
	strh r4, [r0, #0xbe]
	ldrsh r1, [r0, #0xbe]
	add r0, sp, #0xcc
	bl LoadBackgroundAttributes
	ldr r1, =ov11_02320C58
	add r0, sp, #0x4c
	add r2, sp, #0xcc
	bl sprintf
	ldr r2, [sp]
	add r1, sp, #0x4c
	add r0, r10, #0x174
	bl LoadFileFromRom
	ldr r1, =ov11_02320C6C
	add r0, sp, #0x4c
	add r2, sp, #0xd6
	bl sprintf
	ldr r2, =0x0000030F
	add r0, r10, #0x184
	add r1, sp, #0x4c
	bl LoadFileFromRom
	ldr r1, =ov11_02320C80
	add r0, sp, #0x4c
	add r2, sp, #0xe0
	bl sprintf
	ldr r2, =0x0000030F
	add r0, r10, #0x18c
	add r1, sp, #0x4c
	bl LoadFileFromRom
	ldr r1, [r10, #0x184]
	ldr r0, [r10, #0x174]
	ldrh r2, [r1]
	str r0, [sp, #0x28]
	ldr r5, [r10, #0x18c]
	cmp r2, #0
	beq _022EC3A0
	ldrh r0, [r1, #2]
	mov r2, r2, lsr #1
	add r2, r1, r2, lsl #1
	cmp r0, #0
	str r2, [sp, #0x44]
	moveq r2, #0
	moveq r0, #1
	streq r2, [sp, #0x48]
	streq r0, [r10, #0x1c4]
	beq _022EC3B0
	mov r0, r0, lsr #1
	add r2, r1, r0, lsl #1
	mov r0, #2
	str r2, [sp, #0x48]
	str r0, [r10, #0x1c4]
	b _022EC3B0
_022EC3A0:
	mov r0, #0
	str r0, [sp, #0x44]
	str r0, [sp, #0x48]
	str r0, [r10, #0x1c4]
_022EC3B0:
	ldr r0, [sp, #0x28]
	add r2, r10, #0xea
	ldrb r3, [r0]
	add r0, r10, #0x100
	add r1, r1, #4
	strh r3, [r0, #0xea]
	ldr r0, [sp, #0x28]
	ldrb r3, [r0, #2]
	add r0, r2, #0x100
	str r0, [sp, #0x40]
	strh r3, [r0, #2]
	mov r0, #0
_022EC3E0:
	add r4, r10, #0x1c8
	mov r2, #0xc
	add r3, sp, #0x44
	ldr r3, [r3, r0, lsl #2]
	mla r4, r0, r2, r4
	cmp r3, #0
	mov r6, #0
	beq _022EC42C
	ldrh r2, [r1], #2
	strh r2, [r4]
_022EC408:
	ldrh r3, [r1], #2
	add r2, r4, r6, lsl #1
	add r6, r6, #1
	strh r3, [r2, #2]
	cmp r6, #4
	blt _022EC408
	ldrh r2, [r1], #2
	strh r2, [r4, #0xa]
	b _022EC44C
_022EC42C:
	strh r6, [r4]
	mov r3, r6
_022EC434:
	add r2, r4, r6, lsl #1
	add r6, r6, #1
	strh r3, [r2, #2]
	cmp r6, #4
	blt _022EC434
	strh r3, [r4, #0xa]
_022EC44C:
	add r0, r0, #1
	cmp r0, #2
	blt _022EC3E0
	ldrb r1, [r5]
	add r0, r10, #0x200
	str r0, [sp, #0x34]
	strb r1, [r10, #0x1e0]
	ldrb r0, [r5, #1]
	add r4, r10, #0x1e0
	ldr r2, =ov11_02324CBC
	strb r0, [r4, #1]
	ldrb r3, [r5, #4]
	ldr r0, [sp, #0x28]
	mov r1, #0x28
	add r0, r0, #4
	strb r3, [r4, #2]
	str r0, [sp, #0x1c]
	ldrb r0, [r5, #5]
	mov r9, #0
	strb r0, [r4, #3]
	ldrb r0, [r5, #6]
	strh r0, [r4, #4]
	ldrb r0, [r5, #8]
	strh r0, [r4, #6]
	ldrb r0, [r5, #0xa]
	strh r0, [r4, #8]
	ldr r0, [sp, #0x34]
	ldrb r3, [r10, #0x2bc]
	ldrsh r0, [r0, #0xc2]
	ldr r2, [r2]
	smulbb r6, r3, r1
	mov r0, r0, lsl #0x14
	add r7, r2, #0x98
	mov r8, r0, lsr #0x10
	b _022EC524
_022EC4D8:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r1, r8
	mov r8, r0, lsr #0x10
	ldr r2, =ov11_02320BF4
	add r0, r7, r6
	bl sub_0200A590
	ldr r2, [sp, #0x1c]
	add r0, r7, r6
	mov r1, r8
	mov r3, #0xf
	bl sub_0200A5B0
	add r0, r8, #0xf
	mov r0, r0, lsl #0x10
	mov r8, r0, lsr #0x10
	ldr r0, [sp, #0x1c]
	add r9, r9, #1
	add r0, r0, #0x3c
	str r0, [sp, #0x1c]
_022EC524:
	ldr r0, [sp, #0x40]
	ldrsh r0, [r0]
	cmp r9, r0
	bge _022EC544
	ldr r0, [sp, #0x34]
	ldrsh r0, [r0, #0xc4]
	cmp r9, r0
	blt _022EC4D8
_022EC544:
	add r0, r10, #0x200
	str r0, [sp, #0x38]
	b _022EC5A8
_022EC550:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r1, r8
	mov r8, r0, lsr #0x10
	ldr r2, =ov11_02320BF4
	add r0, r7, r6
	bl sub_0200A590
	mov r0, #1
	str r0, [sp, #0x18]
_022EC574:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r1, r8
	mov r8, r0, lsr #0x10
	ldr r2, =ov11_02320BE8
	add r0, r7, r6
	bl sub_0200A590
	ldr r0, [sp, #0x18]
	add r0, r0, #1
	str r0, [sp, #0x18]
	cmp r0, #0x10
	blt _022EC574
	add r9, r9, #1
_022EC5A8:
	ldr r0, [sp, #0x38]
	ldrsh r0, [r0, #0xc4]
	cmp r9, r0
	blt _022EC550
	add r0, r7, r6
	bl sub_0200A504
	add r0, r10, #0x200
	ldrsh r0, [r0, #0xbe]
	mov r8, #0
	str r0, [sp, #0x20]
	b _022EC9A0
_022EC5D4:
	add r0, sp, #0x44
	ldr r0, [r0, r8, lsl #2]
	str r0, [sp, #0x24]
	cmp r0, #0
	beq _022EC990
	mov r0, #0xc
	mul r1, r8, r0
	add r0, r10, #0x200
	ldrsh r2, [r0, #0xc6]
	add r6, r10, #0x1c8
	add r9, r6, r1
	ldrsh r1, [r6, r1]
	ldrb r3, [r10, #0x2bc]
	ldr r0, =ov11_02320C18
	mov r7, #0
	add r3, r0, r3, lsl #3
	ldr r0, [sp, #0x20]
	ldr r6, [sp, #0x24]
	ldr r0, [r3, r0, lsl #2]
	str r7, [sp, #0x14]
	add r11, r0, r2, lsl #5
	add r0, r11, r1, lsl #5
	str r0, [sp, #0x10]
	mov r3, r7
	mov r2, r7
	mov r1, r7
	mov r0, r7
_022EC640:
	strh r0, [r11], #2
	add r1, r1, #1
	cmp r1, #0x10
	blt _022EC640
	b _022EC774
_022EC654:
	ldrb r0, [r6]
	add r1, r6, #1
	mov r6, r1
	cmp r0, #0x80
	bge _022EC6D8
	cmp r0, #0x7f
	ldreqb ip, [r1, #1]
	ldreqb r0, [r1]
	addeq r6, r1, #2
	orreq r0, r0, ip, lsl #8
	beq _022EC68C
	cmp r0, #0x7e
	ldreqb r0, [r1]
	addeq r6, r1, #1
_022EC68C:
	cmp r3, #0
	ldrneb r1, [r6], #1
	movne r3, #0
	subne r0, r0, #1
	orrne r1, r2, r1, lsl #8
	strneh r1, [r11], #2
	mov r1, #0
	b _022EC6C4
_022EC6AC:
	ldrb lr, [r6, #1]
	ldrb ip, [r6], #2
	add r1, r1, #2
	str ip, [sp, #0x2c]
	orr ip, ip, lr, lsl #8
	strh ip, [r11], #2
_022EC6C4:
	cmp r1, r0
	blt _022EC6AC
	movle r3, #1
	ldrleb r2, [r6], #1
	b _022EC774
_022EC6D8:
	cmp r0, #0xc0
	bge _022EC6FC
	cmp r0, #0xbf
	ldreqb r0, [r1]
	addeq r6, r1, #1
	str r7, [sp, #0x14]
	subne r0, r0, #0x80
	ldrb r7, [r6], #1
	b _022EC734
_022EC6FC:
	cmp r0, #0xe0
	bge _022EC718
	cmp r0, #0xdf
	ldreqb r0, [r1]
	addeq r6, r1, #1
	subne r0, r0, #0xc0
	b _022EC734
_022EC718:
	cmp r0, #0xff
	ldreqb r0, [r1]
	addeq r6, r1, #1
	ldr r1, [sp, #0x14]
	subne r0, r0, #0xe0
	str r7, [sp, #0x14]
	mov r7, r1
_022EC734:
	cmp r3, #0
	orrne r1, r2, r7, lsl #8
	strneh r1, [r11], #2
	orr r1, r7, r7, lsl #8
	mov r1, r1, lsl #0x10
	mov r2, r1, lsr #0x10
	movne r3, #0
	subne r0, r0, #1
	mov r1, #0
	b _022EC764
_022EC75C:
	strh r2, [r11], #2
	add r1, r1, #2
_022EC764:
	cmp r1, r0
	blt _022EC75C
	movle r3, #1
	movle r2, r7
_022EC774:
	ldr r0, [sp, #0x10]
	cmp r11, r0
	blo _022EC654
	ldr r0, [sp, #0x24]
	ldrsh r7, [r9]
	sub r0, r6, r0
	tst r0, #1
	addne r6, r6, #1
	add r0, r10, #0x200
	ldr r2, =0x0000FFFF
	mov r3, #0
	b _022EC7BC
_022EC7A4:
	mov r1, r3
_022EC7A8:
	strh r2, [r11], #2
	add r1, r1, #1
	cmp r1, #0x10
	blt _022EC7A8
	add r7, r7, #1
_022EC7BC:
	ldrsh r1, [r0, #0xc8]
	cmp r7, r1
	blt _022EC7A4
	add r0, r10, #0x200
	add r1, r10, r8, lsl #2
	ldr ip, [r1, #0x2dc]
	ldrsh r7, [r0, #0xc2]
	ldrsh r2, [r0, #0xc6]
	mov r1, #1
	mov r3, ip
	strh r1, [r0, #0xb8]
	orr r0, r2, r7, lsl #12
	mov r0, r0, lsl #0x10
	ldrsh r1, [r9, #0xa]
	str r0, [sp, #0x3c]
	sub r0, r1, #1
	add r0, r0, r0, lsl #3
	add r7, ip, r0, lsl #1
	mov r0, #0
	b _022EC890
_022EC80C:
	ldrb r1, [r6]
	add r2, r6, #1
	mov r6, r2
	cmp r1, #0xc0
	blt _022EC844
	mov r2, #0xc0
	b _022EC838
_022EC828:
	ldrb r11, [r6], #1
	add r2, r2, #1
	mov r11, r11, lsl #8
	strh r11, [r3], #2
_022EC838:
	cmp r2, r1
	ble _022EC828
	b _022EC890
_022EC844:
	cmp r1, #0x80
	blt _022EC878
	ldrb r11, [r2]
	add r6, r2, #1
	mov r2, #0x80
	mov r11, r11, lsl #0x18
	mov r11, r11, lsr #0x10
	b _022EC86C
_022EC864:
	strh r11, [r3], #2
	add r2, r2, #1
_022EC86C:
	cmp r2, r1
	ble _022EC864
	b _022EC890
_022EC878:
	mov r2, #0
	b _022EC888
_022EC880:
	strh r0, [r3], #2
	add r2, r2, #1
_022EC888:
	cmp r2, r1
	ble _022EC880
_022EC890:
	cmp r3, r7
	blo _022EC80C
	mov r3, ip
	b _022EC928
_022EC8A0:
	ldrb r2, [r6]
	add r0, r6, #1
	mov r6, r0
	cmp r2, #0xc0
	blt _022EC8E4
	mov r0, #0xc0
	b _022EC8D8
_022EC8BC:
	str r3, [sp, #0xc]
	ldrh r11, [r3], #2
	ldrb r1, [r6], #1
	add r0, r0, #1
	orr r11, r11, r1
	ldr r1, [sp, #0xc]
	strh r11, [r1]
_022EC8D8:
	cmp r0, r2
	ble _022EC8BC
	b _022EC928
_022EC8E4:
	cmp r2, #0x80
	blt _022EC920
	add r6, r0, #1
	ldrb lr, [r0]
	mov r11, #0x80
	b _022EC914
_022EC8FC:
	str r3, [sp, #8]
	ldrh r0, [r3], #2
	add r11, r11, #1
	orr r1, r0, lr
	ldr r0, [sp, #8]
	strh r1, [r0]
_022EC914:
	cmp r11, r2
	ble _022EC8FC
	b _022EC928
_022EC920:
	add r0, r2, #1
	add r3, r3, r0, lsl #1
_022EC928:
	cmp r3, r7
	blo _022EC8A0
	ldrsh r0, [r9, #0xa]
	mov r3, #1
	add r0, r0, r0, lsl #3
	add r1, ip, r0, lsl #1
	mov r0, #0
	b _022EC96C
_022EC948:
	mov r2, r0
_022EC94C:
	ldrh r11, [r7, #-2]!
	ldr r6, [sp, #0x3c]
	add r2, r2, #1
	add r6, r11, r6, lsr #16
	cmp r2, #9
	strh r6, [r1, #-2]!
	blt _022EC94C
	add r3, r3, #1
_022EC96C:
	ldrsh r2, [r9, #0xa]
	cmp r3, r2
	blt _022EC948
	mov r1, #0
	mov r0, r1
_022EC980:
	add r1, r1, #1
	cmp r1, #9
	strh r0, [ip], #2
	blt _022EC980
_022EC990:
	ldr r0, [sp, #0x20]
	add r8, r8, #1
	add r0, r0, #1
	str r0, [sp, #0x20]
_022EC9A0:
	add r0, r10, #0x200
	ldrsh r0, [r0, #0xc0]
	cmp r8, r0
	blt _022EC5D4
	add r0, r10, #0x2e4
	add r1, r5, #0xc
	add r2, r10, #0x2bc
	add r3, r10, #0x1e0
	bl BmaLayerNrlDecompressor
	mov r1, r0
	str r1, [r10, #0x1f0]
	ldr r0, [r10, #0x2d8]
	cmp r0, #0
	beq _022EC9EC
	add r2, r10, #0x200
	ldrsh r3, [r2, #0xce]
	ldr r5, [r10, #0x2d4]
	mov r2, r4
	blx r5
_022EC9EC:
	mov r1, #0
	ldr r0, [sp, #0x40]
	strb r1, [r10, #0x1ee]
	ldrsh r2, [r0, #2]
	add r0, r10, #4
	cmp r2, #0
	beq _022ECAA4
	ldr r2, [sp, #0x40]
	mov r3, #1
	ldrsh r5, [r2]
	ldr r2, [sp, #0x28]
	mov r7, r1
	add r4, r2, #4
	rsb r2, r5, r5, lsl #4
	add r2, r4, r2, lsl #2
	str r2, [r10, #0x1f4]
	strb r3, [r10, #0x1f8]
	strb r3, [r10, #0x1f9]
	strb r3, [r10, #0x1fa]
	strb r3, [r10, #0x1fb]
	add r3, r2, r5, lsl #2
	strb r1, [r10, #0x1bc]
	add r5, r10, #0x200
	mov r6, r1
	b _022ECA84
_022ECA50:
	ldrsh r4, [r2, #2]
	add r1, r1, #1
	cmp r4, #0
	strgt r3, [r0, #4]
	ldrgtsh r4, [r2, #2]
	add r2, r2, #4
	strle r7, [r0, #4]
	strh r6, [r0]
	rsbgt r4, r4, r4, lsl #4
	strh r6, [r0, #2]
	str r6, [r0, #8]
	addgt r3, r3, r4, lsl #2
	add r0, r0, #0xc
_022ECA84:
	ldr r4, [sp, #0x40]
	ldrsh r4, [r4]
	cmp r1, r4
	bge _022ECABC
	ldrsh r4, [r5, #0xc4]
	cmp r1, r4
	blt _022ECA50
	b _022ECABC
_022ECAA4:
	str r1, [r10, #0x1f4]
	strb r1, [r10, #0x1f8]
	strb r1, [r10, #0x1f9]
	strb r1, [r10, #0x1fa]
	strb r1, [r10, #0x1fb]
	strb r1, [r10, #0x1bc]
_022ECABC:
	mov r2, #0
	b _022ECADC
_022ECAC4:
	strh r2, [r0]
	strh r2, [r0, #2]
	str r2, [r0, #8]
	str r2, [r0, #4]
	add r1, r1, #1
	add r0, r0, #0xc
_022ECADC:
	cmp r1, #0x10
	blt _022ECAC4
	mov r7, #0
	add r4, r10, #0xc4
	mov r9, r7
	mov r5, r7
	mov r8, #0x2c
_022ECAF8:
	mul r0, r7, r8
	add r6, r4, r0
	strb r9, [r4, r0]
	strb r9, [r6, #1]
	strh r9, [r6, #4]
	strh r9, [r6, #2]
	add r0, r6, #8
	bl ZInit8
	str r5, [r6, #0x10]
	str r5, [r6, #0x18]
	str r5, [r6, #0x14]
	str r5, [r6, #0x20]
	str r5, [r6, #0x1c]
	add r7, r7, #1
	str r5, [r6, #0x24]
	str r5, [r6, #0x28]
	cmp r7, #4
	blt _022ECAF8
	add r0, r10, #0x200
	ldrsh r7, [r0, #0xbe]
	b _022ECC80
_022ECB4C:
	mov r0, #0xc
	mul r2, r5, r0
	add r0, r10, #0x200
	add r3, r10, #0x1c8
	ldrsh r1, [r0, #0xc6]
	ldrsh r0, [r3, r2]
	cmp r5, #0
	moveq r8, #0
	add r1, r1, r0
	add r0, r3, r2
	movne r8, #2
	cmp r5, #0
	moveq r9, #0
	str r0, [sp, #4]
	add r0, r10, #0xc4
	ldrb r6, [r10, #0x2bc]
	ldr r4, =ov11_02320C18
	movne r9, #4
	add r4, r4, r6, lsl #3
	ldr r4, [r4, r7, lsl #2]
	mov r6, #0
	add r11, r4, r1, lsl #5
	str r0, [sp, #0x30]
_022ECBA8:
	ldr r0, [sp, #0x30]
	mov r1, #0x2c
	mla r4, r8, r1, r0
	mov r0, #0xa
	mul r0, r9, r0
	add r1, sp, #0xcc
	add r1, r1, r0
	ldrsb r1, [r1, #0x1e]
	cmp r1, #0
	beq _022ECC64
	ldrb r1, [r10, #0x2bc]
	cmp r1, #0
	bne _022ECC64
	add r1, sp, #0xea
	add r2, r1, r0
	ldr r1, =ov11_02320C94
	add r0, sp, #0x4c
	bl sprintf
	ldr r2, [sp]
	add r0, r4, #8
	add r1, sp, #0x4c
	bl LoadFileFromRom
	mov r0, #1
	strb r0, [r4]
	strb r0, [r4, #1]
	ldr r3, [r4, #8]
	ldr r0, [sp, #4]
	str r3, [r4, #0x10]
	add r1, r0, r6, lsl #1
	ldrsh r0, [r3, #2]
	add r2, r3, #4
	str r2, [r4, #0x18]
	add r0, r2, r0, lsl #2
	str r2, [r4, #0x14]
	str r0, [r4, #0x20]
	str r0, [r4, #0x1c]
	mov r0, #0
	strh r0, [r4, #2]
	ldr r0, [r4, #0x18]
	ldr r0, [r0]
	strh r0, [r4, #4]
	str r11, [r4, #0x24]
	ldrsh r0, [r1, #2]
	mov r0, r0, lsl #5
	str r0, [r4, #0x28]
	ldrsh r0, [r1, #2]
	add r11, r11, r0, lsl #5
_022ECC64:
	add r6, r6, #1
	cmp r6, #2
	add r9, r9, #1
	add r8, r8, #1
	blt _022ECBA8
	add r5, r5, #1
	add r7, r7, #1
_022ECC80:
	add r0, r10, #0x200
	ldrsh r0, [r0, #0xc0]
	cmp r5, r0
	blt _022ECB4C
	cmp r0, #0
	mov r0, r10
	ble _022ECCA8
	mov r1, #1
	bl ov11_022EE620
	b _022ECCB0
_022ECCA8:
	mov r1, #0
	bl ov11_022EE620
_022ECCB0:
	ldr r1, [r10, #0x228]
	add r0, r10, #0x210
	blx r1
	mov r1, #1
	add r0, r10, #0x184
	strb r1, [r10, #0x2ba]
	bl PointsToZero
	cmp r0, #0
	bne _022ECCDC
	add r0, r10, #0x184
	bl UnloadFile
_022ECCDC:
	add r0, r10, #0x18c
	bl PointsToZero
	cmp r0, #0
	bne _022ECCF4
	add r0, r10, #0x18c
	bl UnloadFile
_022ECCF4:
	add sp, sp, #0x13c
	ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
}

#endif

// TODO: move these to headers.
struct Unk_022C3938
{
    struct iovec unk0;
    void *unk8;
};

extern void sub_02063628(struct UnkGroundBg_1A0 * a0, struct UnkStruct_2324CBC_Sub98 *a1, s32 a2);
extern void sub_02063734(struct UnkGroundBg_1A0 * a0, s32 a1, s32 a2);
extern void ov10_022C3E8C(u16 *a0, s32 a1, s32 *a2, s32 *a3, const DungeonLocation *a4);
extern void ov10_022C3938(struct Unk_022C3938 *a0,
                          struct UnkGroundBg_194 *a1,
                          void *a2,
                          u16 *a3,
                          u16 *a4,
                          const DungeonLocation *a5,
                          s32 a6,
                          s32 a7,
                          s32 a8,
                          u16 *a9);


struct UnkTwoPtrs
{
    u16 *ptrs[2];
};

void LoadMapType10(GroundBg *groundBg, s32 bgId, const DungeonLocation *dungLoc, s32 a3)
{
    BplHeader *bplHeader;
    LayerSpecs *layerSpecs;
    BmaHeader *bmaHeader;
    s32 i;
    struct bg_list_entry entry;
    u8 textBuf[0x80];
    const u16 *bpcData;
    const void *bmaData;
    const void *bplData;
    struct Unk_022C3938 sp2C;
    SubStruct_0 *sub0Ptr;

    if (bgId == -1 || dungLoc->id == 0xff) {
        ov11_022EC08C(groundBg);
        return;
    }

    ov11_022EC27C(groundBg, bgId);
    GroundBg_CloseOpenedFiles(groundBg);
    groundBg->newUnk0 = 2;
    groundBg->unk1C0 = 0;
    groundBg->unk1BE = bgId;
    LoadBackgroundAttributes(&entry, groundBg->unk1BE);

    sprintf(textBuf, ov11_02320C58, entry.bpl.name);
    LoadFileFromRom(&groundBg->bplFile, textBuf, 6);

    sprintf(textBuf, ov11_02320C6C, entry.bpc.name);
    LoadFileFromRom(&groundBg->bpcFile, textBuf, 0x30F);

    sprintf(textBuf, ov11_02320C80, entry.bma.name);
    LoadFileFromRom(&groundBg->bmaFile, textBuf, 6);

    bpcData = groundBg->bpcFile.iov_base;
    bplData = groundBg->bplFile.iov_base;
    bmaData = groundBg->bmaFile.iov_base;

    layerSpecs = &groundBg->layerSpecs[0];
    bmaHeader = &groundBg->bmaHeader;
    bplHeader = &groundBg->bplHeader;

    bplHeader->numPalettes = *(u8 *)(bplData); bplData += 2;
    bplHeader->hasPalAnimations = *(u8 *)(bplData); bplData += 2;

    s32 r6;

    layerSpecs->numTiles = *bpcData++;
    for (r6 = 0; r6 < MAX_BPA_SLOTS; r6++) {
        layerSpecs->bpaSlotNumTiles[r6] = *bpcData++;
    }
    layerSpecs->numChunks = *bpcData++;

    bmaHeader->mapWidthTiles = *(u8 *)(bmaData); bmaData += 1;
    bmaHeader->mapHeightTiles = *(u8 *)(bmaData); bmaData += 1;
    /*bmaHeader->tilingWidth* = *(u8 *)(bmaData);*/ bmaData += 1;
    /*bmaHeader->tilingHeight* = *(u8 *)(bmaData);*/ bmaData += 1;
    bmaHeader->mapWidthChunks = *(u8 *)(bmaData); bmaData += 1;
    bmaHeader->mapHeightChunks = *(u8 *)(bmaData); bmaData += 1;
    bmaHeader->numLayers = *(u8 *)(bmaData); bmaData += 2;
    bmaHeader->hasDataLayer = *(u8 *)(bmaData); bmaData += 2;
    bmaHeader->hasCollision = *(u8 *)(bmaData); bmaData += 2;

    {
        // Needed to match.
        static const struct UnkTwoPtrs zeros = {0};
        struct UnkTwoPtrs unkPtrArray = zeros;

        unkPtrArray.ptrs[0] = groundBg->unk2D8;
        bmaData = BmaLayerNrlDecompressor((void *) &unkPtrArray, bmaData, &groundBg->unk52C, &groundBg->bmaHeader);
    }

    groundBg->unk1F0 = bmaData;
    ov10_022C3938(&sp2C,
                &groundBg->unk194,
                (void *)(VRAM + 0x18000),
                groundBg->unk2DC[0],
                groundBg->unk2E4[0],
                dungLoc,
                a3,
                0x40,
                bmaHeader->mapHeightChunks,
                groundBg->unk2D8);
    groundBg->unk17C = sp2C.unk0;
    groundBg->unk1B8 = sp2C.unk8;
    groundBg->unk52C.unk18(groundBg->unk2D8, bmaData, bmaHeader, groundBg->unk52C.unk12);

    layerSpecs->numTiles = 512;
    for (i = 0; i < MAX_BPA_SLOTS; i++) {
        layerSpecs->bpaSlotNumTiles[i] = 0;
    }

    layerSpecs->numChunks = 0x190;
    groundBg->bplHeader.numPalettes = 12;
    groundBg->bplHeader.hasPalAnimations = FALSE;
    if (groundBg->unk1B8 != NULL) {
        const RGB_Array *strPtr = groundBg->unk1B8;
        struct UnkStruct_2324CBC_Sub98 *unkSubPtr = &ov11_02324CBC->unk98[groundBg->unk52C.unk0];
        u16 palId = 0;
        s32 i, j;

        for (i = 0; i < 12 && i < groundBg->unk52C.unk8; i++) {
            sub_0200A590(unkSubPtr, palId++, &ov11_02320BF4);
            strPtr++;
            for (j = 1; j < 16; j++) {
                RGB_Array sp20;
                RGB_Array sp1C = ov11_02320BE4;
                sp1C.c[0] = strPtr->c[0];
                sp1C.c[1] = strPtr->c[1];
                sp1C.c[2] = strPtr->c[2];
                sp1C.c[3] = strPtr->c[3];
                sp20 = sp1C;
                sub_0200A590(unkSubPtr, palId++, &sp20);
                strPtr++;
            }
        }

        for (; i < groundBg->unk52C.unk8; i++) {
            sub_0200A590(unkSubPtr, palId++, &ov11_02320BF4);
            for (j = 1; j < 16; j++) {
                sub_0200A590(unkSubPtr, palId++, &ov11_02320BE8);
            }
        }
        sub_0200A504(unkSubPtr);
    }

    groundBg->unk1EE = 0;
    sub0Ptr = groundBg->unk0;
    struct UnkStruct_2324CBC_Sub98 *unkSubPtr = &ov11_02324CBC->unk98[groundBg->unk52C.unk0];
    groundBg->unk1BC = 0;
    if (groundBg->unk194.unk8 != 0) {
        sub_02063628(&groundBg->unk1A0, unkSubPtr, 0x20);
        sub_02063734(&groundBg->unk1A0, groundBg->unk194.unk8, 0x20);
        groundBg->unk1BC = 1;
    }
    groundBg->animationSpecifications = NULL;
    groundBg->unk1F8 = 0;
    groundBg->unk1F9 = 0;
    groundBg->unk1FA = 0;
    groundBg->unk1FB = 0;

    for (s32 unk0Id = 0; unk0Id < UNK_0_ARR_COUNT; unk0Id++, sub0Ptr++) {
        sub0Ptr->unk0 = 0;
        sub0Ptr->unk2 = 0;
        sub0Ptr->unk4 = sub0Ptr->unk8 = 0;
    }

    for (s32 unk3E0Id = 0; unk3E0Id < UNK_3E0_ARR_COUNT; unk3E0Id++) {
        SubStruct_3E0 *sub3E0 = &groundBg->unk3E0[unk3E0Id];
        sub3E0->unk0 = 0;
        sub3E0->unk1 = 0;
        sub3E0->unk4 = 0;
        sub3E0->unk2 = 0;
        sub3E0->unk10 = 0;
        sub3E0->unk18 = 0;
        sub3E0->unk14 = 0;
        sub3E0->unk20 = 0;
        sub3E0->unk24 = sub3E0->unk1C = 0,
        sub3E0->unk28 = 0;
    }

    ov11_022EE620(groundBg, 1);
    groundBg->mapRender[0].tilemapRenderFunc(&groundBg->mapRender[0]);
    groundBg->unk2BA = 1;
    TRY_CLOSE_FILE(groundBg->bpcFile);
    TRY_CLOSE_FILE(groundBg->bmaFile);
}

void LoadMapType11(GroundBg *groundBg, s32 bgId, const DungeonLocation *dungLoc, s32 a3)
{
    BplHeader *bplHeader;
    LayerSpecs *layerSpecs;
    BmaHeader *bmaHeader;
    s32 i;
    s32 sp24, sp28;
    struct Unk_022C3938 sp2C;
    SubStruct_0 *sub0Ptr;

    if (bgId == -1 || dungLoc->id == 0xff) {
        ov11_022EC08C(groundBg);
        return;
    }

    GroundBg_CloseOpenedFiles(groundBg);
    groundBg->newUnk0 = 2;
    groundBg->unk1C0 = 0;
    groundBg->unk1BE = bgId;

    layerSpecs = &groundBg->layerSpecs[0];
    bmaHeader = &groundBg->bmaHeader;
    bplHeader = &groundBg->bplHeader;

    bplHeader->numPalettes = 0;
    bplHeader->hasPalAnimations = 0;

    layerSpecs->numTiles = 0;
    layerSpecs->numChunks = 0;

    bmaHeader->mapWidthTiles = 0;
    bmaHeader->mapHeightTiles = 0;
    /*bmaHeader->tilingWidth* = 0;*/
    /*bmaHeader->tilingHeight* = 0;*/
    bmaHeader->mapWidthChunks = 0;
    bmaHeader->mapHeightChunks = 0;
    bmaHeader->numLayers = 0;
    bmaHeader->hasDataLayer = 0;
    bmaHeader->hasCollision = 0;

    groundBg->unk1F0 = NULL;
    ov10_022C3E8C(groundBg->unk2D8, 0x40, &sp24, &sp28, dungLoc);
    bmaHeader->mapWidthChunks = sp24;
    bmaHeader->mapHeightChunks = sp28;
    bmaHeader->mapWidthTiles = sp24 * 3;
    bmaHeader->mapHeightTiles = sp28 * 3;
    ov10_022C3938(&sp2C,
                &groundBg->unk194,
                (void *)(VRAM + 0x18000),
                groundBg->unk2DC[0],
                groundBg->unk2E4[0],
                dungLoc,
                a3,
                0x40,
                bmaHeader->mapHeightChunks,
                groundBg->unk2D8);
    groundBg->unk17C = sp2C.unk0;
    groundBg->unk1B8 = sp2C.unk8;
    groundBg->unk52C.unk18(groundBg->unk2D8, NULL, bmaHeader, groundBg->unk52C.unk12);

    layerSpecs->numTiles = 512;
    for (i = 0; i < MAX_BPA_SLOTS; i++) {
        layerSpecs->bpaSlotNumTiles[i] = 0;
    }

    layerSpecs->numChunks = 0x190;
    groundBg->bplHeader.numPalettes = 12;
    groundBg->bplHeader.hasPalAnimations = FALSE;
    if (groundBg->unk1B8 != NULL) {
        const RGB_Array *strPtr = groundBg->unk1B8;
        struct UnkStruct_2324CBC_Sub98 *unkSubPtr = &ov11_02324CBC->unk98[groundBg->unk52C.unk0];
        u16 palId = 0;
        s32 i, j;

        for (i = 0; i < 12 && i < groundBg->unk52C.unk8; i++) {
            sub_0200A590(unkSubPtr, palId++, &ov11_02320BF4);
            strPtr++;
            for (j = 1; j < 16; j++) {
                RGB_Array sp20;
                RGB_Array sp1C = ov11_02320BEC;
                sp1C.c[0] = strPtr->c[0];
                sp1C.c[1] = strPtr->c[1];
                sp1C.c[2] = strPtr->c[2];
                sp1C.c[3] = strPtr->c[3];
                sp20 = sp1C;
                sub_0200A590(unkSubPtr, palId++, &sp20);
                strPtr++;
            }
        }

        for (; i < groundBg->unk52C.unk8; i++) {
            sub_0200A590(unkSubPtr, palId++, &ov11_02320BF4);
            for (j = 1; j < 16; j++) {
                sub_0200A590(unkSubPtr, palId++, &ov11_02320BE8);
            }
        }
        sub_0200A504(unkSubPtr);
    }

    groundBg->unk1EE = 0;
    sub0Ptr = groundBg->unk0;
    struct UnkStruct_2324CBC_Sub98 *unkSubPtr = &ov11_02324CBC->unk98[groundBg->unk52C.unk0];
    groundBg->unk1BC = 0;
    if (groundBg->unk194.unk8 != 0) {
        sub_02063628(&groundBg->unk1A0, unkSubPtr, 0x20);
        sub_02063734(&groundBg->unk1A0, groundBg->unk194.unk8, 0x20);
        groundBg->unk1BC = 1;
    }
    groundBg->animationSpecifications = NULL;
    groundBg->unk1F8 = 0;
    groundBg->unk1F9 = 0;
    groundBg->unk1FA = 0;
    groundBg->unk1FB = 0;

    for (s32 unk0Id = 0; unk0Id < UNK_0_ARR_COUNT; unk0Id++, sub0Ptr++) {
        sub0Ptr->unk0 = 0;
        sub0Ptr->unk2 = 0;
        sub0Ptr->unk4 = sub0Ptr->unk8 = 0;
    }

    for (s32 unk3E0Id = 0; unk3E0Id < UNK_3E0_ARR_COUNT; unk3E0Id++) {
        SubStruct_3E0 *sub3E0 = &groundBg->unk3E0[unk3E0Id];
        sub3E0->unk0 = 0;
        sub3E0->unk1 = 0;
        sub3E0->unk4 = 0;
        sub3E0->unk2 = 0;
        sub3E0->unk10 = 0;
        sub3E0->unk18 = 0;
        sub3E0->unk14 = 0;
        sub3E0->unk20 = 0;
        sub3E0->unk24 = sub3E0->unk1C = 0,
        sub3E0->unk28 = 0;
    }

    groundBg->unk2B8 = 1;
    ov11_022EE620(groundBg, 1);
    groundBg->mapRender[0].tilemapRenderFunc(&groundBg->mapRender[0]);
    groundBg->unk2BA = 1;
    TRY_CLOSE_FILE(groundBg->bpcFile);
    TRY_CLOSE_FILE(groundBg->bmaFile);
}

//
