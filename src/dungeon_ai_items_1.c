#include "dungeon_ai_items_1.h"
#include "dungeon.h"
#include "dungeon_ai_attack.h"
#include "dungeon_ai_items.h"
#include "dungeon_ai_targeting_1.h"
#include "dungeon_util_static.h"
#include "item.h"
#include "targeting.h"

// dungeon_ai_items.c and dungeon_ai_items_1.c are split up to define AI_THROWN_ITEM_ACTION_CHOICE_COUNT differently.
// This needs to be marked as non-volatile here to match GetPossibleAiThrownItemDirections,
// but AiDecideUseItem needs it to be volatile to match.
extern s32 AI_THROWN_ITEM_ACTION_CHOICE_COUNT;
extern struct dungeon *DUNGEON_PTR[];

extern bool8 CanSeeTarget(struct entity *entity, struct entity *target_entity);
extern bool8 IsTargetInRange(struct entity *pokemon, struct entity *target_pokemon, s32 direction, s32 max_range);
extern u32 GetAiUseItemProbability(struct entity *target_pokemon, struct item *item, u32 item_target_flags);
extern s32 abs(s32 value);

void GetPossibleAiThrownItemDirections(struct entity *pokemon, s32 thrown_ai_flag, struct item *item, bool8 ignore_roll_chance)
{
    AI_THROWN_ITEM_ACTION_CHOICE_COUNT = 0;
    s32 i;
    for (i = 0; i < NUM_DIRECTIONS; i++)
    {
        AI_THROWN_ITEM_DIRECTION_IS_USED[i] = FALSE;
    }

    i = 0;
    do
    {
        struct entity *target_pokemon = DUNGEON_PTR[0]->active_monster_ptrs[i];
        if (!EntityIsValid__0230F008(target_pokemon))
            continue;

        if (pokemon == target_pokemon)
            continue;

        s32 targeting_flags;
        if (thrown_ai_flag == ITEM_AI_FLAG_TARGET_ALLY)
        {
            if (GetTreatmentBetweenMonsters(pokemon, target_pokemon, FALSE, FALSE) == TREATMENT_TREAT_AS_ALLY)
                targeting_flags = ITEM_TARGET_OTHER | ITEM_TARGET_ALLY;
            else
                continue;
        }
        else if (GetTreatmentBetweenMonsters(pokemon, target_pokemon, FALSE, TRUE) == TREATMENT_TREAT_AS_ENEMY)
            targeting_flags = ITEM_TARGET_OTHER;
        else
            continue;

        if (!CanSeeTarget(pokemon, target_pokemon))
            continue;

        s32 target_direction;
        s32 target_pos_x = target_pokemon->pos.x;
        s32 pokemon_pos_x = pokemon->pos.x;
        s32 distance_x = abs(pokemon_pos_x - target_pos_x);
        s32 target_pos_y = target_pokemon->pos.y;
        s32 pokemon_pos_y = pokemon->pos.y;
        s32 distance_y = abs(pokemon->pos.y - target_pos_y);
        if (GetEntInfo(pokemon)->long_toss_class_status.status == STATUS_NONE)
        {
            s32 distance = distance_x > distance_y ? distance_x : distance_y;
            if (distance > RANGED_ATTACK_RANGE)
                continue;
        }

        target_direction = -1;
        if (distance_x == distance_y)
        {
            if (pokemon_pos_x < target_pos_x && pokemon_pos_y < target_pos_y)
                target_direction = DIR_DOWN_RIGHT;
            else if (pokemon_pos_x < target_pos_x && pokemon_pos_y > target_pos_y)
                target_direction = DIR_UP_RIGHT;
            else if (pokemon_pos_x > target_pos_x && pokemon_pos_y > target_pos_y)
                target_direction = DIR_UP_LEFT;
            else
                target_direction = DIR_DOWN_LEFT;
        }
        else
        {
            if (pokemon_pos_x == target_pos_x && pokemon_pos_y < target_pos_y)
                target_direction = DIR_DOWN;
            else if (pokemon_pos_x < target_pos_x && pokemon_pos_y == target_pos_y)
                target_direction = DIR_RIGHT;
            else if (pokemon_pos_x == target_pos_x && pokemon_pos_y > target_pos_y)
                target_direction = DIR_UP;
            else if (pokemon_pos_x > target_pos_x && pokemon_pos_y == target_pos_y)
                target_direction = DIR_LEFT;
        }

        if (target_direction >= DIR_DOWN && !AI_THROWN_ITEM_DIRECTION_IS_USED[target_direction] && IsTargetInRange(pokemon, target_pokemon, target_direction, RANGED_ATTACK_RANGE))
        {
            AI_THROWN_ITEM_DIRECTION_IS_USED[target_direction] = TRUE;
            AI_THROWN_ITEM_DIRECTIONS[AI_THROWN_ITEM_ACTION_CHOICE_COUNT] = target_direction;
            AI_THROWN_ITEM_PROBABILITIES[AI_THROWN_ITEM_ACTION_CHOICE_COUNT] = ignore_roll_chance ? 100 : GetAiUseItemProbability(target_pokemon, item, targeting_flags);
            AI_THROWN_ITEM_ACTION_CHOICE_COUNT++;
        }
    } while (++i < DUNGEON_MAX_POKEMON);
}

bool8 EntityIsValid__0230F008(struct entity *entity)
{
    if (entity == NULL)
    {
        return FALSE;
    }
    return entity->type != ENTITY_NOTHING;
}
