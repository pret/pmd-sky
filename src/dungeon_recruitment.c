#include "dungeon.h"
#include "dungeon_logic_3.h"
#include "dungeon_logic_7.h"
#include "dungeon_mode.h"
#include "dungeon_pokemon_attributes_1.h"
#include "dungeon_recruitment.h"
#include "dungeon_recruitment_2.h"
#include "dungeon_recruitment_3.h"
#include "dg_random.h"
#include "dungeon_visibility.h"
#include "enums.h"
#include "fixed_room_data_1.h"
#include "main_0205283C.h" // GetRecruitRate1 and GetRecruitRate2
#include "main_0208655C.h"
#include "math.h"
#include "overlay_29_0230E578.h" // ItemIsActive__0230E578

extern bool8 IsLegendaryChallengeFloor(void);
extern bool8 IsCurrentMissionTypeExact(u32 mission_type, u32 mission_subtype);
extern bool8 IsMonsterOnTeam(s16 monsterId, s32 checkType);
extern void ov29_022E1B28(s32);
extern void ov29_022E81F8(void);
extern s32 GetFirstEmptyMemberIdx(u32);

extern const s16 FRIEND_BOW_FAST_FRIEND_BOOST;
extern const s16 GOLDEN_MASK_RECRUIT_BOOST;
extern const s16 AMBER_TEAR_RECRUIT_BOOST;
extern const s16 ICY_FLUTE_RECRUIT_BOOST;
extern const s16 FIERY_DRUM_RECRUIT_BOOST;
extern const s16 TERRA_CYMBAL_RECRUIT_BOOST;
extern const s16 AQUA_MONICA_RECRUIT_BOOST;
extern const s16 ROCK_HORN_RECRUIT_BOOST;
extern const s16 GRASS_CORNET_RECRUIT_BOOST;
extern const s16 SKY_MELODICA_RECRUIT_BOOST;

extern s16 RECRUITMENT_LEVEL_BOOST_TABLE[];

bool8 SpecificRecruitCheck(u32 monster_id)
{
    if (DUNGEON_PTR[0]->recruiting_enabled == FALSE) {
        return FALSE;
    }

    // DebugRecruitingEnabled always returns TRUE
    if (DebugRecruitingEnabled(monster_id) == FALSE) {
        return FALSE;
    }

    if (monster_id == MONSTER_MEW) {
        // The cast is needed to produce assembly code that matches the original.
        // Accessing dungeon_objective using the enum directly gives
        // different assembly code.
        if (*(volatile s8 *)&DUNGEON_PTR[0]->dungeon_objective == OBJECTIVE_RESCUE) {
            return FALSE;
        }
    }

    if (monster_id == MONSTER_DEOXYS_ATTACK) {
        return FALSE;
    }

    if (monster_id == MONSTER_DEOXYS_DEFENSE) {
        return FALSE;
    }

    if (monster_id == MONSTER_DEOXYS_SPEED) {
        return FALSE;
    }

    if (monster_id == MONSTER_REGIROCK) {
        return FALSE;
    }

    if (monster_id == MONSTER_REGICE) {
        return FALSE;
    }

    if (monster_id == MONSTER_REGISTEEL) {
        return FALSE;
    } else {
        return TRUE;
    }
}

