#include "overlay_11_022EBB40.h"
#include "file_rom.h"

// TODO: Move these to headers
#define RGB_R 0
#define RGB_G 1
#define RGB_B 2
#define RGB_UNK 3
#define RGB_FIELDS_COUNT 4

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
    groundBg->unk1E0 = 0;
    groundBg->unk1E1 = 0;
    groundBg->unk1E2 = 0;
    groundBg->unk1E3 = 0;
    groundBg->unk1EE = 0;
    groundBg->unk1F4 = 0;
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
        unkPtr->unk1C = 0;
        unkPtr->unk28 = unkPtr->unk24 = 0;
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
    groundBg->unk1E0 = 0;
    groundBg->unk1E1 = 0;
    groundBg->unk1E2 = 0;
    groundBg->unk1E3 = 0;
    groundBg->unk1EE = 0;
    groundBg->unk1F4 = 0;
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
        unkPtr->unk1C = 0;
        unkPtr->unk28 = unkPtr->unk24 = 0;
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
