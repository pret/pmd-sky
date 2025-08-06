#include "overlay_11_022EBB40.h"
#include "file_rom.h"

// TODO: Move these to headers
#define RGB_R 0
#define RGB_G 1
#define RGB_B 2
#define RGB_UNK 3
#define RGB_FIELDS_COUNT 4

#define SWAP(a, b, temp)    \
{                           \
    temp = a;               \
    a = b;                  \
    b = temp;               \
}

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
extern const RGB_Array ov11_02320BF4;
extern const RGB_Array ov11_02320BE8;

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
void ov11_022EBFC8(GroundBg *groundBg); // Close Opened Files ?
void sub_02063600(struct UnkGroundBg_1A0 *);
void sub_0206367C(struct UnkGroundBg_1A0 *);
void sub_020635C8(struct UnkGroundBg_194 *);
void sub_020635D8(struct UnkGroundBg_194 *);
void ov11_022EE620(GroundBg *groundBg, s32 a1);
const u8 *ov11_022EE2D4(u16 **dstArray, const void *bmaData, SubStruct_52C *a2, BmaHeader *bmaHeader); // BmaLayerNrlDecompressor

struct ConstFileData
{
    u8 otherData[20];
    const PixelPos sPositionZero;
};

extern const struct ConstFileData ov11_02320BE4;

// GroundBg_Init?
void ov11_022EBC18(GroundBg *groundBg, const SubStruct_52C *a1)
{
    SubStruct_0 *unk0Ptr;
    s32 id, unk0Id, unk3E0Id;
    s32 i;
    s32 id2;
    s32 memGroup;

    groundBg->unk52C = *a1;
    memGroup = (groundBg->unk52C.unk0 == 0) ? 6 : 15;
    id2 = groundBg->unk52C.unk2;
    for (id = 0; id < groundBg->unk52C.unk4; id++, id2++) {
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
    for (id2 = 0; id2 < groundBg->unk52C.unk4; id2++, id++) {

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
        groundBg->cameraPixelPosition[i] = ov11_02320BE4.sPositionZero;
    }
}

void ov11_022EBEAC(GroundBg *groundBg)
{
    s32 i;

    ov11_022EBFC8(groundBg);
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

void ov11_022EBFC8(GroundBg *groundBg)
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

    ov11_022EBFC8(groundBg);
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

    if (groundBg->unk52C.unk4 > 0) {
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

extern const char ov11_02320C58[];
extern const char ov11_02320C94[];
extern const char ov11_02320C6C[];
extern const char ov11_02320C80[];
extern void *ov11_02320C18[][2]; // Vram ptrs

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
    ov11_022EBFC8(groundBg);
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

    bmaData = ov11_022EE2D4(groundBg->unk2E4, bmaData, &groundBg->unk52C, &groundBg->bmaHeader);
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
