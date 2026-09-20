#include "dungeon_logic_4.h"
#include "dungeon_util_static.h"
#include "overlay_29_022F7364.h"
#include "dungeon.h"
#include "dungeon_logic_6.h"
#include "dungeon_map_access.h"
#include "dungeon_pokemon_attributes_1.h"
#include "dungeon_util.h"
#include "inflict_status.h"
#include "move_effects.h"
#include "moves.h"
#include "moves_4.h"
#include "overlay_29_022F9720.h"

extern struct dungeon *DUNGEON_PTR[];
extern const s16 _020A1870;
bool8 ov29_02348100(struct entity *entity);
void ResetTypeChanges(struct entity *entity);
bool8 TeamMemberHasEnabledIqSkill(enum iq_skill_id iq_skill);
bool8 UpdateMapSurveyorFlag(void);
void UpdateMinimap(void);
void DisplayAnimatedNumbers(s32 amount, struct entity *entity,
                            bool8 display_sign, s32 number_color);
void PlayMissSfx__022E611C(struct entity *attacker, struct entity *defender);

bool8 HasLowHealth(struct entity *entity)
{
    if (!EntityIsValid__022F7364(entity))
        return FALSE;

    if (GetEntityType(entity) != ENTITY_MONSTER)
        return FALSE;

    struct monster *pokemon_info = GetEntInfo(entity);
    s32 max_hp = pokemon_info->max_hp_stat + pokemon_info->max_hp_boost;
    if (max_hp > MAX_HP_LIMIT)
        max_hp = MAX_HP_LIMIT;

    return pokemon_info->hp < max_hp / 4;
}

bool8 AreEntitiesAdjacent(struct entity *entity, struct entity *other)
{
    s16 i;

    for (i = 0; i < NUM_DIRECTIONS; i++) {
        if (GetTile(entity->pos.x + DIRECTIONS_XY[i].x,
                    entity->pos.y + DIRECTIONS_XY[i].y)->monster == other)
            return TRUE;
    }

    return FALSE;
}

bool8 IsHero(struct entity *entity)
{
    enum dungeon_id joined_at;

    if (!IsMonster__022F9720(entity))
        return FALSE;

    joined_at = GetEntInfo(entity)->joined_at;
    return joined_at == DUNGEON_JOINED_AT_QUESTION_MARKS;
}

void ov29_022FB718(struct entity *entity)
{
    struct monster *info;
    struct monster *info2;
    s32 max_hp;
    u8 conversion2;
    struct move *move;
    s16 i;

    if (!EntityIsValid__022F7364(entity))
        return;

    info = GetEntInfo(entity);
    info->max_hp_boost = 0;
    conversion2 = Conversion2IsActive(entity);

    info2 = GetEntInfo(entity);
    if (IqSkillIsEnabled(entity, IQ_BRICK_TOUGH))
        info2->max_hp_boost += _020A1870;

    for (i = 0; i < MAX_MON_MOVES; i++) {
        move = &info2->moves.moves[i];
        if (MoveExists(move)) {
            move->flags2 &= ~MOVE_FLAG_MULTITALENT_PP_BOOST;
            if (IqSkillIsEnabled(entity, IQ_MULTITALENT))
                move->flags2 |= MOVE_FLAG_MULTITALENT_PP_BOOST;
        }
    }

    ov29_02348100(entity);
    if (conversion2 == EFFECT_ACTIVE_FROM_EXCLUSIVE_ITEM && !Conversion2IsActive(entity))
        ResetTypeChanges(entity);

    max_hp = info->max_hp_stat + info->max_hp_boost;
    if (info->hp > (max_hp > MAX_HP_LIMIT ? MAX_HP_LIMIT : max_hp))
        info->hp = max_hp > MAX_HP_LIMIT ? MAX_HP_LIMIT : max_hp;
}

void ov29_022FB83C(struct entity *entity, bool8 a)
{
    struct monster *info;
    s32 max_hp;
    s16 i;

    if (!EntityIsValid__022F7364(entity))
        return;

    info = GetEntInfo(entity);

    for (i = 0; i < MAX_MON_MOVES; i++) {
        struct move *move = &info->moves.moves[i];
        if (MoveExists(move))
            GetMoveBasePp(move);
    }

    ov29_022FB718(entity);
    if (!a)
        return;

    max_hp = info->max_hp_stat + info->max_hp_boost;
    if (max_hp > MAX_HP_LIMIT)
        max_hp = MAX_HP_LIMIT;
    info->hp = max_hp;

    for (i = 0; i < MAX_MON_MOVES; i++) {
        struct move *move = &info->moves.moves[i];
        if (MoveExists(move))
            move->pp = GetMaxPp(move);
    }
}

void ov29_022FB920(bool8 a)
{
    s16 i;

    for (i = 0; i < MAX_TEAM_MEMBERS; i++)
        ov29_022FB718(DUNGEON_PTR[0]->monster_slots.party_members[i]);

#ifdef EUROPE
    if (UpdateMapSurveyorFlag() && a)
        UpdateMinimap();
#else
    if (TeamMemberHasEnabledIqSkill(IQ_MAP_SURVEYOR))
        DUNGEON_PTR[0]->display_data.map_surveyor = TRUE;
    else
        DUNGEON_PTR[0]->display_data.map_surveyor = FALSE;
#endif
}

bool8 ov29_022FB984(struct entity *entity)
{
    return FALSE;
}

void ov29_022FB98C(struct entity *attacker, struct entity *defender)
{
    DisplayAnimatedNumbers(9999, defender, TRUE, -1);
    PlayMissSfx__022E611C(attacker, defender);
}

bool8 ov29_022FB9BC(struct entity *entity)
{
    return IsSecretBazaarNpcBehavior(GetEntInfo(entity)->monster_behavior)
               ? TRUE : FALSE;
}
