#ifndef PMDSKY_TILESET_H
#define PMDSKY_TILESET_H

#include "enums.h"

struct tileset_property {
    s32 field_0x0;
    u8 field_0x4;
    u8 field_0x5;
    enum type_id camouflage_type;
    u16 nature_power_variant;
    u8 field_0xa;
    // 0xB: True if this is a water tileset. If so, a different kind of shadow will be displayed
    // under monsters in dungeons, drought orbs won't work and Dive can be used anywhere.
    bool8 is_water_tileset;
};

extern struct tileset_property TILESET_PROPERTIES[199];

#endif //PMDSKY_TILESET_H