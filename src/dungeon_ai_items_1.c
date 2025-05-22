#include "dungeon_ai_items_1.h"
#include "dg_random.h"
#include "dungeon.h"
#include "dungeon_ai_attack.h"
#include "dungeon_ai_attack_1.h"
#include "dungeon_ai_item_weight.h"
#include "dungeon_ai_items.h"
#include "dungeon_ai_targeting_1.h"
#include "dungeon_util_static.h"
#include "dungeon_visibility.h"
#include "item.h"
#include "main_0208655C.h"
#include "targeting.h"
#include "util.h"

// dungeon_ai_items.c and dungeon_ai_items_1.c are split up to define AI_THROWN_ITEM_ACTION_CHOICE_COUNT differently.
// This needs to be marked as non-volatile here to match GetPossibleAiThrownItemDirections,
// but AiDecideUseItem needs it to be volatile to match.
extern s32 AI_THROWN_ITEM_ACTION_CHOICE_COUNT;
extern struct dungeon *DUNGEON_PTR[];

void GetPossibleAiThrownItemDirections(struct entity *entity, s32 ally_or_enemy, struct item *item, bool8 always_add)
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

        if (entity == target_pokemon)
            continue;

        s32 targeting_flags;
        if (ally_or_enemy == ITEM_FLAG_THROWABLE_AT_ALLY)
        {
            if (GetTreatmentBetweenMonsters(entity, target_pokemon, FALSE, FALSE) == TREATMENT_TREAT_AS_ALLY)
                targeting_flags = ITEM_TARGET_OTHER | ITEM_TARGET_ALLY;
            else
                continue;
        }
        else if (GetTreatmentBetweenMonsters(entity, target_pokemon, FALSE, TRUE) == TREATMENT_TREAT_AS_ENEMY)
            targeting_flags = ITEM_TARGET_OTHER;
        else
            continue;

        if (!CanSeeTarget(entity, target_pokemon))
            continue;

        enum direction_id target_direction;
        s32 target_pos_x = target_pokemon->pos.x;
        s32 pokemon_pos_x = entity->pos.x;
        s32 distance_x = abs(pokemon_pos_x - target_pos_x);
        s32 target_pos_y = target_pokemon->pos.y;
        s32 pokemon_pos_y = entity->pos.y;
        s32 distance_y = abs(entity->pos.y - target_pos_y);
        if (GetEntInfo(entity)->long_toss_class_status.status == STATUS_LONG_TOSS_NONE)
        {
            s32 distance = distance_x > distance_y ? distance_x : distance_y;
            if (distance > RANGED_ATTACK_RANGE)
                continue;
        }

        target_direction = DIR_NONE;
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

        if (target_direction >= DIR_DOWN && !AI_THROWN_ITEM_DIRECTION_IS_USED[target_direction] && IsTargetInRange(entity, target_pokemon, target_direction, RANGED_ATTACK_RANGE))
        {
            AI_THROWN_ITEM_DIRECTION_IS_USED[target_direction] = TRUE;
            AI_THROWN_ITEM_DIRECTIONS[AI_THROWN_ITEM_ACTION_CHOICE_COUNT] = target_direction;
            AI_THROWN_ITEM_PROBABILITIES[AI_THROWN_ITEM_ACTION_CHOICE_COUNT] = always_add ? 100 : GetAiUseItemProbability(target_pokemon, item, targeting_flags);
            AI_THROWN_ITEM_ACTION_CHOICE_COUNT++;
        }
    } while (++i < DUNGEON_MAX_POKEMON);
}

bool8 EntityIsValid__0230F008(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return entity->type != ENTITY_NOTHING;
}

void GetPossibleAiArcItemTargets(struct entity *user, struct item *item, struct position positions[], bool8 always_add_position)
{
    AI_THROWN_ITEM_ACTION_CHOICE_COUNT = 0;
    for (s32 i = 0; i < DUNGEON_MAX_POKEMON; i++)
    {
        struct entity *target_pokemon = DUNGEON_PTR[0]->active_monster_ptrs[i];
        if (EntityIsValid__0230F008(target_pokemon) && user != target_pokemon &&
            CanSeeTarget(user, target_pokemon) && GetTreatmentBetweenMonsters(user, target_pokemon, FALSE, TRUE) == TREATMENT_TREAT_AS_ENEMY)
        {
            s32 distance_y = abs(target_pokemon->pos.y - user->pos.y);
            s32 distance_x = abs(target_pokemon->pos.x - user->pos.x);
            if (Max(distance_x, distance_y) <= 10)
            {
                if (!always_add_position)
                {
                    u32 item_weight = GetAiUseItemProbability(target_pokemon, item, ITEM_TARGET_OTHER);
                    if (!DungeonRandOutcome__022EAB20(item_weight))
                    {
                        continue;
                    }
                }
                positions[AI_THROWN_ITEM_ACTION_CHOICE_COUNT].x = target_pokemon->pos.x;
                positions[AI_THROWN_ITEM_ACTION_CHOICE_COUNT].y = target_pokemon->pos.y;
                AI_THROWN_ITEM_ACTION_CHOICE_COUNT++;
            }
        }
    }
}
