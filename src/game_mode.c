#include "game_mode.h"
#include "enums.h"

extern enum game_mode GAME_MODE;

enum game_mode GetGameMode() {
    return GAME_MODE;
}

u8 sub_0204AFD0() {
    if ((u8)(GAME_MODE + 0xFE) <= 1) {
        return TRUE;
    } else {
        return FALSE;
    }
}

bool8 IsGameModeRescue()
{
    return GAME_MODE == GAME_MODE_RESCUE;
}

void SetGameMode(enum game_mode new_game_mode) {
    GAME_MODE = new_game_mode;
}
