#include "dungeon.h"
#include "dungeon_logic_3.h"
#include "dungeon_logic_7.h"
#include "dungeon_mode.h"
#include "dungeon_pokemon_attributes_1.h"
#include "dungeon_recruitment.h"
#include "dungeon_recruitment_2.h"
#include "dg_random.h"
#include "dungeon_visibility.h"
#include "enums.h"
#include "fixed_room_data_1.h"
#include "main_0205283C.h" // GetRecruitRate1 and GetRecruitRate2
#include "MSL_C/stdlib.h"
#include "math.h"
#include "overlay_29_0230E578.h" // ItemIsActive__0230E578
#include "progression.h"
#include "overlay_29_02349208.h"
#include "common.h"
#include "dungeon_util_2.h"
#include "main_020251AC.h"
#include "main_0204FDFC.h"
#include "main_02058E68.h"
#include "overlay_29_022E68BC.h"
#include "overlay_29_022EAC7C.h"
#include "overlay_29_0234B024.h"
#include "overlay_29_0234BA54.h"
#include "position_util.h"
#include "overlay_29_0234B104.h"
#include "main_02056294.h"

struct unk_0230E064 {
    s16 field_0x0;
    s16 field_0x2;
    s16 field_0x4;
    s16 field_0x6;
    u8 field_0x8[2];
    u8 field_0xa[2];
    s16 field_0xc;
    s16 field_0xe;
    s32 field_0x10;
    u16 field_0x14;
    u16 field_0x16;
    u16 field_0x18;
    u16 field_0x1a;
    struct item field_0x1c;
    struct moves field_0x22;
    u16 field_0x44;
    u16 field_0x46;
};

void SetPreprocessorArgsStringToName(struct preprocessor_args *preprocessor_args,
                                     s32 pos, struct monster *monster,
                                     u32 param_4, u8 name_type);
void HandleFaint(struct entity *fainted_entity, s32 damage_source,
                 struct entity *killer);
void GetRecoloredTeamMemberName(char *dst, struct team_member *team_member);
void ov29_0234D630(void);
void ov29_0234D838(void);
const u8 *GetNameString(enum monster_id monster_id);
void StrncpyName(char *dest, const char *src, u32 n);
void EnsureCanStandCurrentTile(struct entity *entity);
void ov29_02305F60(struct entity *user, struct entity *target);
void ChangeMonsterAnimationToIdle(struct entity *monster, s32 direction);
s32 ov29_0234D7C0(s32 message_id, struct preprocessor_args *args, s32 param_3,
                  s32 param_4, u8 param_5);
void ov29_0234D8A0(s32 param_1);
struct entity *ov29_0234EE10(struct entity *entity, char *name);
bool8 DungeonModeSetupAndShowNameKeyboard(char *name, char *param_2, s32 param_3);
void RemoveMonsterFromTile(struct entity *entity, s32 x, s32 y);
bool8 ov29_0230E5A8(struct entity *user, struct entity *target, s32 x, s32 y);
s32 ov29_0230E5FC(struct team_member *member, s32 param_2);
void ov29_0230E658(s32 message_id);
void GetRecoloredNameOfTeamMemberAtIdx(char *dst, s32 roster_idx);
void sub_02056698(s32 roster_idx, s16 member_idx);
void ov29_022E8104(void);
bool8 InitTeamMember(s16 monster_id, s32 x, s32 y, struct team_member *member,
                     struct entity **out, bool8 param_6, bool8 param_7,
                     bool8 param_8, bool8 param_9);

extern bool8 IsLegendaryChallengeFloor(void);
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

extern struct dungeon *DUNGEON_PTR[];
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

#ifdef JAPAN
#define TRY_RECRUIT_MESSAGE_OFFSET -0x2C0
#else
#define TRY_RECRUIT_MESSAGE_OFFSET 0
#endif

