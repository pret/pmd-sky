#ifndef PMDSKY_OVERLAY_11_022EBB40_H
#define PMDSKY_OVERLAY_11_022EBB40_H

// TODO: Move these to actual headers later on
struct iovec
{
    void* iov_base;
    u32 iov_len;
};

typedef struct PixelPos
{
    /* 0x0 */ s32 x;
    /* 0x4 */ s32 y;
} PixelPos;



#define BG_NAME_LEN 8

struct bg_list_entry_sub_struct {
    char name[BG_NAME_LEN + 2]; // Null-terminated string
};

#define BPA_MAX_ENTRIES 8

// Represents an entry in the bg_list.dat file, after being loaded by LoadBgListEntry
struct bg_list_entry {
    struct bg_list_entry_sub_struct bpl;
    struct bg_list_entry_sub_struct bpc;
    struct bg_list_entry_sub_struct bma;
    struct bg_list_entry_sub_struct others_bpa[BPA_MAX_ENTRIES];
};

#define UNK_0_ARR_COUNT 16 // Was 14 in Red
#define UNK_E0_ARR_COUNT 32
#define UNK_3E0_ARR_COUNT 4 // Was 2 in Red
#define NUM_LAYERS 2

typedef struct SubStruct_0
{
    s16 unk0;
    s16 unk2;
    const void *unk4;
    const void *unk8;
    //u8 fillC; // Filler byte removed in Sky, present in Red
} SubStruct_0;

// Was 0x24 in Red...
typedef struct SubStruct_3E0
{
    u8 unk0;
    u8 unk1;
    s16 unk2;
    s16 unk4;
    struct iovec bpaFile;
    //const struct BpaHeader *unkC; hm...
    const void *unk10;
    const void *unk14;
    const void *unk18;
    const void *unk1C;
    void *unk20;
    u32 unk24;
    u32 unk28;
} SubStruct_3E0;

// size: 0x18?
typedef struct SubStruct_52C
{
    u8 unk0; // 0x52C
    s16 unk2; // 0x52E
    s16 unk4; // 0x530
    s16 unk6; // 0x532
    s16 unk8; // 0x534
    s16 unkA; // 0x536
    s16 unkC; // numLayers
    s16 unkE[2]; // 0x53A
    s16 unk12; // 0x53E
    s16 unk14;
    s16 unk16;
    void *unk18; // Maybe void (*unk14)(void *, const void *, BmaHeader *, s32); // TODO: fix void * to proper ptr types 0x540
} SubStruct_52C;

struct UnkGroundBg_1A0
{
    u8 unk0;
    u8 unk1;
    u8 unk2;
    u8 unk3;
    u8 unk4;
    u8 unk5;
    u8 unk6;
    u8 unk7;
    u8 unk8;
    u8 unk9;
    u8 unkA;
    u8 unkB;
    u8 unkC;
    u8 unkD;
    u8 unkE;
    u8 unkF;
    u8 unk10;
    u8 unk11;
    u8 unk12;
    u8 unk13;
    u8 unk14;
    u8 unk15;
    u8 unk16;
    u8 unk17;
};

struct UnkGroundBg_194
{
    u8 unk0;
    u8 unk1;
    u8 unk2;
    u8 unk3;
    u8 unk4;
    u8 unk5;
    u8 unk6;
    u8 unk7;
    u8 unk8;
    u8 unk9;
    u8 unkA;
    u8 unkB;
};

// size: 0x55C
typedef struct GroundBg
{
    u16 newUnk0; // Not present in Red
    SubStruct_0 unk0[UNK_0_ARR_COUNT];
    SubStruct_3E0 unk3E0[UNK_3E0_ARR_COUNT]; // 0xc4
    struct iovec bplFile; // 0x174
    struct iovec unk17C; // 0x17C
    struct iovec bpcFile; // 0x184
    struct iovec bmaFile; // 0x18c
    struct UnkGroundBg_194 unk194;
    struct UnkGroundBg_1A0 unk1A0;
    u8 unk1B8;
    u8 unk1B9;
    u8 unk1BA;
    u8 unk1BB;
    u8 unk1BC;
    u8 unk1BD;
    s16 unk1BE;
    u8 unk1C0;
    u8 unk1C1;
    u8 unk1C2;
    u8 unk1C3;
    u8 unk1C4;
    u8 unk1C5;
    u8 unk1C6;
    u8 unk1C7;
    u8 unk1C8;
    u8 unk1C9;
    u8 unk1CA;
    u8 unk1CB;
    u8 unk1CC;
    u8 unk1CD;
    u8 unk1CE;
    u8 unk1CF;
    u8 unk1D0;
    u8 unk1D1;
    u8 unk1D2;
    u8 unk1D3;
    u8 unk1D4;
    u8 unk1D5;
    u8 unk1D6;
    u8 unk1D7;
    u8 unk1D8;
    u8 unk1D9;
    u8 unk1DA;
    u8 unk1DB;
    u8 unk1DC;
    u8 unk1DD;
    u8 unk1DE;
    u8 unk1DF;
    u8 unk1E0;
    u8 unk1E1;
    u8 unk1E2;
    u8 unk1E3;
    u8 unk1E4;
    u8 unk1E5;
    u8 unk1E6;
    u8 unk1E7;
    u8 unk1E8;
    u8 unk1E9;
    u8 unk1EA;
    u8 unk1EB;
    u8 unk1EC;
    u8 unk1ED;
    u8 unk1EE;
    u8 unk1EF;
    s32 unk1F0;
    s32 unk1F4;
    u8 unk1F8;
    u8 unk1F9;
    u8 unk1FA;
    u8 unk1FB;
    u8 unk1FC;
    u8 unk1FD;
    u8 unk1FE;
    u8 unk1FF;
    PixelPos cameraPixelPosition[NUM_LAYERS]; // 0x200
    u8 fillerForNow2[170];
    u8 unk2BA;
    SubStruct_52C unk52C; // 2bc
    u16 *unk2D8;
    u16 *unk2DC[2];
    u16 *unk2E4[2];
    u16 *unk2EC[2];
} GroundBg;

void LoadBackgroundAttributes(struct bg_list_entry* entry, int bgId);
void ov11_022EBC18(GroundBg *groundBg, const SubStruct_52C *a1);
void ov11_022EBEAC(GroundBg *groundBg);
void ov11_022EBF60(GroundBg *groundBg);

#endif //PMDSKY_OVERLAY_11_022EBB40_H
