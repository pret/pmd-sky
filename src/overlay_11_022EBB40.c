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

extern bool8 PointsToZero(struct iovec *ptr);
extern void UnloadFile(struct iovec *ptr);
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
    u8 unk70[0x28];
    struct unk_struct_2324CBC_sub98 unk98[2];
};

struct const_file_data
{
    u8 other_data[20];
    const struct pixel_position s_position_zero;
};

extern const char ov11_02320C44[];
extern const struct rgb_array ov11_02320BF4;
extern const struct rgb_array ov11_02320BE8;

extern void FileClose(struct file_stream*);
extern struct unk_struct_2324CBC *ov11_02324CBC;
extern const struct const_file_data ov11_02320BE4;
extern void* MemAlloc(u32 len, u32 flags);
extern void* sub_0200B500(struct unk_struct_2324CBC_sub0 *unk);
extern void CloseOpenedGroundBgFiles(struct ground_bg *ground_bg);
extern void sub_02063600(void *);
extern void sub_020635C8(struct ground_bg_sub_struct_194 *);
extern void ov11_022EBF60(struct ground_bg *ground_bg);
extern void sub_0206367C(void *);
extern void sub_020635D8(struct ground_bg_sub_struct_194 *);
extern void sub_0200A590(struct unk_struct_2324CBC_sub98 *, s32 id, const struct rgb_array *src);
extern void sub_0200A504(struct unk_struct_2324CBC_sub98 *);
extern void ov11_022EE620(struct ground_bg *ground_bg, s32 a1);

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

void GroundBgInit(struct ground_bg *ground_bg, const struct ground_bg_sub_struct_2bc *a1)
{
    struct ground_bg_sub_struct_4 *unk4Ptr;
    s32 id, unk4Id, unkC4Id;
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

    unk4Ptr = &ground_bg->unk4[0];
    for (unk4Id = 0; unk4Id < UNK_4_ARR_COUNT; unk4Id++, unk4Ptr++) {
        unk4Ptr->unk0 = 0;
        unk4Ptr->unk2 = 0;
        unk4Ptr->unk4 = unk4Ptr->unk8 = 0;
    }

    for (unkC4Id = 0; unkC4Id < UNK_C4_ARR_COUNT; unkC4Id++) {
        struct ground_bg_sub_struct_c4 *unkPtr = &ground_bg->unkC4[unkC4Id];
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

    CloseOpenedGroundBgFiles(ground_bg);
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
        struct ground_bg_sub_struct_c4 *unkPtr = &ground_bg->unkC4[i];
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

void CloseOpenedGroundBgFiles(struct ground_bg *ground_bg)
{
    s32 i;
    if (ground_bg->unk0 == 3) {
        ov11_022EBF60(ground_bg);
        return;
    }

    for (i = 0; i < UNK_C4_ARR_COUNT; i++) {
        struct ground_bg_sub_struct_c4 *unkPtr = &ground_bg->unkC4[i];
        TRY_CLOSE_FILE(unkPtr->bpa_file);
    }
    sub_0206367C(&ground_bg->unk1A0);
    sub_020635D8(&ground_bg->unk194);

    TRY_CLOSE_FILE(ground_bg->bpl_file);
    TRY_CLOSE_FILE(ground_bg->unk17C);
    TRY_CLOSE_FILE(ground_bg->bpc_file);
    TRY_CLOSE_FILE(ground_bg->bma_file);
}

void ov11_022EC08C(struct ground_bg *ground_bg)
{
    u8 unkId;
    u16 palId;
    s32 i, j;
    struct ground_bg_sub_struct_4 *unk4Ptr;
    s32 unk4Id, unkC4Id;
    struct unk_struct_2324CBC_sub98 *unkSubPtr;

    CloseOpenedGroundBgFiles(ground_bg);
    ground_bg->unk0 = 0;
    ground_bg->unk1C0 = 0;
    ground_bg->unk1BE = -1;
    ground_bg->unk2B8 = 0;
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

    unk4Ptr = &ground_bg->unk4[0];
    for (unk4Id = 0; unk4Id < UNK_4_ARR_COUNT; unk4Id++, unk4Ptr++) {
        unk4Ptr->unk0 = 0;
        unk4Ptr->unk2 = 0;
        unk4Ptr->unk4 = unk4Ptr->unk8 = 0;
    }

    for (unkC4Id = 0; unkC4Id < UNK_C4_ARR_COUNT; unkC4Id++) {
        struct ground_bg_sub_struct_c4 *unkPtr = &ground_bg->unkC4[unkC4Id];
        unkPtr->unk0 = 0;
        unkPtr->unk1 = 0;
        unkPtr->unk2 = 0;
        unkPtr->unk4 = 0;
        ZInit8(&unkPtr->bpa_file);
        unkPtr->unk10 = 0;
        unkPtr->unk18 = 0;
        unkPtr->unk14 = 0;
        unkPtr->unk20 = 0;
        unkPtr->unk1C = 0;
        unkPtr->unk28 = unkPtr->unk24 = 0;
    }

    unkId = ground_bg->unk52C.unk0;
    unkSubPtr = &ov11_02324CBC->unk98[unkId];
    palId = ground_bg->unk52C.unk6 * 16;
    for (i = 0; i < ground_bg->unk52C.unk8; i++) {
        sub_0200A590(unkSubPtr, palId++, &ov11_02320BF4);
        for (j = 1; j < 16; j++) {
            sub_0200A590(unkSubPtr, palId++, &ov11_02320BE8);
        }
    }
    sub_0200A504(unkSubPtr);

    if (ground_bg->unk52C.num_layers > 0) {
        ov11_022EE620(ground_bg, 1);
    }
    else {
        ov11_022EE620(ground_bg, 0);
    }

    ground_bg->map_render[0].tilemap_render_func(&ground_bg->map_render[0]);
    ground_bg->unk2BA = 1;
}

void ov11_022EC240(struct ground_bg *ground_bg, s32 bg_id)
{
    ov11_022EC08C(ground_bg);
    if (bg_id != -1) {
        struct bg_list_entry entry;

        ground_bg->unk1BE = bg_id;
        LoadBackgroundAttributes(&entry, ground_bg->unk1BE); // This loads bg attributes and doesn't do anything with them.
    }
}
