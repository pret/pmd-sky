#include "dg.h"
#include "spawn_1.h"
#include "options.h"
#include "overlay_29_023383A8.h"
#include "dungeon_util_static.h"
#include "spawn_2.h"
#include "enums.h"
#include "overlay_29_02344088.h"
#include "debug.h"
#include "overlay_29_023047B8.h"
#include "dg_random.h"
#include "overlay_29_022EAC34.h"
#include "overlay_29_023026CC.h"
#include "overlay_29_022E869C.h"
#include "overlay_29_022EA968.h"
#include "weather.h"
#include "overlay_29_022EA9CC.h"
#include "overlay_29_022ED01C.h"
#include "overlay_29_02338850.h"
#include "dg_uty.h"
#include "main_0204D188.h"
#include "dungeon_recruitment_2.h"
#include "main_0204FB9C.h"
#include "dg_random.h"
#include "run_dungeon_1.h"
#include "overlay_29_022ECF44.h"
#include "overlay_29_022EC7E8.h"
#include "fixed_room_data.h"
#include "main_0200330C.h"
#include "number_util.h"
#include "main_0200224C.h"
#include "overlay_29_0233836C.h"
#include "common.h"
#include "dg_object.h"
#include "overlay_29_0234B024.h"
#include "overlay_29_0233A218.h"
#include "overlay_29_022EAEFC.h"
#include "overlay_29_022EFA6C.h"
#include "overlay_29_02338560.h"
#include "overlay_29_022E9FC0.h"
#include "overlay_29_02338604.h"
#include "overlay_29_02338548.h"
#include "overlay_29_02336F4C.h"
#include "overlay_29_0234BA54.h"
#include "overlay_10_022BFD58.h"
#include "overlay_29_022DEAB0.h"
#include "overlay_29_022DEAB0.h"
#include "dg_camera.h"
#include "overlay_29_022E563C.h"
#include "overlay_29_022E869C.h"
#include "overlay_29_022E9FC0.h"
#include "overlay_29_0230558C.h"
#include "special_move_types.h"
#include "overlay_29_023350D8.h"
#include "overlay_29_0234396C.h"
#include "overlay_29_0234AFFC.h"
#include "overlay_29_0234B104.h"
#include "main_0205B77C.h"

