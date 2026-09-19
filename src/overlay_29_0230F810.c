#include "overlay_29_0230F810.h"
#include "dungeon.h"
#include "dungeon_ai_items_1.h"
#include "dungeon_ai_targeting.h"
#include "dungeon_items.h"
#include "dungeon_pokemon_attributes.h"
#include "dungeon_pokemon_attributes_1.h"
#include "dungeon_util_1.h"
#include "dungeon_util_2.h"
#include "dungeon_util_static.h"
#include "item_util.h"
#include "joined_at_checks.h"
#include "main_0200D81C.h"
#include "main_0200ECFC.h"
#include "main_0200EDC0.h"
#include "overlay_29_0230F8AC.h"
#include "overlay_29_022E1610.h"
#include "overlay_29_022EAC7C.h"
#include "overlay_29_022EC7E8.h"
#include "overlay_29_022F52BC.h"
#include "overlay_29_02344AF8.h"
#include "overlay_29_02348D00.h"
#include "overlay_29_0234B4BC.h"
#include "overlay_29_023456BC.h"

#ifdef JAPAN
#define MESSAGE_C5E 0x99D
#define MESSAGE_C5F 0x99E
#define MESSAGE_C60 0x99F
#define MESSAGE_C61 0x9A0
#define MESSAGE_C62 0x9A1
#define MESSAGE_C63 0x9A2
#else
#define MESSAGE_C5E 0xC5E
#define MESSAGE_C5F 0xC5F
#define MESSAGE_C60 0xC60
#define MESSAGE_C61 0xC61
#define MESSAGE_C62 0xC62
#define MESSAGE_C63 0xC63
#endif

extern struct dungeon *DUNGEON_PTR[];

extern struct bag_items *BAG_ITEMS_PTR_MIRROR;

extern bool8 GetExclusiveItemForMonsterFromBag(struct item *item,
                                               enum exclusive_item_effect_id effect_id,
                                               s16 monster_id, enum type_id type1,
                                               enum type_id type2);
extern void UseThrowableItem(struct entity *entity);
extern void ov29_022F9EA0(struct entity *entity);
extern void ov29_02347040(void);
extern bool8 ov29_02345004(struct item *item);
extern s32 ov29_02348D3C(struct item *item);
extern bool8 ov29_02348DD8(struct entity *entity, struct item *item, bool8 a);
extern void ov29_02348ECC(struct item *item, s32 a);

void ov29_0230F140(struct entity *entity)
{
    UseSingleUseItemSelf(entity);
}

void ov29_0230F14C(struct entity *entity)
{
    UseThrowableItem(entity);
}

void ov29_0230F158(struct entity *entity)
{
    TryNonLeaderItemPickUp(entity);
}

