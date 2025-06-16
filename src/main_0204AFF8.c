#include "main_0204AFF8.h"

extern enum game_mode GAME_MODE;

bool8 IsGameModeRescue()
{
    return GAME_MODE == GAME_MODE_RESCUE;
}