extern void SpawnTraps(void);
extern void LoadMonsterSprites(void);
extern void LoadActiveMonsterSprites(void);
extern void TryActivateNewFloorPpRestoration(bool8 param_1);
extern void TryActivateNewFloorHpRestoration(bool8 param_1);
extern void TryActivateAcuteSniffer(bool8 param_1);
extern void ChangeGiratinaFormIfSkyDungeon(enum dungeon_id dungeon_id);
extern void ClearHiddenStairs(void);
extern void CountItemsOnFloorForAcuteSniffer(void);
extern void CreateMonsterSummaryFromEntityOuter(s32 reason, struct entity *source, struct entity *target, const u8 *name);
extern void DeleteAllMonsterSpriteFiles(void);
extern void DetermineAllTilesWalkableNeighbors(void);
extern void DisplayFloorCard(int duration);
extern bool8 DisplayFloorTip(void);
extern void DisplayMessage(void* param_1, int param_2, bool8 param_3);
extern void DisplayMessage2(void* param_1, int param_2, bool8 param_3);
extern void FadeToBlack(void);
extern void FreeAlertBoxInfo(void);
extern void FreeLoadedAttackSpriteAndMore(void);
extern void GenerateFloor(void);
extern void *GetBgRegionArea(u32 offset, u32 subregion, u32 region);
extern u32 GetFloorType(void);
extern void HandleShopTransaction(s32 param_1);
extern void InitAlertBoxInfo(void);
extern void InitEnemySpawnStats(void);
extern bool8 IsSecretBazaarVeneer(void);
extern void LoadMappaFileAttributes(s32 param_1, bool8 param_2, void (*param_3)(u8));
extern void LoadWeather3DFiles(void);
extern void OpenFixedBin(void);
extern u16 ReadMissionMtStateLower(void);
extern void ReevaluateSnatchMonster(void);
extern void RefillTeam(void);
extern void RunFractionalTurn(bool8 is_first_loop);
extern void SetBaseStatsMovesGroundMonster(struct ground_monster* ground_monster);
extern void SetBothScreensWindowColorToDefault(void);
extern void SpawnInitialMonsters(void);
extern void SpawnShopkeepers(void);
extern void SpawnTeam(u8 param_1);
extern void StartFadeDungeonWrapper(s32 param_1, s32 param_2, s32 param_3);
extern void TryActivateArtificialWeatherAbilities(void);
extern void TryActivateSlowStart(void);
extern void TryActivateStairSensor(bool8 param_1);
extern bool8 TryActivateWeather(bool8 param_1, bool8 param_2);
extern bool8 TryForcedLoss(bool8 param_1);
extern void TryInflictBurnStatusWholeTeam(void);
extern void UpdateMinimap(void);
extern void WaitUntilAlertBoxTextIsLoaded(u32 param_1);
extern void WaitUntilFadeIsFinished(s32 param_1);
extern void WriteMissionMtState(u32 value);
extern void ov10_022BDAB0(u32 param_1, u32 param_2, s16 param_3);
extern void ov10_022BDB54(u8 param_1);
extern void ov10_022BDB60(void *param_1, void *param_2, void *param_3, u32 param_4);
extern void ov10_022BDB80(u32 param_1, u16 param_2);
extern void ov10_022BDBA4(u32 param_1, u16 param_2);
extern void ov10_022BDBB0(u8 param_1);
extern void ov10_022BDC0C(void);
extern void ov29_022DD5B4(void);
extern void ov29_022DD7AC(void);
extern void ov29_022DDE00(s32 param_1);
extern void ov29_022DE15C(void);
extern void ov29_022DE4FC(void);
extern void ov29_022DE904(void);
extern void ov29_022DE930(void);
extern void ov29_022DEA34(void);
extern void ov29_022E0434(void);
extern void ov29_022E081C(void);
extern void ov29_022E0DFC(void);
extern void ov29_022E0E44(void);
extern void ov29_022E0F6C(void);
extern void ov29_022E12F8(void);
extern void ov29_022E1304(void);
extern void ov29_022E1550(void);
extern void ov29_022E15C8(void);
extern void ov29_022E1604(void);
extern void ov29_022E1640(void);
extern void ov29_022E2B68(bool8 param_1);
extern void ov29_022E2DFC(struct entity *entity);
extern void ov29_022E3A58(bool8 param_1);
extern void ov29_022E6E40(void);
extern void ov29_022E6F94(void);
extern void ov29_022E8708(void);
extern void ov29_022E8BFC(bool8 value);
extern void ov29_022E9F18(void);
extern void ov29_022EAD68(void);
extern void ov29_022EAEAC(s32 param_1);
extern void ov29_022EAF48(u16 param_1, bool8 param_2);
extern bool8 ov29_022ECF78(void);
extern void ov29_022ECFB8(struct unk_dungeon_init *summary);
extern void ov29_022ED030(void);
extern void ov29_022ED0B0(void);
extern void ov29_022EF738(void);
extern void ov29_022EF8A4(void);
extern void ov29_022EF9B8(void);
extern void ov29_022F6E40(void);
extern void ov29_022F6EF4(void);
extern void ov29_022F7104(void);
extern bool8 ov29_022F7910(struct ground_monster *guest);
extern void ov29_022F7BF4(struct ground_monster *guest);
extern void ov29_022F7E34(void);
extern void ov29_022F7EAC(void);
extern void ov29_022FA2F0(bool8 param_1, bool8 param_2, bool8 param_3);
extern void ov29_022FA418(void);
extern void ov29_022FA524(void);
extern void ov29_022FA648(void);
extern void ov29_022FA750(void);
extern void ov29_022FBB1C(void);
extern void ov29_022FC9C0(void);
extern void ov29_022FCD04(void);
extern void ov29_022FDFA4(void);
extern void ov29_022FE2E4(void);
extern void ov29_022FE4A8(void);
extern void ov29_0231B39C(void *param_1);
extern void ov29_0231B460(void);
extern void ov29_02334D58(void);
extern void ov29_02334DA8(enum weather_id weather);
extern void ov29_02335044(bool8 value);
extern void ov29_023359F8(bool8 value);
extern void ov29_023362EC(void);
extern void ov29_02336460(void);
extern void ov29_023365B8(void);
extern void ov29_023365E8(void);
extern void ov29_0233665C(void);
extern void ov29_023369F8(void);
extern void ov29_0233781C(void);
extern void ov29_0233785C(void);
extern void ov29_0233873C(void);
extern void ov29_023389C4(s16 tileset);
extern void ov29_02338A4C(enum weather_id weather);
extern void ov29_02338D30(void);
extern void ov29_02338F10(void);
extern void ov29_02338F38(bool8 value);
extern void ov29_02338F48(bool8 value);
extern void ov29_02338F68(void);
extern void ov29_02338FC8(void);
extern void ov29_0233904C(bool8 quick_saved);
extern void ov29_02339F88(bool8 value);
extern void ov29_02339FD0(bool8 value);
extern void ov29_0233A0E8(s32 param_1, s32 param_2);
extern void ov29_0233A15C(bool8 value);
extern void ov29_0233A1BC(s32 param_1);
extern void ov29_0233A248(s32 param_1);
extern void ov29_02344C4C(void);
extern bool8 ov29_02345D84(struct entity *unused, struct entity *item_entity, void *info, const struct position *offset);
extern void ov29_023469E0(u32 param_1);
extern void ov29_02346A64(void);
extern void ov29_02346DA4(void);
extern void ov29_02346E48(void);
extern void ov29_023480FC(void);
extern void ov29_02348850(void);
extern void ov29_02348894(void);
extern void ov29_023488C8(void);
extern void ov29_02348918(void);
extern void ov29_02348994(void);
extern bool8 ov29_02349C84(void);
extern void ov29_0234B4CC(bool8 val);
extern void ov29_0234C584(s32 screen);
extern void ov29_0234C5EC(s32 screen);
extern void ov29_0234C654(s32);
extern void ov29_0234CA84(void);
extern void ov29_0234CB34(void);
extern void ov29_0234CB54(void);
extern s32 sub_02001808(void);
extern void sub_02009194(s32, s32);
extern void sub_020091B0(s32, s32);
extern u16 sub_02017B00(void);
extern bool8 sub_0204F1B4(s8 *result);
extern void *sub_02051DFC(u32, u32);
extern void *sub_02051ED4(u32);
extern void sub_02057E90(void);
extern void sub_02057EF4(void);
extern void sub_02058644(s32 dungeon_id);
extern void ov29_022DEBBC(u8);

extern const u8 ov29_023510C8[];
// Declared as volatile to make matching easier
extern struct dungeon *volatile DUNGEON_PTR[];
extern struct entity *LEADER_PTR;
extern u8 ov29_02353563;
#define NUM_DIRECTIONS 8
extern const struct position DIRECTIONS_XY[NUM_DIRECTIONS];
extern const s16 DEOXYS_FORMS[4];

#ifdef JAPAN
#define RUN_DUNGEON_DATA_OFFSET -0x2EF
#else
#define RUN_DUNGEON_DATA_OFFSET 0
#endif

