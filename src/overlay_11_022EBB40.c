#include "overlay_11_022EBB40.h"
#include "file_rom.h"
#include "main_0200330C.h"

#define RGB_FIELDS_COUNT 4

#define FILE_BG_LIST_ENTRY_SIZE (BG_NAME_LEN * (BPA_MAX_ENTRIES + 3))

extern void MemFree(void*);
#define FREE_AND_SET_NULL(ptr)          \
{                                       \
    MemFree(ptr);                    \
    ptr = NULL;                         \
}
#define TRY_FREE_AND_SET_NULL(ptr) if (ptr != NULL) FREE_AND_SET_NULL(ptr)

extern bool8 PointsToZero(struct opened_file *ptr);
extern void UnloadFile(struct opened_file *ptr);
#define CLOSE_FILE_AND_SET_NULL(f)    \
{                                           \
    UnloadFile(&f);                     \
    f = NULL;                         \
}
#define TRY_CLOSE_FILE(f) if (!PointsToZero(&f)) {UnloadFile(&f);}

struct rgb_array
{
    u8 c[RGB_FIELDS_COUNT];
};

struct unk_struct_2324CBC_sub0
{
    u8 fill0[0x1C];
};

struct unk_struct_2324CBC_sub98
{
    u8 fill0[7];
    u8 unk8;
    u8 fill9[0x18 - 0x9];
    struct rgb_array *unk18;
    u8 fill1C[0x28 - 0x1c];
};

struct unk_struct_2324CBC
{
    struct unk_struct_2324CBC_sub0 unk0[2][2];
    struct unk_struct_2324CBC_sub98 unk98[2];
};

struct const_file_data
{
    u8 other_data[20];
    const struct pixel_position s_position_zero;
};

extern const char ov11_02320C44[];
extern void FileClose(struct file_stream*);
extern struct unk_struct_2324CBC *ov11_02324CBC;
extern const struct const_file_data ov11_02320BE4;
extern void* MemAlloc(u32 len, u32 flags);
extern void* sub_0200B500(struct unk_struct_2324CBC_sub0 *unk);
extern void CloseOpenedFiles(struct ground_bg *ground_bg);
extern void sub_02063600(void *);
extern void sub_020635C8(struct ground_bg_substruct_194 *);
extern void ov11_022EBF60(struct ground_bg *ground_bg);
extern void sub_0206367C(void *);
extern void sub_020635D8(struct ground_bg_substruct_194 *);

