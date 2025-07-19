#ifndef PMDSKY_SECONDARY_TERRAIN_TYPES_H
#define PMDSKY_SECONDARY_TERRAIN_TYPES_H

// Secondary terrain type for a dungeon
enum secondary_terrain_type {
    SECONDARY_TERRAIN_WATER = 0,
    SECONDARY_TERRAIN_LAVA = 1,
    SECONDARY_TERRAIN_CHASM = 2,
};

extern const enum secondary_terrain_type SECONDARY_TERRAIN_TYPES[200];

#endif //PMDSKY_SECONDARY_TERRAIN_TYPES_H
