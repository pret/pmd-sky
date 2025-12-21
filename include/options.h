#ifndef PMDSKY_OPTIONS
#define PMDSKY_OPTIONS

#include "util.h"

// See enums for values
struct options {
    u8 touch_screen;
    u8 bottom_screen;
    u8 top_screen;
    u8 grids;
    u8 speed;
    u8 far_off_pals;
    u8 damage_turn;
    u8 d_pad_attack;
    u8 check_direction;
    u8 frame_type;
};

bool8 IsTouchScreenNotOff();
bool8 IsTouchScreenUseAnywhere();
u8 GetTopScreenOption();
void SetTopScreenOption(u8 new_ts);
u8 GetBottomScreenOption();
u8 GetGridsOption();
u8 GetSpeedOption();
u8 GetFarOffPalsOption();
u8 GetDamageTurnOption();
u8 GetDPadAttackOption();
u8 GetCheckDirectionOption();
bool8 IsMapShownOnEitherScreen();
bool8 IsTeamStatsOnTopScreen();
bool8 IsTextLogOnTopScreen();
void CopyFrameTypeOption(u8* dst);
void SetFrameTypeOption(u8* new_ft);

#endif //PMDSKY_OPTIONS