bool8 TryRecruit(struct entity *user, struct entity *recruit, void *recruit_info)
{
    struct unk_0230E064 *info = recruit_info;
    struct entity *spawned;
    struct entity *out;
#ifdef JAPAN
    char keyboard_buf[16];
#else
    char keyboard_buf[20];
#endif
    char name_buf2[64];
    char name_buf1[64];
    struct team_member member;
    struct monster *mon;
    struct entity *ent;
    char *recolored;
    struct team_member *slot;
    s32 dir;
    s32 response;
    s32 idx;
    bool8 ret;
    s16 i;

    spawned = NULL;
    WaitUntilAlertBoxPauseIsOver(10);
    ov29_0234B1A4(0);
    ov29_0234D630();
    idx = -1;
    dir = GetDirectionTowardsPosition(&recruit->pos, &user->pos);
    mon = recruit->info;
    recruit->transparent = 0;
    ov29_02305F60(user, recruit);
    ChangeMonsterAnimationToIdle(recruit, dir);
    if (IsMonsterOnTeam(mon->id, 1)) {
        SetPreprocessorArgsStringToName(GetMessageLogPreprocessorArgs(), 0,
                                        recruit->info, 0, 1);
    } else {
        SetPreprocessorArgsStringToName(GetMessageLogPreprocessorArgs(), 0,
                                        recruit->info, 0, 0);
    }

    if (ov29_0234D7C0(0xC77 + TRY_RECRUIT_MESSAGE_OFFSET,
                      GetMessageLogPreprocessorArgs(), 0, 0, 1) == 2) {
        ret = FALSE;
    } else {
        member.flags = TRUE;
        member.flags |= 2;
        member.is_leader = 0;
        member.level = info->field_0xc;
        member.iq = 1;
        member.hidden_power_base_power = info->field_0x44;
        *(u16 *)&member.hidden_power_type = info->field_0x46;
        member.tactic = 0;
        member.member_index = -1;
        member.team_index = -1;
        member.id = info->field_0x0;
        member.joined_at = DUNGEON_PTR[0]->id;
        member.joined_at_floor = DUNGEON_PTR[0]->floor;
        member.current_hp = info->field_0x6;
        member.max_hp = info->field_0x6;
        member.belly = info->field_0x14;
        member.belly_thousandths = info->field_0x16;
        member.max_belly = info->field_0x18;
        member.max_belly_thousandths = info->field_0x1a;
        for (i = 0; i < 2; i++) {
            member.offensive_stats[i] = info->field_0x8[i];
            member.defensive_stats[i] = info->field_0xa[i];
        }
        member.exp = info->field_0x10;
        *(struct moves *)member.moves = info->field_0x22;
        member.held_item = info->field_0x1c;
        StrncpyName(member.name, (const char *)GetNameString((enum monster_id)info->field_0x0), 10);
        EnableAllLearnableIqSkills(member.iq_skill_flags, (s16)member.id,
                                   (s16)member.iq);
        recolored = name_buf1;
#ifdef JAPAN
        StrcpySimple((unsigned char *)keyboard_buf, (const unsigned char *)member.name);
#else
        StrncpySimpleNoPad((unsigned char *)keyboard_buf,
                           (const unsigned char *)member.name, 10);
#endif
        ov29_022EACAC();
        if (ov29_0234D7C0(0xC7B + TRY_RECRUIT_MESSAGE_OFFSET,
                          GetMessageLogPreprocessorArgs(), 0, 0, 1) == 1) {
            ov29_0234D838();
            while (!DungeonModeSetupAndShowNameKeyboard(member.name, keyboard_buf, 0))
                ;
        }
        GetRecoloredTeamMemberName(recolored, &member);
        SetMessageLogPreprocessorArgsString(0, recolored);
        SetPreprocessorArgsIdVal(1, 0);
        ov29_0230E658(0xC7E + TRY_RECRUIT_MESSAGE_OFFSET);
        RemoveMonsterFromTile(recruit, info->field_0x2, info->field_0x4);
        if (!ov29_0230E5A8(user, recruit, info->field_0x2, info->field_0x4)) {
            idx = ov29_0230E5FC(&member, -1);
            while (!ov29_0230E5A8(user, recruit, info->field_0x2, info->field_0x4)) {
                ov29_0230E658(0xC7F + TRY_RECRUIT_MESSAGE_OFFSET);
                do {
                    ov29_0234D838();
                    ent = ov29_0234EE10(recruit, member.name);
                    if (ent == NULL)
                        break;
                    if (ent == recruit) {
                        GetRecoloredTeamMemberName(name_buf2, &member);
                    } else {
                        GetRecoloredNameOfTeamMemberAtIdx(
                            name_buf2, ((struct monster *)ent->info)->team_index);
                    }
                    SetMessageLogPreprocessorArgsString(0, name_buf2);
                    SubstitutePlaceholderStringTags(1, user, 0);
                    response = ov29_0234D7C0(0xC80 + TRY_RECRUIT_MESSAGE_OFFSET,
                                             GetMessageLogPreprocessorArgs(), 0, 0, 1);
                } while (response == -1);
                if (response != 2 && ent != NULL) {
                    ov29_0230E658(0xC81 + TRY_RECRUIT_MESSAGE_OFFSET);
                    ov29_022E68BC(ent);
                    HandleFaint(ent, DAMAGE_SOURCE_TRANSFORM_FRIEND, user);
                    if (ent == recruit) {
                        ret = TRUE;
                        goto done;
                    }
                }
            }
        }
        for (i = 0; i < 4; i++) {
            if (!GetFlag(GetActiveTeamMember(i)->flags, 1))
                break;
        }
        member.team_index = i;
        member.member_index = ov29_0230E5FC(&member, idx);
        sub_02056698(i, member.member_index);
        HandleFaint(recruit, DAMAGE_SOURCE_TRANSFORM_FRIEND, user);
        slot = GetActiveTeamMember(i);
        *slot = member;
        ov29_022E8104();
        ov29_022E81F8();
        InitTeamMember(info->field_0x0, info->field_0x2, info->field_0x4, slot,
                       &out, FALSE, TRUE, TRUE, TRUE);
        SetPokemonJoined((s16)slot->id);
        ov29_022E8104();
        ov29_022E81F8();
        spawned = out;
        ret = TRUE;
    }
done:
    ov29_0234D8A0(1);
    if (!ret)
        LogMessageByIdWithPopupCheckUser(user, 0xC78 + TRY_RECRUIT_MESSAGE_OFFSET);
    if (spawned != NULL)
        EnsureCanStandCurrentTile(spawned);
    return ret;
}
