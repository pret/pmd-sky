#ifndef PREPROCESS_STRING_H
#define PREPROCESS_STRING_H

struct PPStrValues {
    u8* weather_0;  // 0x0
    u32 field_0x4;
    u32 field_0x8;
    u32 field_0xB;
    u8* dungeon_0;  // 0xC
    u32 field_0x10;
    u32 field_0x14;
    u32 field_0x18;
    u32 field_0x1c;
    union {         // 0x20
        u32 digits_0;
        u32 value_0;
        u32 time_0;
        u32 gold_left_0;
    };
    union {         // 0x24
        u32 digits_1;
        u32 value_1;
    };
    u32 field_0x28;
    u32 field_0x2c;
    u32 field_0x30;
    u8* string0;    // 0x34
    u32 field_0x38;
    u32 field_0x3c;
    u32 field_0x40;
    u32 field_0x44;
    u32 field_0x48;
};

#endif
