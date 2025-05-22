#include "dungeon_ai_items.h"
#include "dg_random.h"
#include "direction.h"
#include "dungeon_action.h"
#include "dungeon_ai_item_weight.h"
#include "dungeon_ai_items_1.h"
#include "dungeon_capabilities_1.h"
#include "dungeon_logic_2.h"
#include "dungeon_map_access.h"
#include "dungeon_pokemon_attributes.h"
#include "dungeon_pokemon_attributes_1.h"
#include "dungeon_util_static.h"
#include "item.h"
#include "item_util.h"
#include "item_util_3.h"
#include "overlay_29_022E1610.h"
#include "position_util.h"

#define NUM_POTENTIAL_ROCK_TARGETS 20

bool8 AI_THROWN_ITEM_DIRECTION_IS_USED[NUM_DIRECTIONS] = {0};
u32 AI_THROWN_ITEM_PROBABILITIES[NUM_DIRECTIONS] = {0};
u32 AI_THROWN_ITEM_DIRECTIONS[NUM_DIRECTIONS] = {0};

extern volatile s32 AI_THROWN_ITEM_ACTION_CHOICE_COUNT;
extern struct bag_items *BAG_ITEMS_PTR_MIRROR;

bool8 EntityIsValid__0230E8F0(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return entity->type != ENTITY_NOTHING;
}

void AiDecideUseItem(struct entity *entity)
{
    struct monster *pokemon_info = GetEntInfo(entity);
    struct item *item;
    struct position potential_target_positions[NUM_POTENTIAL_ROCK_TARGETS];
    s32 i;
    u32 chosen_target_index;
    if (CheckVariousConditions(entity))
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
            GetPossibleAiThrownItemDirections(entity, ITEM_FLAG_THROWABLE_AT_ENEMY, item, TRUE);
            for (i = 0; i < AI_THROWN_ITEM_ACTION_CHOICE_COUNT; i++)
            {
                if (DungeonRandOutcome__022EAB20(AI_THROWN_ITEM_PROBABILITIES[i]))
                {
                    SetMonsterActionFields(&pokemon_info->action, ACTION_THROW_ITEM_AI);
                    pokemon_info->action.action_parameters[0].action_use_idx = selected_toolbox_index;
                    pokemon_info->action.action_parameters[0].item_pos.x = entity->pos.x;
                    pokemon_info->action.action_parameters[0].item_pos.y = entity->pos.y;
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
            GetPossibleAiArcItemTargets(entity, item, potential_target_positions, TRUE);
            if (AI_THROWN_ITEM_ACTION_CHOICE_COUNT != 0)
            {
                chosen_target_index = DungeonRandInt(AI_THROWN_ITEM_ACTION_CHOICE_COUNT);
                SetMonsterActionFields(&pokemon_info->action, ACTION_THROW_ITEM_AI);
                pokemon_info->action.action_parameters[0].action_use_idx = selected_toolbox_index;
                pokemon_info->action.action_parameters[0].item_pos.x = entity->pos.x;
                pokemon_info->action.action_parameters[0].item_pos.y = entity->pos.y;
                pokemon_info->action.direction = (enum direction_id) (GetDirectionTowardsPosition(&entity->pos, &potential_target_positions[chosen_target_index]) & DIRECTION_MASK);
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
            pokemon_info->action.action_parameters[0].item_pos.x = entity->pos.x;
            pokemon_info->action.action_parameters[0].item_pos.y = entity->pos.y;
        }
        else
        {
            SetMonsterActionFields(&pokemon_info->action, ACTION_SECOND_THOUGHTS);
        }
    }
    else if (IqSkillIsEnabled(entity, IQ_ITEM_MASTER))
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
                const struct tile *map_tile = GetTile(entity->pos.x, entity->pos.y);
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

            // Item flags need to be marked as volatile in the struct to match.
            u8 item_flags = ((struct item_volatile*)item)->flags;
            if (!ItemExists(item_flags) || item->flags & ITEM_FLAG_IN_SHOP)
                continue;

            if (ItemSticky(item_flags))
                continue;

            if (TestItemAiFlag(item->id, ITEM_FLAG_CONSUMABLE))
            {
                u32 item_weight = GetAiUseItemProbability(entity, item, ITEM_TARGET_ALLY);
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
                        pokemon_info->action.action_parameters[0].item_pos.x = entity->pos.x;
                        pokemon_info->action.action_parameters[0].item_pos.y = entity->pos.y;
                        return;
                    }
                }
            }

            if (MonsterCanThrowItems(pokemon_info))
            {
                for (thrown_ai_flag = ITEM_FLAG_THROWABLE_AT_ALLY; thrown_ai_flag < NUM_ITEM_AI_FLAGS; thrown_ai_flag++)
                {
                    if (TestItemAiFlag(item->id, thrown_ai_flag))
                    {
                        if (GetItemCategoryVeneer(item->id) == CATEGORY_THROWN_ARC)
                        {
                            GetPossibleAiArcItemTargets(entity, item, potential_target_positions, FALSE);
                            if (AI_THROWN_ITEM_ACTION_CHOICE_COUNT != 0)
                            {
                                chosen_target_index = DungeonRandInt(AI_THROWN_ITEM_ACTION_CHOICE_COUNT);
                                SetMonsterActionFields(&pokemon_info->action, ACTION_THROW_ITEM_AI);
                                pokemon_info->action.action_parameters[0].action_use_idx = selected_toolbox_index;
                                pokemon_info->action.action_parameters[0].item_pos.x = entity->pos.x;
                                pokemon_info->action.action_parameters[0].item_pos.y = entity->pos.y;
                                pokemon_info->action.direction = (enum direction_id) (GetDirectionTowardsPosition(&entity->pos, &potential_target_positions[chosen_target_index]) & DIRECTION_MASK);
                                pokemon_info->action.item_target_position = potential_target_positions[chosen_target_index];
                                return;
                            }
                        }
                        else
                        {
                            GetPossibleAiThrownItemDirections(entity, thrown_ai_flag, item, FALSE);
                            for (i = 0; i < AI_THROWN_ITEM_ACTION_CHOICE_COUNT; i++)
                            {
                                if (DungeonRandOutcome__022EAB20(AI_THROWN_ITEM_PROBABILITIES[i]))
                                {
                                    SetMonsterActionFields(&pokemon_info->action, ACTION_THROW_ITEM_AI);
                                    pokemon_info->action.action_parameters[0].action_use_idx = selected_toolbox_index;
                                    pokemon_info->action.action_parameters[0].item_pos.x = entity->pos.x;
                                    pokemon_info->action.action_parameters[0].item_pos.y = entity->pos.y;
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

