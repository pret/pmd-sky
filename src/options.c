#include "enums.h"
#include "options.h"

extern struct options _022AB0A0;

bool8 IsTouchScreenNotOff() {
    if (_022AB0A0.touch_screen >= TOUCH_SCREEN_MENU_ONLY) {
        return TRUE;
    }
    return FALSE;
}

bool8 IsTouchScreenUseAnywhere() {
    if (_022AB0A0.touch_screen >= TOUCH_SCREEN_USE_ANYWHERE) {
        return TRUE;
    }
    return FALSE;
}

u8 GetTopScreenOption() {
    return _022AB0A0.top_screen;
}

void SetTopScreenOption(u8 new_ts) {
    _022AB0A0.top_screen = new_ts;
}

u8 GetBottomScreenOption() {
    return _022AB0A0.bottom_screen;
}

u8 GetGridsOption() {
    return _022AB0A0.grids;
}

u8 GetSpeedOption() {
    return _022AB0A0.speed;
}

u8 GetFarOffPalsOption() {
    return _022AB0A0.far_off_pals;
}

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

void CopyFrameTypeOption(u8* dst) {
    *dst = _022AB0A0.frame_type;
}

void SetFrameTypeOption(u8* new_ft) {
    _022AB0A0.frame_type = *new_ft;
}
