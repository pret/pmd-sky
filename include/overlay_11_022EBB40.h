#ifndef PMDSKY_OVERLAY_11_022EBB40_H
#define PMDSKY_OVERLAY_11_022EBB40_H

#include "util.h"

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

typedef struct DungeonLocation
{
    /* 0x0 */ u8 id;
    /* 0x1 */ u8 floor;
} DungeonLocation;

// Actual file's header starts here

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

struct BpaHeader
{
    u8 numTiles; // The number of individual tiles.
    s16 numFrames; // The number of frames for each tile.
    s32 durationPerFrame[0]; // Settings for each frame. One entry per frame.
    // Tiles data below
};

// Was 0x24 in Red...
typedef struct SubStruct_3E0
{
    u8 unk0;
    u8 unk1;
    s16 unk2;
    s16 unk4;
    struct iovec bpaFile;
    const struct BpaHeader *unk10;
    const void *unk14;
    const void *unk18;
    const void *unk1C;
    void *unk20;
    void *unk24;
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
    void (*unk18)(void *, const void *, void *, s32); // TODO: fix void * to proper ptr types 0x540
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
    u32 unk8;
};

typedef struct MapRender
{
    s16 chunkDimensions;
    s16 unk2;
    s16 numBgs;
    bool8 wrapAround;
    s32 widthChunks;
    s32 heightChunks;
    PixelPos mapSizePixels;
    void (*tilemapRenderFunc)(struct MapRender *);
} MapRender;

#define MAX_BPA_SLOTS 4

typedef struct LayerSpecs
{
    // Not present in pmd-sky
    // s16 chunkWidth; // Must be 2 or 3
    // s16 chunkHeight; // Must be 2 or 3
    s16 numTiles; // The number of tiles stored in the data + 1. The +1 is the null tile at the beginning of tiles.
    s16 bpaSlotNumTiles[MAX_BPA_SLOTS]; // The number of tiles in the BPA on this slot. 0 if no BPA is assigned.
    s16 numChunks; // Number of chunks in the tilemap + 1. The +1 is the null chunk at the beginning of tile mappings, that is not stored.
} LayerSpecs;

typedef struct BmaHeader
{
    // Map width/height that the camera in game will travel in tiles. Also the width/height of the collision and unknown data layers! For most maps (Map Width Chunks) * (Tiling Width) = (Map Width Camera).
    u8 mapWidthTiles;
    u8 mapHeightTiles;

    // Width/Height of chunks in tiles. Always 3, the value is ignored for these.
    //u8 tilingWidth;
    //u8 tilingHeight;

    // Map width/height in chunks. Also the width/height of the chunk mappings.
    u8 mapWidthChunks;
    u8 mapHeightChunks;

    u16 numLayers; // Number of layers in this map. Must match BPC layer size. Allowed values are only 1 or 2.
    u16 hasDataLayer; // Seems to be a boolean flag (0 or 1). If >0, the Unknown Data Layer exists.
    u16 hasCollision; // Number of Collision layers. 0, 1 or 2.
} BmaHeader;

typedef struct BplHeader
{
    s16 numPalettes;
    s16 hasPalAnimations;
    // RGB palettes
    // Animation Specification array
    // Animation RGB palettes
} BplHeader;

typedef struct AnimationSpecification
{
    s16 durationPerFrame; // Time in game frames to hold a single palette frame for
    s16 numFrames; // Number of frames. This is also usually the length of frames in animation palette, but it can also be less.
} AnimationSpecification;

// size: 0x55C
typedef struct GroundBg
{
    s16 newUnk0; // Not present in Red
    SubStruct_0 unk0[UNK_0_ARR_COUNT];
    SubStruct_3E0 unk3E0[UNK_3E0_ARR_COUNT]; // 0xc4
    struct iovec bplFile; // 0x174
    struct iovec unk17C; // 0x17C
    struct iovec bpcFile; // 0x184
    struct iovec bmaFile; // 0x18c
    struct UnkGroundBg_194 unk194;
    struct UnkGroundBg_1A0 unk1A0;
    void *unk1B8;
    u8 unk1BC;
    u8 unk1BD;
    s16 unk1BE;
    u8 unk1C0;
    u8 unk1C1;
    u8 unk1C2;
    u8 unk1C3;
    s32 unk1C4;
    LayerSpecs layerSpecs[NUM_LAYERS]; // 1c8
    BmaHeader bmaHeader;
    BplHeader bplHeader;
    u8 unk1EE;
    u8 unk1EF;
    const void *unk1F0;
    const AnimationSpecification *animationSpecifications; // 0x1F4
    u8 unk1F8;
    u8 unk1F9;
    u8 unk1FA;
    u8 unk1FB;
    u8 unk1FC;
    u8 unk1FD;
    u8 unk1FE;
    u8 unk1FF;
    PixelPos cameraPixelPosition[NUM_LAYERS]; // 0x200
    MapRender mapRender[NUM_LAYERS]; // 0x210
    u8 fillerForNow2[112];
    s16 unk2B8;
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
void ov11_022EBFC8(GroundBg *groundBg);
void ov11_022EC08C(GroundBg *groundBg);
void ov11_022EC240(GroundBg *groundBg, s32 bgId);
void ov11_022EC27C(GroundBg *groundBg, s32 bgId);
void LoadMapType10(GroundBg *groundBg, s32 bgId, const DungeonLocation *dungLoc, s32 a3);
void LoadMapType11(GroundBg *groundBg, s32 bgId, const DungeonLocation *dungLoc, s32 a3);

#endif //PMDSKY_OVERLAY_11_022EBB40_H