s32 RunDungeon(struct dungeon_init *dungeon_init_data, struct dungeon *dungeon)
{
    // Use a struct here because it would not match otherwise
    struct { u8 value; } some_flag_storage;
    u8 init_field_0x4;
    u8 some_bool;
    bool8 guest_init_failure_flag;
    s8 field_0xE;
    bool8 show_rescues_left;
    bool8 has_guest_pokemon;
    bool8 send_help_item;

    some_flag_storage.value = 0;
    guest_init_failure_flag = some_flag_storage.value;
    init_field_0x4 = dungeon_init_data->field_0x4;
    field_0xE = dungeon_init_data->field_0xE;
    show_rescues_left = dungeon_init_data->show_rescues_left;
    has_guest_pokemon = dungeon_init_data->has_guest_pokemon;
    send_help_item = dungeon_init_data->send_help_item;

    some_bool = (init_field_0x4 == 0);

    if (field_0xE == 1)
    {
        // A function that uses the screen as inputs
        // Could be something like fading dungeon from white or the other way around?
        ov29_0234C5EC(0);
        // This flag determines which StartFadeDungeonWrapper mode to use.
        // otherwise skips this and then calls the StartFadeDungeonWrapper normally for input 1
        some_flag_storage.value = 1;
    }
    else
    {
        // Again a function that has to do with one of the DS screens as input, this time with opposite brightness
        // Could be something like fading dungeon from black
        ov29_0234C584(0);
    }

    ov29_0234C584(1);  // Now the same fading dungeon function with screen 1
    ov29_022DDE00(2);
    // The string in ov29_023510C8 is "DG_VRAM_SPRITE_NAME:%d\n" so this would be "DG_VRAM_SPRITE_NAME:992\n"
    Debug_Print0(ov29_023510C8, 0x3E0);

    DUNGEON_PTR[0] = dungeon;

    dungeon->id = (enum dungeon_id)dungeon_init_data->id;
    dungeon->floor = dungeon_init_data->floor;  // floor = 0x749 of dungeon and 0x1 of dungeon_init

    // This could mean that the field_0x4 signals some missing initialization
    if (init_field_0x4 == 0)
    {
        DUNGEON_PTR[0]->dungeon_objective = (enum dungeon_objective)dungeon_init_data->dungeon_objective;
        dungeon_location_seed init_rescue_location_seed = dungeon_init_data->rescue_location_seed;
        DUNGEON_PTR[0]->rescue_location_seed = init_rescue_location_seed;

        s32 turn_limit = GetTurnLimit((enum dungeon_id)dungeon_init_data->id);

        DUNGEON_PTR[0]->wind_turns = turn_limit;
        DUNGEON_PTR[0]->turn_limit_warning_tracker = 0;

        s8 max_rescue_attempts = GetMaxRescueAttempts((enum dungeon_id)dungeon_init_data->id);
        DUNGEON_PTR[0]->rescue_attempts_left = max_rescue_attempts;

        DUNGEON_PTR[0]->dungeon_game_version_id = dungeon_init_data->dungeon_game_version_id;
        DUNGEON_PTR[0]->nonstory_flag = dungeon_init_data->nonstory_flag;
        DUNGEON_PTR[0]->field_0x75a = dungeon_init_data->show_potential_recruits;
        DUNGEON_PTR[0]->recruiting_enabled = dungeon_init_data->recruiting_enabled;
        DUNGEON_PTR[0]->bag_enabled = dungeon_init_data->show_team_name;
        DUNGEON_PTR[0]->send_home_disabled = dungeon_init_data->send_home_disabled;
        DUNGEON_PTR[0]->hidden_land_flag = dungeon_init_data->hidden_land_flag;
        DUNGEON_PTR[0]->skip_faint_animation_flag = dungeon_init_data->skip_faint_animation_flag;
        DUNGEON_PTR[0]->dungeon_idx = dungeon_init_data->dungeon_idx;

        if (dungeon_init_data->force_disable_recruiting)
        {
            DUNGEON_PTR[0]->recruiting_enabled = FALSE;
        }
    }

    DUNGEON_PTR[0]->leader_standing_in_kecleon_shop = FALSE;
    DUNGEON_PTR[0]->standing_in_kecleon_shop = FALSE;
    DUNGEON_PTR[0]->bag_enabled = TRUE;

    ov29_022DE904();
    ov29_022F6E40();
    ov29_022ED030();
    LoadWeather3DFiles();
    ov29_02338F10();
    u16 music_id = sub_02017B00();
    ov29_022EAF48(music_id, init_field_0x4);
    AllocTopScreenStatus();
    ov29_022E6F94();
    ov29_022E1640();  // some entity initialization
    ov29_023362EC();  // initialization of dungeon tile grid map state
    OpenFixedBin();
    ov29_022E9F18();
    ov29_02338F68();  // load minimap resources
    ov29_02338F38(FALSE);
    ov29_022E2B68(TRUE);
    InitAlertBoxInfo();
    ov29_0234BB10();
    DungeonRngUnsetSecondary();
    DUNGEON_PTR[0]->prng_preseed = GetDungeonRngPreseed();
    ov10_022BDAB0(0x200, 0x340, 0);
    ov10_022BDB54(0);
    void *unk0 = sub_02051ED4(0);
    void *unk1 = sub_02051DFC(0, 0);

    void *unk2 = GetBgRegionArea(0, 0, 0);
    ov10_022BDB60(unk2, unk1, unk0, 0);

    void *unk3 = sub_02051ED4(1);
    void *unk4 = sub_02051DFC(0, 1);

    void *unk5 = GetBgRegionArea(0, 0, 1);
    ov10_022BDB60(unk5, unk4, unk3, 1);

    // Now a bunch of function calls, probably some graphics initialization
    ov10_022BDB80(0xb000, 0xb);
    ov10_022BDBA4(0x2000, 0xa);
    ov29_022E0F6C();
    ov29_022E8104();
    ov29_022E7F7C();
    ov29_022E1304();
    ov29_022E6E40();
    ov29_022FE4A8();
    ov29_023480FC();
    ov29_022DDE00(2);

    if (dungeon_init_data->field_0xE != 1)
    {
        ov29_022DEADC();
    }

    if (init_field_0x4 != 0)
    {
        ov29_0234CB34();
        ov29_0234CB54();
        ov29_023365E8();
#ifndef JAPAN
	    ov29_02348850();
#endif
    }

    if (show_rescues_left)
    {
        ov29_022E0434();  // Probably show message how many rescues left
    }

    if (init_field_0x4 == 0)
    {
        // The field_0x4 seems to only be set in floors that aren't naturally dark
        dungeon->display_data.luminous = TRUE;
        dungeon->display_data.natural_lighting = TRUE;

        ov29_0231B39C(&DUNGEON_PTR[0]->field_0x7d0);

        // We have to use this ugly cast to signed integer
        // -> enum probably contained negative values or was signed byte
        if (*(s8 *)&dungeon->dungeon_objective == OBJECTIVE_RESCUE)
        {
            // Id gets overwritten here which triggers some decisions
            dungeon->id = dungeon_init_data->rescue_location_seed.dungeon_id;
            dungeon->floor = 1;
        }

        ChangeGiratinaFormIfSkyDungeon(dungeon->id);
        ov29_022E081C();

        if (*(s8 *)&dungeon->dungeon_objective == OBJECTIVE_RESCUE)
        {
            dungeon->rescue_prng_preseed_23_bit = dungeon_init_data->rescue_location_seed.prng_preseed_23_bit;
        }
        else
        {
            // Combine the lower half of the persistent Mt RNG state and a random 16 bit number as seed
            // to initiate the new Mt state
            u32 mission_mt_low = ReadMissionMtStateLower();
            u32 seed = Rand16Bit() | (mission_mt_low << 16);
            MtInit(seed);
            // Use the initialized Mt to generate the prng preseed for rescue
            u32 value = MtNext();
            value &= 0x00FFFFFF;  // We only need 23 bit (24 bit result here)
            dungeon->rescue_prng_preseed_23_bit = value;
            WriteMissionMtState(value);
        }

        SetDungeonRngPreseed23Bit(dungeon->rescue_prng_preseed_23_bit);
    }
    else
    {
        SetDungeonRngPreseed(dungeon->prng_preseed);
    }

    if (show_rescues_left)
    {
        SetMessageLogPreprocessorArgsNumberVal(0, dungeon->rescue_attempts_left);
        if (dungeon->rescue_attempts_left != 0)
        {
            DisplayMessage2(0, 0xB6B + RUN_DUNGEON_DATA_OFFSET, 1);
        }
        else
        {
            DisplayMessage2(0, 0xB6C + RUN_DUNGEON_DATA_OFFSET, 1);
        }
    }

    if (has_guest_pokemon)
    {
        struct ground_monster *guest_pokemon_ptr = &dungeon_init_data->guest_pokemon[0];
        if (guest_pokemon_ptr->joined_at == 0xfa)
        {
            if (IsLevelResetDungeon(dungeon->id))
            {
               SetBaseStatsMovesGroundMonster(guest_pokemon_ptr);
            }

            if (ov29_022F7910(guest_pokemon_ptr) == FALSE)
            {
                guest_init_failure_flag = 1;
            }

        }
        else
        {
            for (s16 i = 0; i < 2; ++i)
            {
                if (IsLevelResetDungeon(dungeon->id))
                {
                    SetBaseStatsMovesGroundMonster(&dungeon_init_data->guest_pokemon[i]);
                }

                ov29_022F7BF4(&dungeon_init_data->guest_pokemon[i]);
            }
        }

        if (init_field_0x4 != 0)
        {
            ov29_022FC9C0();
        }
    }

    s8 loc_10;

    if (init_field_0x4 == 0 &&
        *(s8 *)&dungeon->dungeon_objective == OBJECTIVE_RESCUE &&  // OBJECTIVE_RESCUE = 2
        sub_0204F1B4(&loc_10))
    {
        s8 value = *(s8 *)(sub_0205B77C(loc_10) + 0xAC);

        if (value != 0)
        {
            SetMessageLogPreprocessorArgsNumberVal(0, value + 1);
            DisplayMessage2(0, 0xB6D + RUN_DUNGEON_DATA_OFFSET, 1);
        }
        else
        {
            DisplayMessage2(0, 0xB6E + RUN_DUNGEON_DATA_OFFSET, 1);
        }
    }

    if (dungeon_init_data->field_0xE != 1)
    {
        ov29_022DEB40();  // Again some dungeon fading
    }

    // Use a loop for each floor, we assume the start here since a jump is used to this position
    // later. The loop encompasses a large block and only finishes at a common end jump position
    while (TRUE)
    {
        ov29_022DDE00(2);
        ov10_022BDBB0(0);
        ov29_022F6EF4();
        ov29_022E8104();
        ov29_022E7F7C();
        InitMessageLogPreprocessorArgs();
        ov29_0234BB2C();
        ov29_022DE4FC();

        if (init_field_0x4 == 0)
        {
            ov29_022DEA34();
            ov29_022E1640();
        }

        LEADER_PTR = NULL;
        enum hidden_stairs_type stairs_type = GetHiddenFloorField();
        SetBothScreensWindowColorToDefault();

        DUNGEON_PTR[0]->field_0x4 = 0;
        DUNGEON_PTR[0]->spawn_entries_copied = FALSE;

        if (init_field_0x4 == 0)
        {
            DUNGEON_PTR[0]->next_spawn_genid = 10;
            if (GetHiddenFloorField() == HIDDEN_STAIRS_NONE)
            {
                u32 rng_seed = GenerateDungeonRngSeed();
                u32 rng_preseed = GetDungeonRngPreseed();

                DUNGEON_PTR[0]->prng_preseed = rng_preseed;
                DUNGEON_PTR[0]->prng_seed = rng_seed;
                InitDungeonRng(DUNGEON_PTR[0]->prng_seed);
            }
        }

        if (init_field_0x4 == 0)
        {
            DUNGEON_PTR[0]->decoy_is_active = FALSE;
            u32 rand_index = DungeonRandInt(4);
            DUNGEON_PTR[0]->deoxys_floor_id = (enum monster_id)DEOXYS_FORMS[rand_index];
            DUNGEON_PTR[0]->mew_cannot_spawn = FALSE;
            DUNGEON_PTR[0]->field_0x78a = 0;
        }

        bool8 hidden_stairs_exist = stairs_type != HIDDEN_STAIRS_NONE;

        LoadMappaFileAttributes(init_field_0x4, hidden_stairs_exist, ov29_022DEBBC);
        ov29_0234B4CC(0);
        ov29_0234BB38();

        if (init_field_0x4 == 0)
        {
            ov29_02334DA8(WEATHER_CLEAR);
        }

        ov29_023389C4(DUNGEON_PTR[0]->gen_info.tileset_id);

        ov29_02338A4C(DUNGEON_PTR[0]->weather.weather);
        ov29_022E8708();
        ov29_022DD5B4();
        ov29_023369F8();
        CopySpawnEntriesOnce();
        LoadMonsterSprites();

        if (init_field_0x4 == 0)
        {
            ov29_0231B460();
            ov29_022F7104();
        }
        else
        {
            LoadActiveMonsterSprites();
            ov29_022FBB1C();
        }

        ov29_022FE2E4();
        InitEnemySpawnStats();

        if (init_field_0x4 == 0)
        {
            ov29_022EAD68();
            ov29_022EF738();
        }

        ov29_023365E8();
        ov29_022E1550();
        ov29_02338F38(0);
        UnkMapRelatedFunc(4, 0);
        ov29_0234B1A4(0);
        ov29_022E2B68(init_field_0x4);

        if (IsRoomIlluminated(DUNGEON_PTR[0]->gen_info.fixed_room_id))
        {

            dungeon->display_data.luminous = TRUE;
            dungeon->display_data.natural_lighting = TRUE;
        }

        IsSecretBazaarVeneer();  // This result is never used??

        if (IsBossFight(DUNGEON_PTR[0]->gen_info.fixed_room_id) == FALSE)
        {
            DisplayFloorCard(0x3c);
        }

        ov29_022E12F8();

        if (init_field_0x4 == 0)
        {
            ResetVictoryCounter();
            GenerateFloor();
            s32 turn_limit = GetTurnLimit(dungeon->id);
            dungeon->wind_turns = turn_limit;
            dungeon->turn_limit_warning_tracker = 0;
        }

        ov29_0233785C();
        DetermineAllTilesWalkableNeighbors();
        ov29_02336460();

        if (init_field_0x4 == 0)
        {
            SpawnTeam(some_bool);
            some_bool = FALSE;
            SpawnShopkeepers();
            SpawnInitialMonsters();
            ResetGravity();
        }
        else
        {

            if (DUNGEON_PTR[0]->display_data.hallucinating && GetLeader() != NULL)
            {
                DUNGEON_PTR[0]->unk_camera_tracker = TRUE;
            }
            ov29_022FCD04();
        }

        ov29_0231AFB4();
        dungeon->snatch_monster = NULL;
        dungeon->snatch_status_unique_id = 0;
        dungeon->illuminate_spawn_entity = NULL;
        dungeon->illuminate_spawn_genid = 0;

        if (init_field_0x4 == 0)
        {
            SpawnTraps();
            ov29_0233873C();
            ov29_02344C4C();
            TrySpawnDoughSeedPoke();
            dungeon->unk_poke_kecleon_shop_tracker = dungeon->poke_buy_kecleon_shop;
            dungeon->poke_sold_kecleon_shop = 0;
            ov29_02343980();
            ov29_0233781C();
            ClearHiddenStairs();
        }
        else
        {
            ReevaluateSnatchMonster();
        }

        ov29_022F7EAC();
        ov29_0233665C();
        UpdateTrapsVisibility();

        if (init_field_0x4 == 0)
        {
            ov29_022FA2F0(1, 0, 0);

        }
        else
        {
            DetermineAllMonsterShadow();
            ov29_022FA524();
        }

        ov29_022E3A58(1);

        if (init_field_0x4 == 0)
        {
            ov29_022EF8A4();
            ov29_022FA418();
        }

        ov29_02353563 = 1;

        if (init_field_0x4 != 0)
        {
            ov29_023350FC();
            ov29_022FA750();
        }

        CountItemsOnFloorForAcuteSniffer();
        ov29_0233904C(init_field_0x4);
        UnkMapRelatedFunc(1, 0);
        ov29_0233A15C(1);

        if (GetTopScreenOption() == 3)
        {
            ov29_0233A1BC(1);
            UpdateMinimap();
        }

        ov29_022E34B0(0);
        ov29_022EA3F8(0, 0);
        ov29_022E0DFC();

        if (some_flag_storage.value != 0)
        {
            StartFadeDungeonWrapper(4, 0x1000, 0);
            some_flag_storage.value = 0;
        }
        else
        {
            StartFadeDungeonWrapper(1, 0x1000, 0);
        }

        StartFadeDungeonWrapper(1, 0x1000, 1);
        WaitUntilFadeIsFinished(0);
        ov29_022E0E44();
        ov29_022E8BFC(1);
        ov29_022EA418(1);
        ov29_02339FD0(0);
        ov29_0233A0E8(0, 0);
        ov29_02338F48(0);
        UnkMapRelatedFunc(0, 0);

        // Probably turn switch of some sorts
        dungeon->current_active_entity = NULL;
        dungeon->leader_running = FALSE;
        dungeon->field_0x78c = 0;
        dungeon->field_0x1c = 0x63;  // 0x64 is the max value, possibly indicating that the leader is acting.
        dungeon->field_0x4 = 1;
        LEADER_PTR = NULL;

        if (guest_init_failure_flag != 0)
        {
            DUNGEON_PTR[0]->end_floor_no_death_check_flag = TRUE;
            SetForcedLossReason(FORCED_LOSS_CLIENT_CANT_JOIN);  // FORCED_LOSS_CLIENT_CANT_JOIN = 4
            SetMessageLogPreprocessorArgsFlagVal(0, dungeon_init_data->guest_pokemon[0].id);
            DisplayMessage2(0, 0xB73 + RUN_DUNGEON_DATA_OFFSET, 1);
        }
        DUNGEON_PTR[0]->field_0x9 = 0;

        if (init_field_0x4 != 0)
        {
            TryActivateArtificialWeatherAbilities();
            HandleShopTransaction(1);
        }
        else
        {
            DisplayFloorTip();
            ov29_022EF9B8();
            struct dungeon *current_dungeon = DUNGEON_PTR[0];
            if (current_dungeon->end_floor_no_death_check_flag == FALSE && current_dungeon->end_floor_flag == FALSE)
            {
                ov29_022E2DFC(GetLeader());
                UpdateMinimap();
            }
            else
            {
                current_dungeon->field_0x9 = TRUE;
            }

            if (DUNGEON_PTR[0]->field_0x9 == FALSE)
            {
                ov29_02334D58();
                if (GetApparentWeather(0) != WEATHER_CLEAR)
                {
                    ov29_02335044(1);
                }
            }

            TryActivateNewFloorHpRestoration(1);
            TryActivateNewFloorPpRestoration(0);
            TryActivateIqBooster();
            TryActivateAcuteSniffer(0);
            TryActivateSlowStart();
            ov29_02349C84();

            if (DUNGEON_PTR[0]->id == DUNGEON_SPRING_CAVE_PIT)
            {
                TryInflictBurnStatusWholeTeam();
            }
        }

        struct entity *leader;
        if (send_help_item && (leader = GetLeader()) != NULL)
        {
            u8 rand_int = DungeonRandInt(8);
            u8 direction = rand_int & 7;

            struct position spawn_pos = {
                leader->pos.x + DIRECTIONS_XY[direction].x,
                leader->pos.y + DIRECTIONS_XY[direction].y
            };

            struct entity help_item;

            help_item.field_0x24 = 0;
            help_item.transparent = 0;
            help_item.info = &dungeon_init_data->help_item;
            help_item.type = ENTITY_ITEM;
            help_item.is_visible = 1;
            help_item.pos = spawn_pos;

            // Now onto the pixel positions
            u32 new_entity_pixel_posx = (spawn_pos.x * 24 + 4) << 8;
            u32 new_entity_pixel_posy = (spawn_pos.y * 24 + 4) << 8;

            SetEntityPixelPosXY(&help_item, new_entity_pixel_posx, new_entity_pixel_posy);
            help_item.spawn_genid = 0;
            ov29_02345D84(leader, &help_item, &dungeon_init_data->help_item, NULL);
        }

        ov29_022EA418(0);
        ov29_02338F48(1);
        ov29_02339F88(1);
        UpdateMinimap();

        if (init_field_0x4 == 0)
        {
            TryActivateStairSensor(0);
        }

        send_help_item = 0;

        if (init_field_0x4 == 0)
        {
            ov29_022E5F20();
            ov29_02305814(GetLeader(), dungeon->gen_info.force_create_monster_house);
            TryActivateWeather(1, 0);
        }
        else
        {
            init_field_0x4 = 0;
        }

    #ifdef JAPAN
        ov10_022BFE6C(0x14000);
    #else
        ov10_022BFE6C(0x10c00);
    #endif

        sub_02001808();

        if (DUNGEON_PTR[0]->field_0x9 == 0)
        {
            bool8 first_turn = 1;
            dungeon->floor_loop_status = FLOOR_LOOP_CONTINUE;
            // Set to 1 when loss, so FALSE means not yet dead
            dungeon->display_data.unk_fade_to_black_tracker = FALSE;
            SetMinimapDataE447(1);

            do
            {
                RunFractionalTurn(first_turn);
                first_turn = 0;
            }
            while (IsFloorOver() == FALSE);

        }

        ov29_0234B010(0);
        ov29_0234B1A4(0);
        ov29_022E8BFC(0);

        if (EntityIsValid__022E0354(GetLeader()))
        {
            EnemyEvolution(GetLeader());
        }

        struct dungeon *current_dungeon = DUNGEON_PTR[0];

        if (current_dungeon->floor_loop_status != FLOOR_LOOP_LEADER_FAINTED && TryForcedLoss(1))
        {
            current_dungeon = DUNGEON_PTR[0];
            current_dungeon->floor_loop_status = FLOOR_LOOP_LEADER_FAINTED; // Update the flag when leader faints
        }

        current_dungeon = DUNGEON_PTR[0];

        if ((current_dungeon->floor_loop_status == FLOOR_LOOP_LEADER_FAINTED || current_dungeon->successful_exit_tracker != 0)
             &&
            (current_dungeon->field_0xa == 0 && current_dungeon->skip_faint_animation_flag == FALSE))
        {
            ov29_022FA648();  // Maybe to play the faint animation after defeat?
        }

        if (EntityIsValid__022E0354(GetLeader()))
        {
            WaitUntilAlertBoxTextIsLoaded(0x4f);
            WaitUntilAlertBoxPauseIsOver(0x4f);
        }

        ov29_02338F38(0);
        UnkMapRelatedFunc(1, 0);
        SetMinimapDataE447(0);

        // This is documented to only be set to 1 when losing in a dungeon, why is it set here?
        DUNGEON_PTR[0]->display_data.unk_fade_to_black_tracker = TRUE;

        ov29_022EA370(4, 0x4f);
        if (ov29_022E9FC0() != 0)
        {
            FadeToBlack();
        }

        sub_020091B0(2, 0);
        sub_020091B0(3, 0);

        if ((GetForcedLossReason() == FORCED_LOSS_CLIENT_FAINTED ||
             GetForcedLossReason() == FORCED_LOSS_ESCORT_FAINTED) &&
            DUNGEON_PTR[0]->field_0xa != 0)
        {
            struct entity *leader = GetLeader();
            ov29_0233A248(0);
            ov29_023359F8(1);
            ov29_0234C654(0x20);
            sub_020091B0(0, 0);
            sub_020091B0(1, 0);
            sub_02009194(2, 0);
            sub_02009194(3, 0);
            sub_02009194(4, 0);
            StartFadeDungeonWrapper(1, 0x4000, 0);
            WaitUntilFadeIsFinished(0);

    #ifdef JAPAN
            DisplayMessage(0, 0x880, 1);
    #else
            DisplayMessage(0, 0xB6F, 1);
    #endif

            StartFadeDungeonWrapper(2, 0x4000, 0);
            WaitUntilFadeIsFinished(0);
            ov29_0234C654(1);
            ov29_023359F8(0);
            sub_020091B0(0, 0);
            sub_020091B0(1, 0);
            sub_020091B0(2, 0);
            sub_020091B0(3, 0);
            sub_020091B0(4, 0);
            DUNGEON_PTR[0]->field_0xa = 0;

            if (GetForcedLossReason() == FORCED_LOSS_ESCORT_FAINTED)
            {
                CreateMonsterSummaryFromEntityOuter(0x266, leader, leader, DUNGEON_PTR[0]->unk_fainted_monster_name);
            }
            else
            {
                CreateMonsterSummaryFromEntityOuter(0x261, leader, leader, NULL);
            }
        }

        UpdateShouldBoostKecleonShopSpawnChance();
        UpdateShouldBoostHiddenStairsSpawnChance();
        DeleteAllMonsterSpriteFiles();
        ov29_023365B8();
        ov29_022DD7AC();

        ov29_02353563 = 0;

        struct dungeon *dungeon_loc = DUNGEON_PTR[0];
        if (dungeon_loc->quicksave_flag)
        {
            ov29_0234CA84();
            dungeon_init_data->field_0xB0 = 3;
            dungeon_loc = DUNGEON_PTR[0];
            dungeon_init_data->field_0xB4 = dungeon_loc->id;
            dungeon_init_data->field_0xB5 = dungeon_loc->floor;

            break;

        }

        if (dungeon_loc->field_0xa != 0)
        {
            ov29_0234CA84();
        }

        ov29_022FDFA4();

        if (DUNGEON_PTR[0]->field_0xa == 0)
        {
            ov29_023469E0(2);
        }

        dungeon_loc = DUNGEON_PTR[0];
        if (dungeon_loc->floor_loop_status == FLOOR_LOOP_LEADER_FAINTED)
        {
            if (dungeon_loc->thief_alert)
            {
                ov29_02346A64();
            }
        }
        else
        {
            bool8 handled = FALSE;
            u32 successful_exit_tracker = dungeon_loc->successful_exit_tracker;

            // Documented to be when using escape orb
            if (successful_exit_tracker == 1)
            {
                CreateMonsterSummaryFromEntityOuter(0x279, NULL, GetLeader(), NULL);
                handled = TRUE;
            }
            // Documented to be when completing a mission
            else if (successful_exit_tracker == 2)
            {
                CreateMonsterSummaryFromEntityOuter(0x27c, NULL, GetLeader(), NULL);
                if (DUNGEON_PTR[0]->thief_alert)
                {
                    IncrementNbSteals();
                }
                handled = TRUE;
            }
            else if (successful_exit_tracker == 3)
            {
                CreateMonsterSummaryFromEntityOuter(0x27d, NULL, GetLeader(), NULL);
                if (DUNGEON_PTR[0]->thief_alert)
                {
                    IncrementNbSteals();
                }
                handled = TRUE;
            }
            else if (successful_exit_tracker == 4)
            {
                CreateMonsterSummaryFromEntityOuter(0x27a, NULL, GetLeader(), NULL);
                handled = TRUE;
            }
            else if (successful_exit_tracker == 5)
            {
                handled = TRUE;
            }

            if (handled == FALSE)
            {
                if ((s8)DUNGEON_PTR[0]->dungeon_objective == OBJECTIVE_RESCUE &&  // 2 = OBJECTIVE_RESCUE
                    GetFloorType() == 2 &&
                    DUNGEON_PTR[0]->floor_loop_status == FLOOR_LOOP_NEXT_FLOOR)
                {
                    CreateMonsterSummaryFromEntityOuter(0x27b, NULL, GetLeader(), NULL);
                    if (DUNGEON_PTR[0]->thief_alert)
                    {
                        IncrementNbSteals();
                    }
                }
                else
                {
                    if (DUNGEON_PTR[0]->thief_alert)
                    {
                        IncrementNbSteals();
                    }

                    struct dungeon *dungeon_loc = DUNGEON_PTR[0];
                    if ((s8)dungeon_loc->dungeon_objective == OBJECTIVE_UNK_GAME_MODE_5 &&
                        (u32)GetMaxReachedFloor(dungeon_loc->id) <= dungeon_loc->floor)
                    {
                        CreateMonsterSummaryFromEntityOuter(0x27a, NULL, GetLeader(), NULL);
                    }
                    else
                    {   struct dungeon *current_dungeon = DUNGEON_PTR[0];  // Needed for compilation
                        if (current_dungeon->floor > (u32)GetMaxReachedFloor(dungeon_loc->id))
                        {
                            current_dungeon = DUNGEON_PTR[0];
                            SetMaxReachedFloor(current_dungeon->id, current_dungeon->floor);
                        }

                        current_dungeon = DUNGEON_PTR[0];
                        if (current_dungeon->floor + 1 >= current_dungeon->n_floors_plus_one)
                        {
                            CreateMonsterSummaryFromEntityOuter(0x27a, NULL, GetLeader(), NULL);
                        }
                        else
                        {
                            if (GetHiddenFloorField() == HIDDEN_STAIRS_NONE)  // HIDDEN_STAIRS_NONE = 0
                            {
                                struct dungeon *current_dungeon = DUNGEON_PTR[0];
                                current_dungeon->floor = current_dungeon->floor + 1;
                            }

                            continue;
                        }
                    }
                }
            }

        }

        ov29_02353563 = 0;

        if (DUNGEON_PTR[0]->field_0xa == 0)
        {
            ov29_022ECFB8(&dungeon_init_data->field_0xC0);
            DUNGEON_PTR[0]->thief_alert_event = FALSE;
            SetUnkMusicFlag(0);
            DUNGEON_PTR[0]->monster_house_triggered_event = FALSE;
            DUNGEON_PTR[0]->field_0x796 = 0x3e7;
            DUNGEON_PTR[0]->standing_in_kecleon_shop = FALSE;
        }

        if (dungeon_init_data == NULL)
        {
            break;
        }

        if (IsDungeonEndReasonFailure())
        {
            if (DUNGEON_PTR[0]->field_0xa != 0)
            {
                dungeon_init_data->field_0xB0 = -2;
                MemZero((u8 *)&dungeon_init_data->result_location_seed,
                        sizeof(dungeon_init_data->result_location_seed));
                current_dungeon = DUNGEON_PTR[0];
                dungeon_init_data->field_0xB4 = current_dungeon->id;  // Similar to dungeon init?
                dungeon_init_data->field_0xB5 = current_dungeon->floor;
                current_dungeon = DUNGEON_PTR[0];
                dungeon_init_data->result_location_seed.dungeon_id = current_dungeon->id;
                dungeon_init_data->result_location_seed.floor = current_dungeon->floor;
                dungeon_init_data->result_location_seed.prng_preseed_23_bit = DUNGEON_PTR[0]->rescue_prng_preseed_23_bit;

                break;
            }
            else
            {
                dungeon_init_data->field_0xB0 = -1;
                ov29_023488C8();

                break;
            }
        }

        if (ov29_022ECF78())
        {
            s8 dungeon_objective = DUNGEON_PTR[0]->dungeon_objective;

            if (dungeon_objective == OBJECTIVE_RESCUE)
            {
                dungeon_init_data->field_0xB0 = 4;

                break;
            }

            if (dungeon_objective == OBJECTIVE_UNK_GAME_MODE_5)
            {
                dungeon_init_data->field_0xB0 = 1;

                break;
            }

            if (dungeon_objective == OBJECTIVE_STORY)
            {
                dungeon_init_data->field_0xB0 = 1;
                ov29_02348894();

                break;
            }

            // default case
            ov29_02348918();
            ov29_02348994();
            dungeon_init_data->field_0xB0 = 1;
            ov29_02348894();

            break;
        }
        else
        {
            dungeon_init_data->field_0xB0 = 2;

            if ((s8)DUNGEON_PTR[0]->dungeon_objective == OBJECTIVE_NORMAL)
            {
                ov29_02348994();
            }

            ov29_02348894();
        }
        // This is just really ugly to avoid using gotos, but nothing makes much sense
        // other than just terminating the while(TRUE) loop at almost every iteration
        break;
    }

    // The common exit point for the floor loop.

    SetBothScreensWindowColorToDefault();
    ov29_022EAEAC(0x14);
    ov29_022DDE00(0x14);
    ov29_022E15C8();
    ov29_022E1604();
    ov29_02338FC8();

    if (dungeon_init_data != NULL)
    {
        if (dungeon_init_data->field_0xB0 != -2 &&
            dungeon_init_data->field_0xB0 != 3)
        {
            sub_02057E90();
            sub_02058644(-1);
        }

        if (dungeon_init_data->field_0xB0 == 1 ||
            dungeon_init_data->field_0xB0 == 4 ||
            dungeon_init_data->field_0xB0 == 2)
        {
            ov29_02346DA4();
            RefillTeam();
        }
        else if (dungeon_init_data->field_0xB0 == -1)
        {
            ov29_02346E48();
            ov29_022F7E34();
            sub_02057EF4();
        }

        if (dungeon_init_data->field_0xB0 == 1 ||
            dungeon_init_data->field_0xB0 == 4 ||
            dungeon_init_data->field_0xB0 == 2)
        {
            dungeon_init_data->field_0x1A8 = 1;
        }
        else
        {
            dungeon_init_data->field_0x1A8 = 0;
        }
    }

    ov10_022BDC0C();
    FreeTopScreenStatus();
    FreeAlertBoxInfo();
    ov29_0234BB20();
    ov29_02338D30();
    ov29_022ED0B0();
    ov29_022DE930();
    FreeLoadedAttackSpriteAndMore();

    DUNGEON_PTR[0] = NULL;
    ov29_022DE15C();
    CloseFixedBin();

    return 1;
}

bool8 EntityIsValid__022E0354(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return GetEntityType(entity) != ENTITY_NOTHING;
}
