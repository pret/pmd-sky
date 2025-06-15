#ifndef PMDSKY_MAIN_0204AFF8_H
#define PMDSKY_MAIN_0204AFF8_H

#include "util.h"

enum game_mode
{
    GAME_MODE_MENU = 0,            // top menu
    GAME_MODE_1 = 1,               // also related to special episodes? But 3 is the main one
    GAME_MODE_NORMAL = 2,          // normal play, including both overworld/dungeons
    GAME_MODE_SPECIAL_EPISODE = 3, // during special episodes
    // Pelipper Island (and likely also in the dungeon while rescuing, need to confirm)
    GAME_MODE_RESCUE = 4,
    GAME_MODE_5 = 5,
    // Possibly more?
};

bool8 IsGameModeRescue();

#endif //PMDSKY_MAIN_0204AFF8_H
