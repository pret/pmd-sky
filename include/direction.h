#ifndef PMDSKY_DIRECTION_H
#define PMDSKY_DIRECTION_H

// Direction on the dungeon grid
enum direction_id {
    DIR_NONE = -1,
    DIR_DOWN = 0,
    DIR_DOWN_RIGHT = 1,
    DIR_RIGHT = 2,
    DIR_UP_RIGHT = 3,
    DIR_UP = 4,
    DIR_UP_LEFT = 5,
    DIR_LEFT = 6,
    DIR_DOWN_LEFT = 7,
    DIR_CURRENT = 8, // Current direction of an entity. Used as a special value in some functions
};

#define DIRECTION_MASK 7
#define NUM_DIRECTIONS 8

#endif //PMDSKY_DIRECTION_H