#include "enums.h"
#include "options.h"

extern struct options _022AB0A0;

u8 GetDamageTurnOption() {
    return _022AB0A0.damage_turn;
}

u8 GetDPadAttackOption() {
    return _022AB0A0.d_pad_attack;
}

u8 GetCheckDirectionOption() {
    return _022AB0A0.check_direction;
}

bool8 IsMapShownOnEitherScreen() {
    if (_022AB0A0.bottom_screen == BOTTOM_SCREEN_CLEAR_MAP ||
        _022AB0A0.bottom_screen == BOTTOM_SCREEN_SHADED_MAP ||
        _022AB0A0.top_screen == TOP_SCREEN_MAP_AND_TEAM) {
        return TRUE;
    }
    return FALSE;
}

bool8 IsTeamStatsOnTopScreen() {
    if (_022AB0A0.top_screen == TOP_SCREEN_TEAM_STATS) {
        return TRUE;
    }
    return FALSE;
}

bool8 IsTextLogOnTopScreen() {
    if (_022AB0A0.top_screen == TOP_SCREEN_TEXT_LOG) {
        return TRUE;
    } else {
        return FALSE;    
    }
}
