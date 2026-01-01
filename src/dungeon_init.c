#include "dungeon_init.h"
#include "enums.h"
#include "game_mode.h"
#include "progression.h"
#include "script_variable.h"

extern s8 _022AB4F8;
extern u8 _022AB510;
extern u8 _022AB5A8;
extern struct dungeon_init PENDING_DUNGEON_ID;
extern u8* GUEST_MONSTER_BANETTE;
extern u8* GUEST_MONSTER_SKORUPI;
extern u8* GUEST_MONSTER_BIDOOF;
extern u8* GUEST_MONSTER_SNOVER;
extern u8* GUEST_MONSTER_BIDOOF_2;
extern u8* GUEST_MONSTER_GROVYLE;
extern u8* GUEST_MONSTER_LOUDRED;
extern u8* GUEST_MONSTER_DUSKNOIR;
extern u8* GUEST_MONSTER_GROVYLE_2;
extern u8* GUEST_MONSTER_CHATOT;
extern u8* GUEST_MONSTER_SHINY_CELEBI;
extern u8* GUEST_MONSTER_GROVYLE_3;
extern u8* GUEST_MONSTER_GROVYLE_4;
extern u8* GUEST_MONSTER_CRESSELIA;
extern u8* GUEST_MONSTER_BIDOOF_3;
extern u8* GUEST_MONSTER_BIDOOF_4;
extern u8* GUEST_MONSTER_SHAYMIN_LAND;
extern u8* GUEST_MONSTER_SNOVER_2;

struct unk* sub_0205B77C();
void sub_0205BB7C(void*, s8);
void sub_0205BD14(void*, s8);
extern s32 GetDungeonModeSpecial(s16);
extern s8 IsNoLossPenaltyDungeon(s16);
extern void AddGuestMonster(void*, u8, void*);
extern s8 DungeonSwapIdxToId(s16);

// Appears to be initialising a dungeon for a special case not
// handled by InitDungeonInit
void sub_0204E974(s8 arg0) {
    struct unk* unk0;

    unk0 = sub_0205B77C();
    PENDING_DUNGEON_ID.dungeon_objective = 2;
    PENDING_DUNGEON_ID.field_0xE = -1;
    // Dungeon index 0xD6 maps to dungeon ID 0 in DUNGEON_SWAP_ID_TABLE
    PENDING_DUNGEON_ID.dungeon_idx = 0xD6; 
    PENDING_DUNGEON_ID.field_0x12 = arg0;
    sub_0205BB7C(&_022AB510, arg0);
    sub_0205BD14(&_022AB5A8, arg0);
    PENDING_DUNGEON_ID.has_guest_pokemon = FALSE;
    PENDING_DUNGEON_ID.send_help_item = FALSE;
    PENDING_DUNGEON_ID.field_0x4 = 0;
    PENDING_DUNGEON_ID.show_rescues_left = FALSE;
    PENDING_DUNGEON_ID.nonstory_flag = GetResolvedPerformanceProgressFlag(PERFORMANCE_PROGRESS_FLAG_LEADER_SWITCH_ENABLED);
    PENDING_DUNGEON_ID.recruiting_enabled = FALSE;
    PENDING_DUNGEON_ID.show_potential_recruits = GetResolvedPerformanceProgressFlag(PERFORMANCE_PROGRESS_FLAG_EVOLUTION_ENABLED);
    PENDING_DUNGEON_ID.show_team_name = GetResolvedPerformanceProgressFlag(PERFORMANCE_PROGRESS_FLAG_SHOW_TEAM_NAME);
    PENDING_DUNGEON_ID.send_home_disabled = FALSE;
    PENDING_DUNGEON_ID.hidden_land_flag = FALSE;
    PENDING_DUNGEON_ID.force_disable_recruiting = FALSE;
    PENDING_DUNGEON_ID.skip_faint_animation_flag = FALSE;
    // 0xDA is very close to the size of DUNGEON_SWAP_ID_TABLE, which has 0xDB entries
    if ((u32) (u8) (unk0->unk4 + 0xDA) <= 5) {
        PENDING_DUNGEON_ID.nonstory_flag = FALSE;
        PENDING_DUNGEON_ID.force_disable_recruiting = TRUE;
    }
    _022AB4F8 = 1;
}

