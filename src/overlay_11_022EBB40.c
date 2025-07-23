#include "overlay_11_022EBB40.h"
#include "file_rom.h"

extern void FileClose(struct file_stream* file);
extern void* MemAlloc(u32 len, u32 flags);

extern const char ov11_02320C44[];

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

struct UnkStruct_2324CBC
{
    u8 fill0[0x1C];
};

extern struct UnkStruct_2324CBC *ov11_02324CBC;

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
            groundBg->unk2EC[id2] = sub_0200B500(&ov11_02324CBC[id]);
        }
        else {
            struct UnkStruct_2324CBC *ptr = ov11_02324CBC;
            ptr += 2;
            groundBg->unk2EC[id2] = sub_0200B500(&ptr[id]);
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
