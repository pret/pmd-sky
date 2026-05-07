#ifndef PMDSKY_SAVE_H
#define PMDSKY_SAVE_H

struct bitstream {
    char* ptr; // Current byte
    u32 end; // End of the region the bitstream can read from / write to. Doesn't seem to do anything with this information?
    u32 bit_idx; // Bit position in current byte
    u32 bit_count; // Total bits this stream has used
};

#endif //PMDSKY_SAVE_H
