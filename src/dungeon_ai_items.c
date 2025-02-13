#include "dungeon_ai_items.h"
#include "dg_random.h"
#include "direction.h"
#include "dungeon_capabilities_1.h"
#include "dungeon_util_static.h"
#include "item.h"
#include "item_util.h"

#define NUM_POTENTIAL_ROCK_TARGETS 20

u32 AI_THROWN_ITEM_PROBABILITIES[NUM_DIRECTIONS] = {0};
u32 AI_THROWN_ITEM_DIRECTIONS[NUM_DIRECTIONS] = {0};

extern volatile s32 AI_THROWN_ITEM_ACTION_CHOICE_COUNT;
extern struct bag_items *BAG_ITEMS_PTR_MIRROR;

extern void GetPossibleAiThrownItemDirections(struct entity *pokemon, s32 thrown_ai_flag, struct item *item, bool8 ignore_roll_chance);
extern void SetMonsterActionFields(struct action_data *action_pointer, u16 action);
extern bool8 IqSkillIsEnabled(struct entity *pokemon, u8 iq_skill);
extern const struct tile *GetTile(s32 x, s32 y);
extern bool8 TestItemAiFlag(s16 id, s32 aiFlag);
extern void GetPossibleAiArcItemTargets(struct entity *pokemon, struct item *item, struct position potential_targets[], bool8 ignore_roll_chance);
extern s32 GetDirectionTowardsPosition(struct position *origin_pos, struct position *target_pos);
extern struct item *GetItemInfo(struct entity *entity);
extern u32 GetAiUseItemProbability(struct entity *target_pokemon, struct item *item, u32 item_target_flags);
extern bool8 MonsterCanThrowItems(struct monster *pokemon);

bool8 EntityIsValid__0230E8F0(struct entity *entity)
{
    if (entity == NULL)
    {
        return FALSE;
    }
    return entity->type != ENTITY_NOTHING;
}