void LoadBackgroundAttributes(struct bg_list_entry *entry, s32 bg_id)
{
    s32 i;
    struct file_stream file;

    FileRom_InitDataTransfer();
    FileRom_Veneer_FileInit(&file);
    FileRom_HandleOpen(&file, ov11_02320C44);
    FileRom_HandleSeek(&file, FILE_BG_LIST_ENTRY_SIZE * bg_id, 0);

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

void GroundBgInit(struct ground_bg *ground_bg, const struct ground_bg_substruct_52c *a1)
{
    struct ground_bg_substruct_2 *unk0Ptr;
    s32 id, unk0Id, unk3E0Id;
    s32 i;
    s32 id2;
    s32 memGroup;

    ground_bg->unk52C = *a1;
    memGroup = (ground_bg->unk52C.unk0 == 0) ? 6 : 15;
    id2 = ground_bg->unk52C.unk2;
    for (id = 0; id < ground_bg->unk52C.num_layers; id++, id2++) {
        if (ground_bg->unk52C.unkE[id] > 0) {
            ground_bg->unk2DC[id] = MemAlloc(ground_bg->unk52C.unkE[id] * 18u, memGroup);
        }
        else {
            ground_bg->unk2DC[id] = NULL;
        }
    }
    for (; id < NUM_LAYERS; id++, id2++) {
        ground_bg->unk2DC[id] = NULL;
    }

    id = ground_bg->unk52C.unk2;
    for (id2 = 0; id2 < ground_bg->unk52C.num_layers; id2++, id++) {

        if (ground_bg->unk52C.unk0 == 0) {
            ground_bg->unk2EC[id2] = sub_0200B500(&ov11_02324CBC->unk0[0][id]);
        }
        else {
            ground_bg->unk2EC[id2] = sub_0200B500(&ov11_02324CBC->unk0[1][id]);
        }

        if (ground_bg->unk52C.unkE[id2] > 0) {
            ground_bg->unk2E4[id2] = MemAlloc(ground_bg->unk52C.unk14 * 128, memGroup);
        }
        else {
            ground_bg->unk2E4[id2] = NULL;
        }
    }
    for (; id2 < 2; id2++) {
        ground_bg->unk2EC[id2] = NULL;
        ground_bg->unk2E4[id2] = NULL;
    }

    ground_bg->unk2D8 = (ground_bg->unk52C.unk18 == 0) ? NULL : MemAlloc(ground_bg->unk52C.unk12 * 256, memGroup);
    ov11_022EBF60(ground_bg);
    ground_bg->unk0 = 0;
    ground_bg->unk1C0 = 0;
    ground_bg->unk2BA = 0;
    ground_bg->unk1BE = -1;
    ground_bg->unk1F0 = 0;
    ground_bg->unk1E0 = 0;
    ground_bg->unk1E1 = 0;
    ground_bg->unk1E2 = 0;
    ground_bg->unk1E3 = 0;
    ground_bg->unk1EE = 0;
    ground_bg->unk1F4 = 0;
    ground_bg->unk1F8 = 0;
    ground_bg->unk1F9 = 0;
    ground_bg->unk1FA = 0;
    ground_bg->unk1FB = 0;
    ground_bg->unk1BC = 0;

    unk0Ptr = &ground_bg->unk2[0];
    for (unk0Id = 0; unk0Id < UNK_2_ARR_COUNT; unk0Id++, unk0Ptr++) {
        unk0Ptr->unk0 = 0;
        unk0Ptr->unk2 = 0;
        unk0Ptr->unk4 = unk0Ptr->unk8 = 0;
    }

    for (unk3E0Id = 0; unk3E0Id < UNK_C4_ARR_COUNT; unk3E0Id++) {
        struct ground_bg_substruct_c4 *unkPtr = &ground_bg->unkC4[unk3E0Id];
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

    for (i = 0; i < 2; i++) {
        ground_bg->camera_pixel_position[i] = ov11_02320BE4.s_position_zero;
    }
}

void GroundBgFreeAll(struct ground_bg *ground_bg)
{
    s32 i;

    CloseOpenedFiles(ground_bg);
    TRY_FREE_AND_SET_NULL(ground_bg->unk2D8);

    for (i = 0; i < NUM_LAYERS; i++) {
        if (ground_bg->unk2DC[i] != NULL) {
            if (ground_bg->unk52C.unkE[i] > 0) {
                MemFree(ground_bg->unk2DC[i]);
            }
            ground_bg->unk2DC[i] = NULL;
        }
        if (ground_bg->unk2EC[i] != NULL) {
            ground_bg->unk2EC[i] = NULL;
        }
        if (ground_bg->unk2E4[i] != NULL) {
            if (ground_bg->unk52C.unkE[i] > 0) {
                MemFree(ground_bg->unk2E4[i]);
            }
            ground_bg->unk2E4[i] = NULL;
        }
    }
}

void ov11_022EBF60(struct ground_bg *ground_bg)
{
    s32 i;

    for (i = 0; i < UNK_C4_ARR_COUNT; i++) {
        struct ground_bg_substruct_c4 *unkPtr = &ground_bg->unkC4[i];
        ZInit8(&unkPtr->bpa_file);
    }

    sub_02063600(&ground_bg->unk1A0);
    sub_020635C8(&ground_bg->unk194);
    ground_bg->unk1BC = 0;

    ZInit8(&ground_bg->bpl_file);
    ZInit8(&ground_bg->unk17C);
    ZInit8(&ground_bg->bpc_file);
    ZInit8(&ground_bg->bma_file);
}

void CloseOpenedFiles(struct ground_bg *ground_bg)
{
    s32 i;
    if (ground_bg->unk0 == 3) {
        ov11_022EBF60(ground_bg);
        return;
    }

    for (i = 0; i < UNK_C4_ARR_COUNT; i++) {
        struct ground_bg_substruct_c4 *unkPtr = &ground_bg->unkC4[i];
        TRY_CLOSE_FILE(unkPtr->bpa_file);
    }
    sub_0206367C(&ground_bg->unk1A0);
    sub_020635D8(&ground_bg->unk194);

    TRY_CLOSE_FILE(ground_bg->bpl_file);
    TRY_CLOSE_FILE(ground_bg->unk17C);
    TRY_CLOSE_FILE(ground_bg->bpc_file);
    TRY_CLOSE_FILE(ground_bg->bma_file);
}
