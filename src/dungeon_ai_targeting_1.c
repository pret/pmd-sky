#include "dungeon_ai_targeting_1.h"
#include "dungeon_util_static.h"

const enum monster_treatment TREATMENT_DATA[4][2][2][2] = {
    {
        {
            {TREATMENT_TREAT_AS_ALLY, TREATMENT_TREAT_AS_ENEMY},
            {TREATMENT_TREAT_AS_ENEMY, TREATMENT_IGNORE}
        },
        {
            {TREATMENT_TREAT_AS_ENEMY, TREATMENT_IGNORE},
            {TREATMENT_TREAT_AS_ALLY, TREATMENT_IGNORE}
        }
    },
    {
        {
            {TREATMENT_TREAT_AS_ALLY, TREATMENT_IGNORE},
            {TREATMENT_TREAT_AS_ENEMY, TREATMENT_IGNORE}
        },
        {
            {TREATMENT_TREAT_AS_ENEMY, TREATMENT_IGNORE},
            {TREATMENT_TREAT_AS_ALLY, TREATMENT_IGNORE}
        }
    },
    {
        {
            {TREATMENT_TREAT_AS_ALLY, TREATMENT_IGNORE},
            {TREATMENT_TREAT_AS_ENEMY, TREATMENT_IGNORE}
        },
        {
            {TREATMENT_IGNORE, TREATMENT_TREAT_AS_ENEMY},
            {TREATMENT_IGNORE, TREATMENT_TREAT_AS_ENEMY}
        }
    },
    {
        {
            {TREATMENT_IGNORE, TREATMENT_TREAT_AS_ENEMY},
            {TREATMENT_IGNORE, TREATMENT_TREAT_AS_ENEMY}
        },
        {
            {TREATMENT_TREAT_AS_ENEMY, TREATMENT_IGNORE},
            {TREATMENT_TREAT_AS_ALLY, TREATMENT_IGNORE}
        }
    }
};

enum decoy_ai_treatment
{
    DECOY_AI_TREATMENT_NONE_LEADER = 0,
    DECOY_AI_TREATMENT_NONE_NONLEADER = 1,
    DECOY_AI_TREATMENT_TEAM = 2,
    DECOY_AI_TREATMENT_WILD = 3,
};

extern bool8 CanSeeInvisibleMonsters(struct entity *pokemon);

enum monster_treatment GetTreatmentBetweenMonsters(struct entity *pokemon, struct entity *target_pokemon, bool8 ignore_invisible, bool8 check_petrified)
{
    struct monster *pokemon_info = GetEntInfo(pokemon);
    struct monster *target_data = GetEntInfo(target_pokemon);
    if (pokemon == target_pokemon)
        return TREATMENT_TREAT_AS_ALLY;

    if (pokemon_info->shopkeeper == SHOPKEEPER_MODE_SHOPKEEPER || target_data->shopkeeper == SHOPKEEPER_MODE_SHOPKEEPER)
        return TREATMENT_IGNORE;

    if (pokemon_info->monster_behavior == BEHAVIOR_RESCUE_TARGET || target_data->monster_behavior == BEHAVIOR_RESCUE_TARGET)
        return TREATMENT_IGNORE;

    if (check_petrified && !pokemon_info->is_not_team_member && target_data->frozen_class_status.freeze == STATUS_FROZEN_PETRIFIED)
        return TREATMENT_IGNORE;

    if (!ignore_invisible && target_data->invisible_class_status.status == STATUS_INVISIBLE_INVISIBLE && !CanSeeInvisibleMonsters(pokemon))
        return TREATMENT_IGNORE;

    u8 pokemon_targeting_decoy = pokemon_info->decoy_ai_tracker;

    u8 decoy_ai_tracker;
    if (pokemon_targeting_decoy == DECOY_AI_NONE)
    {
        if (pokemon_info->is_team_leader)
            decoy_ai_tracker = DECOY_AI_TREATMENT_NONE_LEADER;
        else
            decoy_ai_tracker = DECOY_AI_TREATMENT_NONE_NONLEADER;
    }
    else if (pokemon_targeting_decoy == DECOY_AI_TEAM)
        decoy_ai_tracker = DECOY_AI_TREATMENT_TEAM;
    else
        decoy_ai_tracker = DECOY_AI_TREATMENT_WILD;

    bool8 pokemon_is_enemy;
    if (pokemon_info->shopkeeper != SHOPKEEPER_MODE_NORMAL)
    {
        if (pokemon_info->shopkeeper == SHOPKEEPER_MODE_ATTACK_TEAM)
            pokemon_is_enemy = TRUE;
        else
            pokemon_is_enemy = FALSE;
    }
    else
    {
        if (pokemon_info->is_not_team_member)
            pokemon_is_enemy = TRUE;
        else
            pokemon_is_enemy = FALSE;
        if (pokemon_info->is_not_team_member && pokemon_info->is_ally)
            pokemon_is_enemy = FALSE;
    }

    bool8 target_is_enemy;
    if (target_data->shopkeeper != SHOPKEEPER_MODE_NORMAL)
    {
        if (target_data->shopkeeper == SHOPKEEPER_MODE_ATTACK_TEAM)
            target_is_enemy = TRUE;
        else
            target_is_enemy = FALSE;
    }
    else
    {
        if (target_data->is_not_team_member)
            target_is_enemy = TRUE;
        else
            target_is_enemy = FALSE;
        if (target_data->is_not_team_member && target_data->is_ally)
            target_is_enemy = FALSE;
    }

    u32 target_is_decoy;
    if (target_data->curse_class_status.curse == STATUS_CURSE_DECOY)
        target_is_decoy = TRUE;
    else
        target_is_decoy = FALSE;

    return TREATMENT_DATA[decoy_ai_tracker][pokemon_is_enemy][target_is_enemy][target_is_decoy];
}
