#ifndef PMDSKY_FILE_H
#define PMDSKY_FILE_H

struct file_stream {
    u32 field_0x0;
    u32 field_0x4;
    u32 field_0x8;
    u32 field_0xc;
    u32 field_0x10;
    u32 field_0x14;
    u32 field_0x18;
    u32 field_0x1c;
    u32 field_0x20;
    void* start_address;
    void* end_address;
    void* current_address;
    u32 field_0x30;
    u32 field_0x34;
    u32 field_0x38;
    u32 field_0x3c;
    u32 field_0x40;
    u32 field_0x44;
};

struct iovec {
    void* iov_base;
    u32 iov_len;
};

#endif
