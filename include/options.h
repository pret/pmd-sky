#ifndef PMDSKY_OPTIONS
#define PMDSKY_OPTIONS

#include "util.h"

// See enums for values
struct options {
    u8 touch_screen;
    u8 bottom_screen;
    u8 top_screen;
    u8 unk0;
    u8 speed;
    u8 far_off_pals;
    u8 damage_turn;
    u8 d_pad_attack;
    u8 check_direction;
    u8 unk1;
};

u8 GetDamageTurnOption();
u8 GetDPadAttackOption();
u8 GetCheckDirectionOption();
bool8 IsMapShownOnEitherScreen();
bool8 IsTeamStatsOnTopScreen();
bool8 IsTextLogOnTopScreen();

#endif //PMDSKY_OPTIONS
