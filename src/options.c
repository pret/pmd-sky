#include "enums.h"
#include "options.h"

extern void CopyBitsFrom(u8* ctx, void* dest, u8 nbits);
extern void CopyBitsTo(u8* ctx, void* src, s32 nbits);
extern u8 _0209CE88;
extern u8 _0209CE89;

struct options OPTIONS = {};

void InitOptionsVeneer() {
    InitOptions();
}

void InitOptions() {
    struct options *o = &OPTIONS;
    volatile u8 unused;

    o->touch_screen = TOUCH_SCREEN_USE_ANYWHERE;
    o->top_screen = TOP_SCREEN_CONTROLS;
    o->bottom_screen = BOTTOM_SCREEN_CLEAR_MAP;
    o->grids = 1;
    o->speed = SPEED_REGULAR;
    o->far_off_pals = FAR_OFF_PALS_LOOK;
    o->damage_turn = TRUE;
    o->d_pad_attack = FALSE;
    o->check_direction = FALSE;
    unused = 0;
    o->frame_type = 0;
}

void GetOptions(u8* dest_opts_ptr) {
    u32 idx = 0xA;
    u8* src_opts_ptr = (u8*)&OPTIONS;

    do {
        *dest_opts_ptr = *src_opts_ptr;
        src_opts_ptr += 1;
        idx -= 1;
        dest_opts_ptr += 1;
    } while (idx != 0);
}

void SetOptions(u8* src_options_ptr) {
    u32 idx = 0xA;
    u8* dest_opts_ptr = (u8*)&OPTIONS;

    do {
        *dest_opts_ptr = *src_options_ptr;
        src_options_ptr += 1;
        dest_opts_ptr += 1;
        idx -= 1;
    } while (idx != 0);
}

void SaveOptionsToCtx(u8* ctx) {
    CopyBitsTo(ctx, &OPTIONS.touch_screen, 2);
    CopyBitsTo(ctx, &OPTIONS.top_screen, 3);
    CopyBitsTo(ctx, &OPTIONS.bottom_screen, 2);
    
    u8* src;
    if (OPTIONS.grids) {
        src = &_0209CE88;
    } else {
        src = &_0209CE89;
    }
    CopyBitsTo(ctx, src, 1);

    if (OPTIONS.speed != SPEED_REGULAR) {
        src = &_0209CE88;
    } else {
        src = &_0209CE89;
    }
    CopyBitsTo(ctx, src, 1);

    if (OPTIONS.far_off_pals != FAR_OFF_PALS_SELF) {
        src = &_0209CE88;
    } else {
        src = &_0209CE89;
    }
    CopyBitsTo(ctx, src, 1);

    if (OPTIONS.damage_turn) {
        src = &_0209CE88;
    } else {
        src = &_0209CE89;
    }
    CopyBitsTo(ctx, src, 1);

    if (OPTIONS.d_pad_attack) {
        src = &_0209CE88;
    } else {
        src = &_0209CE89;
    }
    CopyBitsTo(ctx, src, 1);
    
    if (OPTIONS.check_direction) {
        src = &_0209CE88;
    } else {
        src = &_0209CE89;
    }
    CopyBitsTo(ctx, src, 1);
    CopyBitsTo(ctx, &OPTIONS.frame_type, 3);
}

void LoadOptionsFromCtx(u8* ctx) {
    u8 dest;

    CopyBitsFrom(ctx, &dest, 2U);
    OPTIONS.touch_screen = dest & 3;

    CopyBitsFrom(ctx, &dest, 3);
    OPTIONS.top_screen = dest & 7;

    CopyBitsFrom(ctx, &dest, 2);
    OPTIONS.bottom_screen = dest & 3;

    CopyBitsFrom(ctx, &dest, 1);
    OPTIONS.grids = (dest & 1) != FALSE;

    CopyBitsFrom(ctx, &dest, 1);
    OPTIONS.speed = (dest & 1) != FALSE;

    CopyBitsFrom(ctx, &dest, 1);
    OPTIONS.far_off_pals = (dest & 1) != FALSE;

    CopyBitsFrom(ctx, &dest, 1);
    OPTIONS.damage_turn = (dest & 1) != FALSE;

    CopyBitsFrom(ctx, &dest, 1);
    OPTIONS.d_pad_attack = (dest & 1) != FALSE;

    CopyBitsFrom(ctx, &dest, 1);
    OPTIONS.check_direction = (dest & 1) != FALSE;

    CopyBitsFrom(ctx, &dest, 3);
    OPTIONS.frame_type = dest & 7;
}


bool8 IsTouchScreenNotOff() {
    if (OPTIONS.touch_screen >= TOUCH_SCREEN_MENU_ONLY) {
        return TRUE;
    }
    return FALSE;
}

bool8 IsTouchScreenUseAnywhere() {
    if (OPTIONS.touch_screen >= TOUCH_SCREEN_USE_ANYWHERE) {
        return TRUE;
    }
    return FALSE;
}

u8 GetTopScreenOption() {
    return OPTIONS.top_screen;
}

void SetTopScreenOption(u8 new_ts) {
    OPTIONS.top_screen = new_ts;
}

u8 GetBottomScreenOption() {
    return OPTIONS.bottom_screen;
}

bool8 GetGridsOption() {
    return OPTIONS.grids;
}

bool8 GetSpeedOption() {
    return OPTIONS.speed;
}

bool8 GetFarOffPalsOption() {
    return OPTIONS.far_off_pals;
}

bool8 GetDamageTurnOption() {
    return OPTIONS.damage_turn;
}

bool8 GetDPadAttackOption() {
    return OPTIONS.d_pad_attack;
}

bool8 GetCheckDirectionOption() {
    return OPTIONS.check_direction;
}

bool8 IsMapShownOnEitherScreen() {
    if (OPTIONS.bottom_screen == BOTTOM_SCREEN_CLEAR_MAP ||
        OPTIONS.bottom_screen == BOTTOM_SCREEN_SHADED_MAP ||
        OPTIONS.top_screen == TOP_SCREEN_MAP_AND_TEAM) {
        return TRUE;
    }
    return FALSE;
}

bool8 IsTeamStatsOnTopScreen() {
    if (OPTIONS.top_screen == TOP_SCREEN_TEAM_STATS) {
        return TRUE;
    }
    return FALSE;
}

bool8 IsTextLogOnTopScreen() {
    if (OPTIONS.top_screen == TOP_SCREEN_TEXT_LOG) {
        return TRUE;
    } else {
        return FALSE;    
    }
}

void CopyFrameTypeOption(u8* dst) {
    *dst = OPTIONS.frame_type;
}

void SetFrameTypeOption(u8* new_ft) {
    OPTIONS.frame_type = *new_ft;
}
