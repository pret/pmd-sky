#ifndef PMDSKY_OVERLAY_11_022EBB40_H
#define PMDSKY_OVERLAY_11_022EBB40_H

struct iovec
{
    void* iov_base;
    u32 iov_len;
};

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

typedef struct PixelPos
{
    /* 0x0 */ s32 x;
    /* 0x4 */ s32 y;
} PixelPos;

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

#define CHUNK_DIMENSIONS_3x3 2

// size: 0x55C
typedef struct GroundBg
{
    u16 newUnk0; // Not present in Red
    SubStruct_0 unk0[UNK_0_ARR_COUNT];
    SubStruct_3E0 unk3E0[UNK_3E0_ARR_COUNT]; // 0xc4
    u8 unk174; // 0x174
    u8 unk175;
    u8 unk176;
    u8 unk177;
    u8 unk178;
    u8 unk179;
    u8 unk17A;
    u8 unk17B;
    u8 unk17C;
    u8 unk17D;
    u8 unk17E;
    u8 unk17F;
    u8 unk180;
    u8 unk181;
    u8 unk182;
    u8 unk183;
    u8 unk184;
    u8 unk185;
    u8 unk186;
    u8 unk187;
    u8 unk188;
    u8 unk189;
    u8 unk18A;
    u8 unk18B;
    u8 unk18C;
    u8 unk18D;
    u8 unk18E;
    u8 unk18F;
    u8 unk190;
    u8 unk191;
    u8 unk192;
    u8 unk193;
    u8 unk194;
    u8 unk195;
    u8 unk196;
    u8 unk197;
    u8 unk198;
    u8 unk199;
    u8 unk19A;
    u8 unk19B;
    u8 unk19C;
    u8 unk19D;
    u8 unk19E;
    u8 unk19F;
    u8 unk1A0;
    u8 unk1A1;
    u8 unk1A2;
    u8 unk1A3;
    u8 unk1A4;
    u8 unk1A5;
    u8 unk1A6;
    u8 unk1A7;
    u8 unk1A8;
    u8 unk1A9;
    u8 unk1AA;
    u8 unk1AB;
    u8 unk1AC;
    u8 unk1AD;
    u8 unk1AE;
    u8 unk1AF;
    u8 unk1B0;
    u8 unk1B1;
    u8 unk1B2;
    u8 unk1B3;
    u8 unk1B4;
    u8 unk1B5;
    u8 unk1B6;
    u8 unk1B7;
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

#endif //PMDSKY_OVERLAY_11_022EBB40_H
