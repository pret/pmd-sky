#include "overlay_29_0231EDD8.h"
#include "dungeon_util_static.h"
#include "dg_object.h"
#include "dg_random.h"
#include "dungeon_ai_targeting_1.h"
#include "dungeon_map_access.h"
#include "dungeon_pokemon_attributes.h"
#include "dungeon_pokemon_attributes_1.h"
#include "dungeon_util.h"
#include "dungeon_util_2.h"
#include "dungeon_visibility.h"
#include "main_020018D0.h"
#include "moves_1.h"
#include "overlay_29_022E272C.h"
#include "overlay_29_022E9FC0.h"
#include "overlay_29_022EAC7C.h"
#include "overlay_29_0231F570.h"
#include "overlay_29_02321238.h"
#include "overlay_29_0234B340.h"
#include "position_util.h"
#include "util.h"

#ifdef JAPAN
#define MESSAGE_E45 0xB86
#define MESSAGE_E46 0xB87
#define MESSAGE_E47 0xB88
#define MESSAGE_E48 0xB89
#else
#define MESSAGE_E45 0xE45
#define MESSAGE_E46 0xE46
#define MESSAGE_E47 0xE47
#define MESSAGE_E48 0xE48
#endif

struct unk_022E9298 {
    s32 field_0x0;
    s32 field_0x4;
    s32 field_0x8;
    s32 field_0xc;
};

extern struct dungeon *DUNGEON_PTR[];
extern const s16 HURL_DAMAGE;
extern void CalcDamageFixedNoCategory(struct entity *attacker, struct entity *defender, s16 fixed_damage, s32 a, bool8 *flag, s32 b, s32 damage_source, s32 c, s32 d, s32 e);
extern void ChangeMonsterAnimation(struct entity *entity, s32 animation_id, s32 direction);
extern void ChangeMonsterAnimationToIdle(struct entity *monster, s32 direction);
extern void MoveMonsterToPos(struct entity *entity, s32 x_pos, s32 y_pos, bool8 reset_prev_pos_fields);
extern void TryWarp(struct entity *user, struct entity *target, s32 a, s32 b);
extern bool8 TwoTurnMoveForcedMiss(struct entity *target, struct move *move);
extern void ov29_022E9298(struct position *pos, struct unk_022E9298 *bounds, bool8 a);
extern void ov29_022EA370(s32 a, s32 b);
extern bool8 CannotMoveToTile(struct entity *entity, struct position *pos);
extern void ov29_0232033C(struct entity *entity, struct position *pos);

bool8 EntityIsValid__0231EDD8(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return GetEntityType(entity) != ENTITY_NOTHING;
}