void TryNonLeaderItemPickUp(struct entity *entity)
{
    s32 slot_ids[INVENTORY_SIZE + 1];
    struct item *slots[INVENTORY_SIZE + 1];
    struct monster *monster;
    struct tile *tile;
    struct entity *object;
    struct item *item;
    struct item *slot;
    bool8 pick_up;
    s32 count;
    s32 best;
    struct item *bag;
    s32 best_quantity;
    s32 item_id;
    int i;
    bool8 bag_enabled;
    s32 quantity;

    monster = GetEntInfo(entity);
    tile = GetTileAtEntity(entity);
    object = tile->object;
    if (object == NULL)
        return;
    if (IsFloorOver())
        return;
    SubstitutePlaceholderStringTags(0, entity, 0);
    if (monster->is_team_leader)
        return;
    if (monster->shopkeeper == SHOPKEEPER_MODE_SHOPKEEPER)
        return;
    if (IsExperienceLocked(monster))
        return;
    if (monster->monster_behavior == BEHAVIOR_RESCUE_TARGET)
        return;

    monster = GetEntInfo(entity);
    pick_up = TRUE;
    item = GetItemInfo(object);
    if (monster->is_not_team_member && IsItemUnkMissionItem2(item))
        return;
    if ((item->flags & ITEM_FLAG_IN_SHOP)
        || (!monster->is_not_team_member && (tile->terrain_flags & TERRAIN_TYPE_SHOP)))
        pick_up = FALSE;
    if (!pick_up)
        return;

    if (ShouldMonsterRunAwayAndShowEffect(entity, TRUE)) {
        PrepareItemForPrinting__02345728(0, item);
        SubstitutePlaceholderStringTags(0, entity, 0);
        LogMessageByIdWithPopup(entity, MESSAGE_C5E);
        return;
    }

    if (!monster->is_not_team_member
        && GetItemCategoryVeneer(item->id) == CATEGORY_POKE) {
        if (monster->is_not_team_member)
            PlaySeByIdIfNotSilence(0x1305);
        else
            PlaySeByIdIfNotSilence(0x1308);
        if (IqSkillIsEnabled(entity, IQ_COIN_WATCHER))
            item->flags |= ITEM_FLAG_UNK_MONEY_QUANTITY;
        AddMoneyCarried(GetMoneyQuantity(item));
        PrepareItemForPrinting__02345728(0, item);
        RemoveGroundItem(&entity->pos, TRUE);
        LogMessageByIdWithPopup(entity, MESSAGE_C5F);
        return;
    }

    bag_enabled = DUNGEON_PTR[0]->bag_enabled;
    if (bag_enabled && !monster->is_not_team_member) {
        bag = BAG_ITEMS_PTR_MIRROR->bag_items->bag_items;
        for (best = 0; best < INVENTORY_SIZE; best++) {
            slots[best] = &bag[best];
            slot_ids[best] = best;
        }
        slots[INVENTORY_SIZE] = &monster->held_item;
        slot_ids[INVENTORY_SIZE] = -1;
        count = INVENTORY_SIZE + 1;
    }
    else {
        slots[0] = &monster->held_item;
        slot_ids[0] = -1;
        count = 1;
    }

    item_id = item->id;
    if (item_id < 0xB && !(item->flags & ITEM_FLAG_IN_SHOP)) {
        best = -1;
        best_quantity = -1;
        for (i = 0; i < count; i++) {
            if (!ItemExists(((const struct item **)slots)[i]->flags))
                continue;
            if (!(slots[i]->flags & ITEM_FLAG_IN_SHOP) && item_id == slots[i]->id
                && (item->flags & ITEM_FLAG_STICKY)
                       == (slots[i]->flags & ITEM_FLAG_STICKY)) {
                if (slots[i]->quantity == 99)
                    continue;
                if (best_quantity < slots[i]->quantity) {
                    best_quantity = slots[i]->quantity;
                    best = i;
                }
            }
        }
        if (best != -1) {
            slot = slots[best];
            quantity = slot->quantity + item->quantity;
            if (quantity >= 99)
                quantity = 99;
            slot->quantity = quantity;
            if (ItemSticky(item->flags))
                slot->flags |= ITEM_FLAG_STICKY;
            ov29_02347040();
            PrepareItemForPrinting__02345728(0, item);
            RemoveGroundItem(&entity->pos, TRUE);
            PlaySeByIdIfNotSilence(0x1304);
            if (slot_ids[best] < 0)
                LogMessageByIdWithPopup(entity, MESSAGE_C60);
            else
                LogMessageByIdWithPopup(entity, MESSAGE_C61);
            return;
        }
    }

    if (bag_enabled && !monster->is_not_team_member)
        count = GetCurrentBagCapacity();

    for (i = 0; i < count; i++) {
        if (!ItemExists(slots[i]->flags))
            break;
    }

    if (ov29_02348DD8(entity, item, TRUE))
        return;

    if (i == count) {
        PrepareItemForPrinting__02345728(0, item);
        LogMessageByIdWithPopup(entity, MESSAGE_C62);
        return;
    }

    if (monster->is_not_team_member)
        PlaySeByIdIfNotSilence(0x1305);
    else
        PlaySeByIdIfNotSilence(0x1304);

    if (slot_ids[i] < 0) {
        monster->held_item = *item;
        ov29_022F9EA0(entity);
        PrepareItemForPrinting__02345728(0, item);
        RemoveGroundItem(&entity->pos, TRUE);
        LogMessageByIdWithPopup(entity, MESSAGE_C60);
        return;
    }

    quantity = ov29_02348D3C(item);
    if (ov29_02345004(item)) {
        SubstitutePlaceholderStringTags(0, entity, 0);
        LogMessageByIdWithPopup(entity, MESSAGE_C63);
        return;
    }
    PrepareItemForPrinting__02345728(0, item);
    RemoveGroundItem(&entity->pos, TRUE);
    LogMessageByIdWithPopup(entity, MESSAGE_C61);
    ov29_02348ECC(item, quantity);
}

