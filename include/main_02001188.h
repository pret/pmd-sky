#ifndef PMDSKY_MAIN_02001188_H
#define PMDSKY_MAIN_02001188_H

// Unclear if these structs match, since they haven't been used other than in extern prototypes. Hopefully they do, though.
struct mem_block {
    u32 content_flags; // Bit 0: in_use. Bit 1: object. Bit 2: arena. Bits 3-31: Unused?
    u32 allocator_flags; // Bit 0: alloc_in_use. Bit 1: alloc_object. Bit 2: alloc_arena. Bit 3: alloc_subarena. Bits 4-31: Unused?
    u32 user_flags; // Bits 0-7: ??? Bit 8: user_alloc_in_use. Bit 9: user_alloc_arena. Bit 10: user_alloc_arena. Bit 11: user_alloc_subarena. Bits 12-31: Unused?
    void * data;
    u32 available;
    u32 used;
};

struct mem_arena {
    u32 content_flags;
    struct mem_arena *parent;
    struct mem_block *blocks;
    u32 n_blocks;
    u32 max_blocks;
    void *data;
    u32 len;
};

void MemFree(void * ptr);

#endif //PMDSKY_MAIN_02001188_H
