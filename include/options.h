#ifndef PMDSKY_OPTIONS
#define PMDSKY_OPTIONS

#include "util.h"

// See enums for values
struct options {
    u8 touch_screen;
    u8 bottom_screen;
    u8 top_screen;
    bool8 grids;
    u8 speed;
    u8 far_off_pals;
    bool8 damage_turn;
    bool8 d_pad_attack;
    bool8 check_direction;
    u8 frame_type;
};

void InitOptionsVeneer();
void InitOptions();
void GetOptions(u8* dest_opts_ptr);
void SetOptions(u8* src_options_ptr);
void SaveOptionsToCtx(u8* ctx);
void LoadOptionsFromCtx(u8* ctx);
bool8 IsTouchScreenNotOff();
bool8 IsTouchScreenUseAnywhere();
u8 GetTopScreenOption();
void SetTopScreenOption(u8 new_ts);
u8 GetBottomScreenOption();
bool8 GetGridsOption();
bool8 GetSpeedOption();
bool8 GetFarOffPalsOption();
bool8 GetDamageTurnOption();
bool8 GetDPadAttackOption();
bool8 GetCheckDirectionOption();
bool8 IsMapShownOnEitherScreen();
bool8 IsTeamStatsOnTopScreen();
bool8 IsTextLogOnTopScreen();
void CopyFrameTypeOption(u8* dst);
void SetFrameTypeOption(u8* new_ft);

#endif //PMDSKY_OPTIONS
