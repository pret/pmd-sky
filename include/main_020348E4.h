#ifndef PMDSKY_MAIN_020348E4_H
#define PMDSKY_MAIN_020348E4_H

struct struct_1 {
    s8 f[4]; // 0x0
    u32 a;   // 0x4
    u8 b[7]; // 0x8
};

struct struct_02AFDB8 {
    u8 PAD1[16];
    u8 a;              // 0x10
    u8 PAD2[3];
    struct struct_1 c; // 0x14
    u32 e;             // 0x24
    u8 PAD3[152];
    u8 d;              // 0xc4
    struct struct_1 b; // 0xc4
};

u32 sub_020348E4(struct struct_1* dst);

#endif //PMDSKY_MAIN_020348E4_H