bool8 RecruitCheck(struct entity* leader, struct entity* target)
{
    s32 random_roll;
    struct monster* leader_monster_info = leader->info;
    struct monster* target_monster_info = target->info;

    s32 recruit_rate;
    bool8 already_on_team;
    s16 target_mon_id;

    if (!IsRecruitingAllowed(DUNGEON_PTR[0]->id) ||
            IsFullFloorFixedRoom() ||
            IsLegendaryChallengeFloor() ||
            IsCurrentMissionTypeExact(MISSION_ARREST_OUTLAW, MISSION_OUTLAW_HIDEOUT))
        return FALSE;

    if (DUNGEON_PTR[0]->send_home_disabled != FALSE)
        return FALSE;

    if (DUNGEON_PTR[0]->id == DUNGEON_LABYRINTH_CAVE) {
        target_mon_id = target_monster_info->id;
        if (target_mon_id == MONSTER_GABITE || target_mon_id == MONSTER_GABITE_SECONDARY)
            return FALSE;
    }

    target_mon_id = target_monster_info->id;

    if (target_mon_id == MONSTER_ZAPDOS || target_mon_id == MONSTER_ARTICUNO
        || target_mon_id == MONSTER_MOLTRES || target_mon_id == MONSTER_ENTEI
        || target_mon_id == MONSTER_RAIKOU || target_mon_id == MONSTER_SUICUNE
        || target_mon_id == MONSTER_LATIAS || target_mon_id == MONSTER_LATIOS
        || target_mon_id == MONSTER_JIRACHI || target_mon_id == MONSTER_RAYQUAZA
        || target_mon_id == MONSTER_DEOXYS_NORMAL || target_mon_id == MONSTER_REGIROCK
        || target_mon_id == MONSTER_REGICE || target_mon_id == MONSTER_REGISTEEL
        || (u16)(s16)(target_mon_id - 534) <= 1) {
        if (IsMonsterOnTeam(target_mon_id, 1))
            return FALSE;
    }

    if (IsMonsterLoneOutlaw(target_monster_info))
        return FALSE;

    if (!SpecificRecruitCheck(target_monster_info->id))
        return FALSE;

    if (abs(leader->pos.x - target->pos.x) > 1 || abs(leader->pos.y - target->pos.y) > 1)
        return FALSE;

    // joined_at identifies the dungeon a monster joined at, but is also used as a unique identifier for special monsters
    if (target_monster_info->joined_at == DUNGEON_CLIENT || target_monster_info->monster_behavior == BEHAVIOR_RESCUE_TARGET)
        return FALSE;

    if (!CanSeeTarget(target, leader))
        return FALSE;

    // These two calls are likely updating the UI.
    ov29_022E1B28(1);
    ov29_022E81F8();

    already_on_team = IsMonsterOnTeam(target_monster_info->id, 1);
    random_roll = DungeonRandInt(1000);

    if (HasPlayedOldGame() && !already_on_team) {
        // recruit rate 2 is usually higher than recruit rate 1 (if they are different)
        recruit_rate = GetRecruitRate2(target_monster_info->id);
    } else {
        recruit_rate = GetRecruitRate1(target_monster_info->id);
    }

    if (recruit_rate > 0 && already_on_team) {
        recruit_rate = recruit_rate >>= 1;
    }

    if (recruit_rate == -INFINITY)
        return FALSE;

    if (ItemIsActive__0230E578(leader, ITEM_FRIEND_BOW)) {
        recruit_rate += FRIEND_BOW_FAST_FRIEND_BOOST;
    } else if (ItemIsActive__0230E578(leader, ITEM_GOLDEN_MASK)) {
        recruit_rate += GOLDEN_MASK_RECRUIT_BOOST;
    } else if (ItemIsActive__0230E578(leader, ITEM_AMBER_TEAR)) {
        recruit_rate += AMBER_TEAR_RECRUIT_BOOST;
    } else if (ItemIsActive__0230E578(leader, ITEM_ICY_FLUTE)) {
        if (MonsterIsType(target, TYPE_ICE))recruit_rate += ICY_FLUTE_RECRUIT_BOOST;
    } else if (ItemIsActive__0230E578(leader, ITEM_FIERY_DRUM)) {
        if (MonsterIsType(target, TYPE_FIRE)) recruit_rate += FIERY_DRUM_RECRUIT_BOOST;
    } else if (ItemIsActive__0230E578(leader, ITEM_TERRA_CYMBAL)) {
        if (MonsterIsType(target, TYPE_GROUND)) recruit_rate += TERRA_CYMBAL_RECRUIT_BOOST;
    } else if (ItemIsActive__0230E578(leader, ITEM_AQUA_MONICA)) {
        if (MonsterIsType(target, TYPE_WATER)) recruit_rate += AQUA_MONICA_RECRUIT_BOOST;
    } else if (ItemIsActive__0230E578(leader, ITEM_ROCK_HORN)) {
        if (MonsterIsType(target, TYPE_ROCK)) recruit_rate += ROCK_HORN_RECRUIT_BOOST;
    } else if (ItemIsActive__0230E578(leader, ITEM_GRASS_CORNET)) {
        if (MonsterIsType(target, TYPE_GRASS)) recruit_rate += GRASS_CORNET_RECRUIT_BOOST;
    } else if (ItemIsActive__0230E578(leader, ITEM_SKY_MELODICA)) {
        if (MonsterIsType(target, TYPE_FLYING)) recruit_rate += SKY_MELODICA_RECRUIT_BOOST;
    }

    if (IqSkillIsEnabled(leader, IQ_FAST_FRIEND)) {
        recruit_rate += FRIEND_BOW_FAST_FRIEND_BOOST;
    }

    recruit_rate += RECRUITMENT_LEVEL_BOOST_TABLE[leader_monster_info->level];

    if (random_roll >= recruit_rate)
        return FALSE;

    s32 free_slot_index = GetFirstEmptyMemberIdx(0);

    if(free_slot_index < 0) {
        return FALSE;
    }

    if(free_slot_index >= 0) {
        return TRUE;
    }

    return TRUE;
}