void TryHurl(struct entity *user, struct entity *target)
{
    struct position list[40];
    struct unk_022E9298 bounds;
    struct position dest;
    struct pixel_position pixel_pos;
    s32 i;
    s32 j;
    s32 pass;
    struct entity *monster;
    s32 count;
    s32 dir;
    s32 end_x;
    s32 angle;
    s32 anim_dir;
    s32 num_frames;
    s32 px;
    s32 step_x;
    s32 step_y;
    bool8 suction_cups;
    s32 idx;
    s32 end_y;
    struct entity *occupant;

    if (user != target && (user == NULL ? FALSE : (bool8)(GetEntityType(user) == ENTITY_MONSTER)) && AbilityIsActiveVeneer(user, ABILITY_MOLD_BREAKER))
        suction_cups = FALSE;
    else
        suction_cups = AbilityIsActiveVeneer(target, ABILITY_SUCTION_CUPS);

    if (suction_cups) {
        SubstitutePlaceholderStringTags(0, target, 0);
        LogMessageByIdWithPopupCheckUserTarget(user, target, MESSAGE_E45);
        return;
    }

    if (user == target) {
        SubstitutePlaceholderStringTags(0, target, 0);
        LogMessageByIdWithPopupCheckUserTarget(user, target, MESSAGE_E46);
        return;
    }

    dest = target->pos;
    count = 0;

    for (pass = 0; pass < 2; pass++) {
        count = 0;
        for (i = 0; i < DUNGEON_MAX_POKEMON; i++) {
            monster = DUNGEON_PTR[0]->active_monster_ptrs[i];
            if (!EntityIsValid__0231F570(monster) || user == monster || target == monster)
                continue;
            if (!CanSeeTarget(user, monster))
                continue;
            if (pass == 0) {
                if (GetTreatmentBetweenMonsters(user, monster, FALSE, TRUE) !=
                    TREATMENT_TREAT_AS_ENEMY)
                    continue;
            } else {
                if (GetTreatmentBetweenMonsters(user, monster, FALSE, TRUE) !=
                    TREATMENT_TREAT_AS_ALLY)
                    continue;
            }

            if (pass == 0) {
                struct position pos;

                for (j = 0; j < NUM_DIRECTIONS; j++) {
                    pos.x = monster->pos.x + DIRECTIONS_XY[j].x;
                    pos.y = monster->pos.y + DIRECTIONS_XY[j].y;
                    if (!CannotMoveToTile(target, &pos) &&
                        !(GetTile(pos.x, pos.y)->terrain_flags & 0x800))
                        break;
                }
                if (j != NUM_DIRECTIONS && count < 40) {
                    list[count++] = monster->pos;
                }
            } else {
                struct position pos;

                for (j = 0; j < NUM_DIRECTIONS; j++) {
                    pos.x = monster->pos.x + DIRECTIONS_XY[j].x;
                    pos.y = monster->pos.y + DIRECTIONS_XY[j].y;
                    if (!CannotMoveToTile(target, &pos) &&
                        !(GetTile(pos.x, pos.y)->terrain_flags & 0x800) && count < 40) {
                        list[count++] = pos;
                    }
                }
            }
        }
        if (count != 0)
            break;
    }

    if (count != 0) {
        idx = DungeonRandInt(count);
        dest = list[idx];
    } else {
        struct position pos;

        ov29_022E9298(&user->pos, &bounds, HasDropeyeStatus(user));
        for (j = 0; j < 100; j++) {
            pos.x = DungeonRandRange(bounds.field_0x0, bounds.field_0x8);
            pos.y = DungeonRandRange(bounds.field_0x4, bounds.field_0xc);
            if (!CannotMoveToTile(target, &pos) &&
                !(GetTile(pos.x, pos.y)->terrain_flags & 0x800)) {
                dest = pos;
                break;
            }
        }
        if (j == 100) {
            LogMessageByIdWithPopupCheckUserTarget(user, target, MESSAGE_E48);
            return;
        }
    }

    SubstitutePlaceholderStringTags(0, target, 0);
    LogMessageByIdWithPopupCheckUserTarget(user, target, MESSAGE_E47);
    if (ShouldDisplayEntityWrapper(target))
        PlaySeByIdIfNotSilence(0x212);

    anim_dir = GetEntInfo(target)->action.direction;
    angle = 0;
    num_frames = Max(dest.x - target->pos.x, dest.y - target->pos.y) * 16;
    if (num_frames > 80)
        num_frames = 80;
    if (num_frames < 10)
        num_frames = 10;
    dir = GetDirectionTowardsPosition(&dest, &target->pos);
    end_x = ((dest.x * 24 + 12) << 8) + (DIRECTIONS_XY[dir].x << 8) / 3;
    end_y = ((dest.y * 24 + 16) << 8) + (DIRECTIONS_XY[dir].y << 8) / 3;
    px = target->pixel_pos.x;
    step_y = (end_y - (s32)target->pixel_pos.y) / num_frames;
    pixel_pos.x = px;
    pixel_pos.y = target->pixel_pos.y;
    i = 0;
    step_x = (end_x - px) / num_frames;

    while (i < num_frames) {
        pixel_pos.x += step_x;
        pixel_pos.y += step_y;
        UpdateEntityPixelPos(target, &pixel_pos);
        if (ShouldDisplayEntityWrapper(target)) {
            target->elevation = SinAbs4096(angle) << 5;
            AdvanceFrame(0x3B);
            if (!(i & 3)) {
                anim_dir &= 7;
                ChangeMonsterAnimation(target, 6, anim_dir);
                anim_dir++;
            }
        }
        angle += 0x800 / num_frames;
        i++;
    }

    pixel_pos.x = end_x;
    pixel_pos.y = end_y;
    target->elevation = 0;
    UpdateEntityPixelPos(target, &pixel_pos);
    AdvanceFrame(0x3B);
    GetEntInfo(target)->action.direction = anim_dir & 7;

    occupant = GetTile(dest.x, dest.y)->monster;
    if (!EntityIsValid__0231F570(occupant)) {
        MoveMonsterToPos(target, dest.x, dest.y, TRUE);
        ov29_02321238(target);
        return;
    }

    for (j = 0; j < NUM_DIRECTIONS; j++) {
        struct position pos;

        pos.x = dest.x + DIRECTIONS_XY[j].x;
        pos.y = dest.y + DIRECTIONS_XY[j].y;
        if (!CannotMoveToTile(target, &pos) &&
            !(GetTile(pos.x, pos.y)->terrain_flags & 0x800)) {
            dest = pos;
            break;
        }
    }

    if (j == NUM_DIRECTIONS) {
        TryWarp(user, target, 0, 0);
    } else {
        ov29_0232033C(target, &dest);
        MoveMonsterToPos(target, dest.x, dest.y, TRUE);
    }

    if (GetEntityType(occupant) == ENTITY_MONSTER) {
        struct move move;

        InitMove(&move, MOVE_REGULAR_ATTACK);
        if (!TwoTurnMoveForcedMiss(occupant, &move))
            CalcDamageFixedNoCategory(user, occupant, HURL_DAMAGE, 0, NULL, 0,
                                      DAMAGE_SOURCE_FLYING_MONSTER, 0, 0, 0);
        if (EntityIsValid__0231F570(occupant))
            ChangeMonsterAnimationToIdle(occupant, GetEntInfo(occupant)->action.direction);
    }

    CalcDamageFixedNoCategory(user, target, HURL_DAMAGE, 0, NULL, 0,
                              DAMAGE_SOURCE_KNOCKED_FLYING, 0, 0, 0);
    if (EntityIsValid__0231F570(target))
        ChangeMonsterAnimationToIdle(target, GetEntInfo(target)->action.direction);
    ov29_022EA370(0x1E, 0x3B);
    ov29_02321238(target);
}
