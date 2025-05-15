#include "dungeon_ai_item_weight.h"
#include "dungeon_ai_targeting_1.h"
#include "dungeon_logic.h"
#include "dungeon_map_access.h"
#include "dungeon_pokemon_attributes_1.h"
#include "dungeon_statuses.h"
#include "dungeon_util.h"
#include "dungeon_util_static.h"
#include "main_02052874.h"
#include "main_02054BE0.h"
#include "number_util.h"
#include "overlay_29_0231E9F0.h"
#include "targeting.h"
#include "util.h"

u32 GetAiUseItemProbability(struct entity *item_consumer, struct item *item, u32 flags)
{
    u32 item_weight = 0;
    struct monster *pokemon_info = GetEntInfo(item_consumer);
    bool8 target_other = (flags & ITEM_TARGET_OTHER) != 0;
    bool8 target_ally = (flags & ITEM_TARGET_ALLY) != 0;
    switch (item->id)
    {
        case ITEM_STICK:
        case ITEM_IRON_THORN:
        case ITEM_SILVER_SPIKE:
        case ITEM_GOLD_FANG:
        case ITEM_CACNEA_SPIKE:
        case ITEM_CORSOLA_TWIG:
        case ITEM_GRAVELEROCK:
        case ITEM_GEO_PEBBLE:
        case ITEM_GOLD_THORN:
        case ITEM_RARE_FOSSIL:
            if (target_other)
                item_weight = 70;
            break;
        case ITEM_DIET_RIBBON:
            if (target_other && CeilFixedPoint(pokemon_info->belly) > 0)
                return 50;
            item_weight = 0;
            break;
        case ITEM_WHIFF_SPECS:
        case ITEM_NO_AIM_SCOPE:
            if (target_other)
                return 50;
            item_weight = 0;
            break;
        case ITEM_PATSY_BAND:
            item_weight = 40;
            break;
        case ITEM_ORAN_BERRY:
        case ITEM_SITRUS_BERRY:
            s32 pokemon_max_hp = pokemon_info->max_hp_stat + pokemon_info->max_hp_boost;
            if (pokemon_info->hp < Min(999, pokemon_max_hp) && pokemon_info->hp <= Min(999, pokemon_max_hp) / 4)
            {
                if (!target_other)
                    if (IsAdjacentToEnemy(item_consumer))
                        item_weight = 100;
                    else
                        item_weight = 50;
                else
                    item_weight = 50;
            }
            break;
        case ITEM_MIX_ELIXIR:
        case ITEM_MAX_ELIXIR:
            bool8 can_use_elixir = TRUE;
            if (item->id == ITEM_MIX_ELIXIR && pokemon_info->apparent_id != MONSTER_LINOONE && pokemon_info->apparent_id != MONSTER_LINOONE_SECONDARY)
                can_use_elixir = FALSE;
            if (can_use_elixir)
            {
                item_weight = 0;
                for (s32 i = 0; i < MAX_MON_MOVES; i++)
                {
                    bool8 move_exists;
                    struct move *move = &pokemon_info->moves.moves[i];
                    if (move->flags0 & MOVE_FLAG_EXISTS)
                        move_exists = TRUE;
                    else
                        move_exists = FALSE;
                    if (move_exists)
                    {
                        if (move->pp == 0)
                            item_weight += 30;

                        if (move->pp != GetMaxPpWrapper(move))
                            item_weight += 6;
                    }
                }
                item_weight = Min(item_weight, 99);
            }
            break;
        case ITEM_HEAL_SEED:
        case ITEM_GABITE_SCALE:
            if (MonsterHasNegativeStatus(item_consumer, TRUE))
                item_weight = 80;
            else
                item_weight = 0;
            break;
        case ITEM_PROTEIN:
            if (pokemon_info->offensive_stats[0] >= 250)
                item_weight = 0;
            else
                item_weight = 100;
            break;
        case ITEM_CALCIUM:
            if (pokemon_info->offensive_stats[1] >= 250)
                item_weight = 0;
            else
                item_weight = 100;
            break;
        case ITEM_IRON:
            if (pokemon_info->defensive_stats[0] >= 250)
                item_weight = 0;
            else
                item_weight = 100;
            break;
        case ITEM_ZINC:
            if (pokemon_info->defensive_stats[1] >= 250)
                item_weight = 0;
            else
                item_weight = 100;
            break;
        case ITEM_LIFE_SEED:
            if (target_other)
                item_weight = 0;
            else if (IsAdjacentToEnemy(item_consumer))
                item_weight = 10;
            else
                item_weight = 100;
            break;
        case ITEM_EYEDROP_SEED:
            if (CanSeeInvisibleMonsters(item_consumer))
                return 0;

            if (IsAdjacentToEnemy(item_consumer))
                item_weight = 80;
            else
                item_weight = 5;
            break;
        case ITEM_QUICK_SEED:
            if (GetEntInfo(item_consumer)->speed_stage > MAX_SPEED_STAGE - 1)
                return 0;

            if (IsAdjacentToEnemy(item_consumer))
                item_weight = 80;
            else
                item_weight = 5;
            break;
        case ITEM_X_EYE_SEED:
            if (pokemon_info->blinker_class_status.blinded == STATUS_BLINKER_CROSS_EYED)
                return 0;

            if (IsAdjacentToEnemy(item_consumer))
                item_weight = 80;
            else
                item_weight = 5;
            break;
        case ITEM_CHERI_BERRY:
            if (pokemon_info->burn_class_status.burn != STATUS_BURN_PARALYSIS)
                return 0;

            if (IsAdjacentToEnemy(item_consumer))
                item_weight = 80;
            else
                item_weight = 30;
            break;
        case ITEM_TOTTER_SEED:
            if (pokemon_info->cringe_class_status.cringe == STATUS_CRINGE_CONFUSED)
                return 0;

            if (IsAdjacentToEnemy(item_consumer))
                item_weight = 80;
            else
                item_weight = 15;
            break;
        case ITEM_PECHA_BERRY:
            if (!ENTITY_POISONED(pokemon_info))
                return 0;

            else if (IsAdjacentToEnemy(item_consumer))
                item_weight = 100;
            else
                item_weight = 50;
            break;
        case ITEM_BLINKER_SEED:
            if (IsBlinded(item_consumer, TRUE))
                return 0;

            if (IsAdjacentToEnemy(item_consumer))
                item_weight = 80;
            else
                item_weight = 5;
            break;
        case ITEM_WARP_SEED:
            if (!target_ally)
            {
                if (IsAdjacentToEnemy(item_consumer))
                    item_weight = 40;
                else
                    item_weight = 5;
            }
            else
            {
                s32 pokemon_max_hp = pokemon_info->max_hp_stat + pokemon_info->max_hp_boost;
                if (pokemon_info->hp < Min(999, pokemon_max_hp) && pokemon_info->hp < 20)
                {
                    if (!target_other)
                        if (IsAdjacentToEnemy(item_consumer))
                            item_weight = 100;
                        else
                            item_weight = 50;
                    else
                        item_weight = 50;
                }
            }
            break;
        case ITEM_SLEEP_SEED:
            if (pokemon_info->sleep_class_status.sleep == STATUS_SLEEP_SLEEP)
                return 0;
            if (pokemon_info->sleep_class_status.sleep == STATUS_SLEEP_NAPPING)
                return 0;
            if (pokemon_info->sleep_class_status.sleep == STATUS_SLEEP_NIGHTMARE)
                return 0;

            if (IsAdjacentToEnemy(item_consumer))
                item_weight = 80;
            else
                item_weight = 5;
            break;
        case ITEM_CHESTO_BERRY:
            if (pokemon_info->sleep_class_status.sleep == STATUS_SLEEPLESS)
                return 0;
            item_weight = 5;
            break;
        case ITEM_JOY_SEED:
            if (pokemon_info->level < 99)
                item_weight = 80;
            else
                item_weight = 0;
            break;
        case ITEM_GINSENG:
            item_weight = 80;
            break;
        case ITEM_RAWST_BERRY:
            if (pokemon_info->burn_class_status.burn == STATUS_BURN_BURN)
                return 50;

            item_weight = 0;
            break;
        case ITEM_HUNGER_SEED:
            if (CeilFixedPoint(pokemon_info->belly) > 0)
                return 50;

            item_weight = 0;
            break;
        case ITEM_DOOM_SEED:
            if (pokemon_info->level > 1)
                item_weight = 80;
            else
                item_weight = 0;
            break;
        case ITEM_STUN_SEED:
            if (pokemon_info->frozen_class_status.freeze == STATUS_FROZEN_PETRIFIED)
                return 0;
            if (IsAdjacentToEnemy(item_consumer))
                item_weight = 80;
            else
                item_weight = 5;
            break;
        case ITEM_BLAST_SEED:
            if (IsAdjacentToEnemy(item_consumer))
                item_weight = 80;
            else
                item_weight = 30;
            break;
        case ITEM_DOUGH_SEED:
            if (pokemon_info->is_not_team_member)
                item_weight = 0;
            else
                item_weight = 100;
            break;
        case ITEM_SLIP_SEED:
            enum mobility_type mobility_type = GetMobilityType(pokemon_info->id);
            bool8 can_use_slip_seed = mobility_type == MOBILITY_NORMAL || mobility_type == MOBILITY_LAVA;
            if (!can_use_slip_seed || pokemon_info->invisible_class_status.status == STATUS_INVISIBLE_SLIP)
                item_weight = 0;
            else if (IsAdjacentToEnemy(item_consumer))
                item_weight = 10;
            else
                item_weight = 100;
            break;
        case ITEM_GONE_PEBBLE:
            if (pokemon_info->reflect_class_status.reflect == STATUS_REFLECT_ENDURING)
                item_weight = 0;
            else if (IsAdjacentToEnemy(item_consumer))
                item_weight = 80;
            else
                item_weight = 0;
            break;
        case ITEM_VILE_SEED:
            if (target_other)
                item_weight = 70;
            else
                item_weight = 0;
            break;
        case ITEM_VIOLENT_SEED:
            if (pokemon_info->stat_modifiers.offensive_stages[1] >= 20)
                item_weight = 0;
            else
                item_weight = 80;
            break;
        case ITEM_VANISH_SEED:
            if (pokemon_info->invisible_class_status.status != STATUS_INVISIBLE_INVISIBLE)
                item_weight = 80;
            else
                item_weight = 0;
            break;
        case ITEM_GRAVELYROCK:
            // BUG: FemaleToMaleForm is called, but the return value isn't used.
            // This means the AI only uses Gravelyrocks on male Bonsly/Sudowoodo, ignoring female ones.
            FemaleToMaleForm(pokemon_info->apparent_id);
            if (pokemon_info->apparent_id == MONSTER_BONSLY || pokemon_info->apparent_id == MONSTER_SUDOWOODO)
            {
                if (target_other)
                    item_weight = 70;
                else
                    item_weight = 100;
            }
            break;
        case ITEM_APPLE:
        case ITEM_BIG_APPLE:
        case ITEM_HUGE_APPLE:
            if (CeilFixedPoint(pokemon_info->belly) < 10)
                return 100;

            item_weight = 0;
            break;
        case ITEM_GRIMY_FOOD:
            item_weight = 30;
            break;
        case ITEM_ROLLCALL_ORB:
            if (target_other)
                item_weight = 0;
            else
                item_weight = 20;
            break;
        case ITEM_Y_RAY_SPECS:
        case ITEM_GAGGLE_SPECS:
        case ITEM_VIA_SEED:
        case ITEM_OREN_BERRY:
        case ITEM_WANDER_GUMMI:
            if (target_other)
                item_weight = 80;
            else
                item_weight = 0;
            break;
        case ITEM_DROPEYE_SEED:
            if (pokemon_info->blinker_class_status.blinded != STATUS_BLINKER_DROPEYE)
            {
                if (target_other)
                    item_weight = 80;
                else
                    item_weight = 0;
            }
            break;
        default:
            item_weight = 0;
            break;
    }
    return item_weight;
}

bool8 IsAdjacentToEnemy(struct entity *entity)
{
    for (s32 direction = 0; direction < NUM_DIRECTIONS; direction++)
    {
        struct tile *map_tile = GetTile(entity->pos.x + DIRECTIONS_XY[direction].x, entity->pos.y + DIRECTIONS_XY[direction].y);
        if (map_tile->monster != NULL)
        {
            s32 no_pokemon = map_tile->monster->type == ENTITY_NOTHING;
            if (no_pokemon != TRUE && GetTreatmentBetweenMonsters(entity, map_tile->monster, FALSE, TRUE) == TREATMENT_TREAT_AS_ENEMY)
                return TRUE;
        }
    }
    return FALSE;
}