void InitDungeonInit(struct dungeon_init* dg_init, s16 dungeon_idx) 
{
    u8 game_mode = GetGameMode();
    dg_init->dungeon_idx = dungeon_idx;
    dg_init->id = DungeonSwapIdxToId(dungeon_idx);
    dg_init->floor = 1;
    dg_init->field_0x12 = -1;
    dg_init->dungeon_game_version_id = GAME_SKY;
    dg_init->dungeon_objective = 0;
    dg_init->field_0xE = -1;
    dg_init->field_0x4 = 0;
    dg_init->has_guest_pokemon = FALSE;
    dg_init->send_help_item = FALSE;
    dg_init->show_rescues_left = FALSE;
    
    if (game_mode != GAME_MODE_NORMAL) {
        dg_init->nonstory_flag = FALSE;
        dg_init->recruiting_enabled = FALSE;
        dg_init->show_potential_recruits = FALSE;
        dg_init->show_team_name = FALSE;
    } else {
        dg_init->nonstory_flag = GetResolvedPerformanceProgressFlag(PERFORMANCE_PROGRESS_FLAG_LEADER_SWITCH_ENABLED);
        dg_init->recruiting_enabled = GetResolvedPerformanceProgressFlag(PERFORMANCE_PROGRESS_FLAG_SHOW_POTENTIAL_RECRUITS);
        dg_init->show_potential_recruits = GetResolvedPerformanceProgressFlag(PERFORMANCE_PROGRESS_FLAG_EVOLUTION_ENABLED);
        dg_init->show_team_name = GetResolvedPerformanceProgressFlag(PERFORMANCE_PROGRESS_FLAG_SHOW_TEAM_NAME);
    }
    
    dg_init->send_home_disabled = FALSE;
    dg_init->hidden_land_flag = FALSE;
    dg_init->force_disable_recruiting = FALSE;
    dg_init->skip_faint_animation_flag = FALSE;

    // Init guest Pokemon
    for(s32 idx = 0; idx < 2; idx++) {
        dg_init->guest_pokemon[idx].is_valid = FALSE;
        dg_init->guest_pokemon[idx].id = 0;
    }

    // Init GAME_MODE_5 specific values
    if (game_mode == GAME_MODE_5) {
        dg_init->nonstory_flag = TRUE;
        dg_init->recruiting_enabled = FALSE;
        dg_init->show_potential_recruits = FALSE;
        dg_init->show_team_name = FALSE;
        dg_init->hidden_land_flag = FALSE;
        dg_init->dungeon_objective = OBJECTIVE_UNK_GAME_MODE_5;
        dg_init->field_0x4 = 0;
        dg_init->show_rescues_left = FALSE;
        switch (dungeon_idx) {
            default:
                break;
            case DUNGEON_HIDDEN_LAND_IDX:
            case DUNGEON_HIDDEN_HIGHLAND_IDX:
            case DUNGEON_OLD_RUINS_IDX:
            case DUNGEON_TEMPORAL_TOWER_IDX:
            case DUNGEON_TEMPORAL_SPIRE_IDX:
            case DUNGEON_TEMPORAL_PINNACLE_IDX:
                dg_init->nonstory_flag = FALSE;
                break;
        }
        return;
    }

    // Init values specific to each dungeon mode
    switch (GetDungeonModeSpecial(dungeon_idx)) {
        case DMODE_OPEN_AND_REQUEST:
            dg_init->dungeon_objective = OBJECTIVE_STORY;
            break;
        case DMODE_OPEN:
            bool8 hidden_land;
            bool8 force_disable_recruiting;
            hidden_land = FALSE;
            force_disable_recruiting = FALSE;
            dg_init->dungeon_objective = OBJECTIVE_STORY;
            dg_init->skip_faint_animation_flag = IsNoLossPenaltyDungeon(dungeon_idx);
            
            switch (dungeon_idx) {
                case DUNGEON_CRAGGY_COAST_IDX:
                    AddGuestMonster(dg_init, 0, &GUEST_MONSTER_BIDOOF);
                    break;
                case DUNGEON_SIDE_PATH_IDX:
                    AddGuestMonster(dg_init, 0, &GUEST_MONSTER_BIDOOF_4);
                    break;
                case DUNGEON_MT_HORN_IDX:
                    AddGuestMonster(dg_init, 0, &GUEST_MONSTER_BIDOOF_3);
                    break;
                case DUNGEON_ROCK_PATH_IDX:
                    AddGuestMonster(dg_init, 0, &GUEST_MONSTER_BIDOOF_2);
                    break;
                case DUNGEON_DUSK_FOREST_IDX:
                    AddGuestMonster(dg_init, 0, &GUEST_MONSTER_GROVYLE);
                    break;
                case DUNGEON_DEEP_DUSK_FOREST_IDX:
                    AddGuestMonster(dg_init, 0, &GUEST_MONSTER_GROVYLE_3);
                    AddGuestMonster(dg_init, 1, &GUEST_MONSTER_SHINY_CELEBI);
                    break;
                case DUNGEON_TREESHROUD_FOREST_IDX:
                    AddGuestMonster(dg_init, 0, &GUEST_MONSTER_GROVYLE_2);
                    break;
                case DUNGEON_BRINE_CAVE_IDX:
                    if (GetResolvedPerformanceProgressFlag(PERFORMANCE_PROGRESS_FLAG_NO_CHATOT_IN_BRINE_CAVE) == 0) {
                        AddGuestMonster(dg_init, 0, &GUEST_MONSTER_CHATOT);
                    }
                    break;
                case DUNGEON_HIDDEN_LAND_IDX:
                case DUNGEON_HIDDEN_HIGHLAND_IDX:
                case DUNGEON_OLD_RUINS_IDX:
                    force_disable_recruiting = TRUE;
                    AddGuestMonster(dg_init, 0, &GUEST_MONSTER_GROVYLE_4);
                    break;
                case DUNGEON_TEMPORAL_TOWER_IDX:
                case DUNGEON_TEMPORAL_SPIRE_IDX:
                case DUNGEON_TEMPORAL_PINNACLE_IDX:
                    hidden_land = TRUE;
                    break;
                case DUNGEON_MT_TRAVAIL_IDX:
                case DUNGEON_THE_NIGHTMARE_IDX:
                case DUNGEON_SPACIAL_RIFT_IDX:
                case DUNGEON_DEEP_SPACIAL_RIFT_IDX:
                case DUNGEON_SPACIAL_RIFT_BOTTOM_IDX:
                    hidden_land = TRUE;
                    break;
                case DUNGEON_DARK_CRATER_IDX:
                case DUNGEON_DEEP_DARK_CRATER_IDX:
                case DUNGEON_DARK_CRATER_PIT_IDX:
                    AddGuestMonster(dg_init, 0, &GUEST_MONSTER_CRESSELIA);
                    hidden_land = TRUE;
                    break;
                case DUNGEON_1ST_STATION_PASS_IDX:
                case DUNGEON_2ND_STATION_PASS_IDX:
                case DUNGEON_3RD_STATION_PASS_IDX:
                case DUNGEON_4TH_STATION_PASS_IDX:
                case DUNGEON_5TH_STATION_PASS_IDX:
                case DUNGEON_6TH_STATION_PASS_IDX:
                case DUNGEON_7TH_STATION_PASS_IDX:
                case DUNGEON_8TH_STATION_PASS_IDX:
                case DUNGEON_9TH_STATION_PASS_IDX:
                case DUNGEON_SKY_PEAK_SUMMIT_PASS_IDX:
                case DUNGEON_5TH_STATION_CLEARING_IDX:
                case DUNGEON_SKY_PEAK_SUMMIT_IDX:
                    AddGuestMonster(dg_init, 0, &GUEST_MONSTER_SHAYMIN_LAND);
                    break;
                case DUNGEON_STAR_CAVE_SE1_IDX:
                    if (LoadScriptVariableValue(NULL, 0x10) == 0) {
                        AddGuestMonster(dg_init, 0, &GUEST_MONSTER_SNOVER_2);
                    }
                    break;
                case DUNGEON_DEEP_STAR_CAVE_IDX:
                    if (LoadScriptVariableValue(NULL, 0x10) == 0) {
                        AddGuestMonster(dg_init, 0, &GUEST_MONSTER_SNOVER);
                    }
                    break;
                case DUNGEON_MURKY_FOREST_IDX:
                    AddGuestMonster(dg_init, 0, &GUEST_MONSTER_BANETTE);
                    AddGuestMonster(dg_init, 1, &GUEST_MONSTER_SKORUPI);
                    break;
                
                case DUNGEON_BARREN_VALLEY_CLEARING_IDX:
                    AddGuestMonster(dg_init, 0, &GUEST_MONSTER_DUSKNOIR);
                    break;
                
                case DUNGEON_SPRING_CAVE_PIT_IDX:
                    AddGuestMonster(dg_init, 0, &GUEST_MONSTER_LOUDRED);
                    break;
            }

            if (hidden_land != FALSE) {
                dg_init->hidden_land_flag = TRUE;
            }
            
            if (force_disable_recruiting != FALSE) {
                dg_init->force_disable_recruiting = TRUE;
            }
            break;
        case DMODE_REQUEST:
            switch (dungeon_idx) {
                default:
                    break;
                case DUNGEON_HIDDEN_LAND_IDX:
                case DUNGEON_HIDDEN_HIGHLAND_IDX:
                case DUNGEON_OLD_RUINS_IDX:
                case DUNGEON_TEMPORAL_TOWER_IDX:
                case DUNGEON_TEMPORAL_SPIRE_IDX:
                case DUNGEON_TEMPORAL_PINNACLE_IDX:
                    dg_init->hidden_land_flag = TRUE;
                    break;
            }
            dg_init->dungeon_objective = OBJECTIVE_NORMAL;
            break;
    }
    dg_init->field_0x4 = 0;
    dg_init->show_rescues_left = FALSE;
}