bool8 GetExclusiveItemWithEffectFromBag(struct entity *entity, enum exclusive_item_effect_id effect_id, struct item *out)
{
    struct item item;
    struct monster *monster;

    if (!EntityIsValid__0230F008(entity))
        return FALSE;

    monster = GetEntInfo(entity);
    if (!GetExclusiveItemForMonsterFromBag(&item, effect_id, monster->apparent_id,
                                           monster->types[0], monster->types[1]))
        return FALSE;

    *out = item;
    return TRUE;
}

bool8 AuraBowIsActive(struct entity *entity)
{
    struct monster *monster;

    monster = GetEntInfo(entity);
    if (AbilityIsActiveVeneer(entity, ABILITY_KLUTZ))
        return FALSE;

    if (!ItemExists(monster->held_item.flags) || !IsAuraBow(monster->held_item.id))
        return FALSE;

    return HasHeldItem(entity, (enum item_id)monster->held_item.id);
}

void ov29_0230F728(struct entity *attacker, struct entity *defender, enum exclusive_item_effect_id effect_id, s32 flags)
{
    struct item item;
    struct monster *attacker_info;
    struct monster *defender_info;

    defender_info = GetEntInfo(defender);
    attacker_info = GetEntInfo(attacker);
    GetExclusiveItemForMonsterFromBag(&item, effect_id, defender_info->apparent_id,
                                      defender_info->types[0], defender_info->types[1]);
    attacker_info->exclusive_item_trigger_bitflags |= flags;
    attacker_info->field_0x190 = item.id;
}

u8 ExclusiveItemOffenseBoost(struct entity *entity, s32 idx)
{
    struct monster *monster = GetEntInfo(entity);

    return monster->exclusive_item_offense_boosts[idx];
}

u8 ExclusiveItemDefenseBoost(struct entity *entity, s32 idx)
{
    struct monster *monster = GetEntInfo(entity);

    return monster->exclusive_item_defense_boosts[idx];
}

s32 TeamMemberHasItemActive(struct entity **buf, enum item_id item_id)
{
    s16 i;
    s16 count;

    count = 0;
    for (i = 0; i < 4; i++) {
        struct entity *member = DUNGEON_PTR[0]->monster_slot_ptrs[i];

        if (EntityIsValid__0230F008(member) && ItemIsActive__0230F810(member, item_id)) {
            buf[count] = member;
            count++;
        }
    }

    return count;
}

bool8 ItemIsActive__0230F810(struct entity *entity, enum item_id item_id)
{
    if (AbilityIsActiveVeneer(entity, ABILITY_KLUTZ))
        return FALSE;

    return HasHeldItem(entity, item_id);
}

bool8 TeamMemberHasExclusiveItemEffectActive(enum exclusive_item_effect_id effect_id)
{
    s16 i;

    for (i = 0; i < 4; i++) {
        struct entity *member = DUNGEON_PTR[0]->monster_slot_ptrs[i];

        if (EntityIsValid__0230F008(member)
            && ExclusiveItemEffectIsActive__0230F8AC(member, effect_id)) {
            return TRUE;
        }
    }

    return FALSE;
}
