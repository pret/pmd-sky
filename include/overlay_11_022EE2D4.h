#ifndef PMDSKY_OVERLAY_11_022EE2D4_H
#define PMDSKY_OVERLAY_11_022EE2D4_H

struct bma_header
{
    u8 map_width_tiles;
    u8 map_height_tiles;

    u8 map_width_chunks;
    u8 map_height_chunks;

    u16 num_layers;
    u16 has_data_layer;
    u16 has_collision;
} bma_header;

struct substruct_52c
{
    s16 unk0;
    s16 unk2;
    s16 num_layers;
    s16 unk6;
    s16 unk8;
    s16 unkA;
    s16 unkEh;
    s16 unkE;
    s16 padding[2];
    s16 unk10;
    s16 unk12;
    void (*unk14)(void *, const void *, struct bma_header *, s32);
};

const u8* BmaLayerNrlDecompressor(u16 **dst_array, const void *bma_data, struct substruct_52c *a2, struct bma_header *bma_header);

#endif //PMDSKY_OVERLAY_11_022EE2D4_H