void AiDecideUseItem(struct entity *pokemon)
{
    struct monster *pokemon_info = GetEntInfo(pokemon);
    struct item *item;
    struct position potential_target_positions[NUM_POTENTIAL_ROCK_TARGETS];
    s32 i;
    u32 chosen_target_index;
    if (CheckVariousConditions(pokemon))
    {
        pokemon_info->use_held_item = FALSE;
        return;
    }
    if (pokemon_info->use_held_item)
    {
        u8 selected_toolbox_index;
        item = &pokemon_info->held_item;
        if (!ItemExists(item->flags))
            return;

        selected_toolbox_index = HELD_ITEM_TOOLBOX_INDEX;
        enum item_category item_type = GetItemCategoryVeneer(item->id);
        if (item_type == CATEGORY_THROWN_LINE)
        {
            GetPossibleAiThrownItemDirections(pokemon, ITEM_AI_FLAG_TARGET_ENEMY, item, TRUE);
            for (i = 0; i < AI_THROWN_ITEM_ACTION_CHOICE_COUNT; i++)
            {
                if (DungeonRandOutcome__022EAB20(AI_THROWN_ITEM_PROBABILITIES[i]))
                {
                    SetMonsterActionFields(&pokemon_info->action, ACTION_THROW_ITEM_AI);
                    pokemon_info->action.action_parameters[0].action_use_idx = selected_toolbox_index;
                    pokemon_info->action.action_parameters[0].item_pos.x = pokemon->pos.x;
                    pokemon_info->action.action_parameters[0].item_pos.y = pokemon->pos.y;
                    pokemon_info->action.direction = (enum direction_id) (AI_THROWN_ITEM_DIRECTIONS[i] & DIRECTION_MASK);
                    break;
                }
            }
            if (i == AI_THROWN_ITEM_ACTION_CHOICE_COUNT)
            {
                SetMonsterActionFields(&pokemon_info->action, ACTION_SECOND_THOUGHTS);
            }
        }
        else if (item_type == CATEGORY_THROWN_ARC)
        {
            GetPossibleAiArcItemTargets(pokemon, item, potential_target_positions, TRUE);
            if (AI_THROWN_ITEM_ACTION_CHOICE_COUNT != 0)
            {
                chosen_target_index = DungeonRandInt(AI_THROWN_ITEM_ACTION_CHOICE_COUNT);
                SetMonsterActionFields(&pokemon_info->action, ACTION_THROW_ITEM_AI);
                pokemon_info->action.action_parameters[0].action_use_idx = selected_toolbox_index;
                pokemon_info->action.action_parameters[0].item_pos.x = pokemon->pos.x;
                pokemon_info->action.action_parameters[0].item_pos.y = pokemon->pos.y;
                pokemon_info->action.direction = (enum direction_id) (GetDirectionTowardsPosition(&pokemon->pos, &potential_target_positions[chosen_target_index]) & DIRECTION_MASK);
                pokemon_info->action.item_target_position = potential_target_positions[chosen_target_index];
            }
            else
            {
                SetMonsterActionFields(&pokemon_info->action, ACTION_SECOND_THOUGHTS);
            }
        }
        else if (item_type == CATEGORY_BERRIES_SEEDS_VITAMINS || item_type == CATEGORY_FOOD_GUMMIES)
        {
            SetMonsterActionFields(&pokemon_info->action, ACTION_EAT_AI);
            pokemon_info->action.action_parameters[0].action_use_idx = selected_toolbox_index;
            pokemon_info->action.action_parameters[0].item_pos.x = pokemon->pos.x;
            pokemon_info->action.action_parameters[0].item_pos.y = pokemon->pos.y;
        }
        else
        {
            SetMonsterActionFields(&pokemon_info->action, ACTION_SECOND_THOUGHTS);
        }
    }
    else if (IqSkillIsEnabled(pokemon, IQ_ITEM_MASTER))
    {
        s32 thrown_ai_flag;
        for (s32 toolbox_index = 1; toolbox_index < INVENTORY_SIZE; toolbox_index++)
        {
            u8 selected_toolbox_index;
            if (toolbox_index == 1)
            {
                item = &pokemon_info->held_item;
                selected_toolbox_index = HELD_ITEM_TOOLBOX_INDEX;
            }
            else if (toolbox_index == 0)
            {
                // This seems unused. toolbox_index can never be 0.
                const struct tile *map_tile = GetTile(pokemon->pos.x, pokemon->pos.y);
                if (map_tile->object != NULL && map_tile->object->type == ENTITY_ITEM)
                {
                    item = GetItemInfo(map_tile->object);
                    selected_toolbox_index = GROUND_ITEM_TOOLBOX_INDEX;
                }
                else
                {
                    continue;
                }
            }
            else if (pokemon_info->is_team_leader)
            {
                item = &BAG_ITEMS_PTR_MIRROR->bag_items->bag_items[toolbox_index - 2];
                selected_toolbox_index = toolbox_index - 1;
            }
            else
            {
                return;
            }

            u8 item_flags = item->flags;
            if (!ItemExists(item_flags) || item->flags & ITEM_FLAG_IN_SHOP)
                continue;

            if (ItemSticky(item_flags))
                continue;

            if (TestItemAiFlag(item->id, ITEM_AI_FLAG_TARGET_SELF))
            {
                u32 item_weight = GetAiUseItemProbability(pokemon, item, ITEM_TARGET_ALLY);
                if (item_weight != 0)
                {
                    enum item_category item_type = GetItemCategoryVeneer(item->id);
                    if (!(item_type == CATEGORY_ORBS && !pokemon_info->is_not_team_member) && DungeonRandOutcome__022EAB20(item_weight))
                    {
                        if (item_type == CATEGORY_ORBS)
                            SetMonsterActionFields(&pokemon_info->action, ACTION_USE_ORB);
                        else
                            SetMonsterActionFields(&pokemon_info->action, ACTION_EAT_AI);

                        pokemon_info->action.action_parameters[0].action_use_idx = selected_toolbox_index;
                        pokemon_info->action.action_parameters[0].item_pos.x = pokemon->pos.x;
                        pokemon_info->action.action_parameters[0].item_pos.y = pokemon->pos.y;
                        return;
                    }
                }
            }

            if (MonsterCanThrowItems(pokemon_info))
            {
                for (thrown_ai_flag = ITEM_AI_FLAG_TARGET_ALLY; thrown_ai_flag < NUM_ITEM_AI_FLAGS; thrown_ai_flag++)
                {
                    if (TestItemAiFlag(item->id, thrown_ai_flag))
                    {
                        if (GetItemCategoryVeneer(item->id) == CATEGORY_THROWN_ARC)
                        {
                            GetPossibleAiArcItemTargets(pokemon, item, potential_target_positions, FALSE);
                            if (AI_THROWN_ITEM_ACTION_CHOICE_COUNT != 0)
                            {
                                chosen_target_index = DungeonRandInt(AI_THROWN_ITEM_ACTION_CHOICE_COUNT);
                                SetMonsterActionFields(&pokemon_info->action, ACTION_THROW_ITEM_AI);
                                pokemon_info->action.action_parameters[0].action_use_idx = selected_toolbox_index;
                                pokemon_info->action.action_parameters[0].item_pos.x = pokemon->pos.x;
                                pokemon_info->action.action_parameters[0].item_pos.y = pokemon->pos.y;
                                pokemon_info->action.direction = (enum direction_id) (GetDirectionTowardsPosition(&pokemon->pos, &potential_target_positions[chosen_target_index]) & DIRECTION_MASK);
                                pokemon_info->action.item_target_position = potential_target_positions[chosen_target_index];
                                return;
                            }
                        }
                        else
                        {
                            GetPossibleAiThrownItemDirections(pokemon, thrown_ai_flag, item, FALSE);
                            for (i = 0; i < AI_THROWN_ITEM_ACTION_CHOICE_COUNT; i++)
                            {
                                if (DungeonRandOutcome__022EAB20(AI_THROWN_ITEM_PROBABILITIES[i]))
                                {
                                    SetMonsterActionFields(&pokemon_info->action, ACTION_THROW_ITEM_AI);
                                    pokemon_info->action.action_parameters[0].action_use_idx = selected_toolbox_index;
                                    pokemon_info->action.action_parameters[0].item_pos.x = pokemon->pos.x;
                                    pokemon_info->action.action_parameters[0].item_pos.y = pokemon->pos.y;
                                    pokemon_info->action.direction = (enum direction_id) (AI_THROWN_ITEM_DIRECTIONS[i] & DIRECTION_MASK);
                                    return;
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
