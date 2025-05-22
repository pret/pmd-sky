#ifndef PMDSKY_MONSTER_DATA_TABLE_PTR_H
#define PMDSKY_MONSTER_DATA_TABLE_PTR_H

#include "enums.h"

struct monster_data {
    u8 fill0[0x16];
    enum mobility_type mobility_type;
    u8 fill17[0x3];
    u8 can_throw_items;
    u8 fill1B[0x29];
};

struct monster_data_table {
    struct monster_data entries[MONSTER_RESERVE_45 + 1];
};

#endif //PMDSKY_MONSTER_DATA_TABLE_PTR_H
