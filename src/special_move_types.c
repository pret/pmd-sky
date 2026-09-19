#include "special_move_types.h"
#include "dungeon_action_helper.h"
#include "dungeon_parameters_2.h"
#include "dungeon_util_static.h"
#include "natural_gift_data.h"
#include "overlay_29_0231A9D4.h"
#include "overlay_29_022FBA54.h"
#include "weather.h"
#include "dungeon_util_2.h"
#include "move_orb_effects.h"
#include "overlay_29_022E406C.h"
#include "overlay_29_0231B194.h"
#include "overlay_29_02344AF8.h"
#include "overlay_29_0234B104.h"
#include "overlay_29_0234B340.h"

extern struct dungeon *DUNGEON_PTR[2];

extern void GetTreasureBoxChances(s16 monster_id, s16 *chances);
extern struct entity *ov29_0232E80C(void);

#ifdef JAPAN
#define MESSAGE_C3B 0x97A
#define MESSAGE_C3C 0x97B
#define MESSAGE_C3D 0x97C
#else
#define MESSAGE_C3B 0xC3B
#define MESSAGE_C3C 0xC3C
#define MESSAGE_C3D 0xC3D
#endif

extern void UseMove(struct entity*, s16, s32, s32, s32);

const struct natural_gift_item_info* GetEntityNaturalGiftInfo(struct entity* entity)
{
    if (IsMonster__0231A9D4(entity)) {
        struct monster *monster = GetEntInfo(entity);
        if (((struct item_volatile*)(&monster->held_item))->id != ITEM_NOTHING) {
            bool8 found_item = FALSE;
            s16 i = 0;
            s16 natural_gift_item_id;

            loop_start:
            natural_gift_item_id = ((volatile struct natural_gift_item_info*)NATURAL_GIFT_ITEM_TABLE)[i].item_id;
            if (natural_gift_item_id != ITEM_NOTHING)
            {
                if (monster->held_item.id == natural_gift_item_id)
                    found_item = TRUE;
                else
                {
                    i++;
                    goto loop_start;
                }
            }

            if (found_item)
                return &NATURAL_GIFT_ITEM_TABLE[i];
        }
    }
    return NULL;
}

enum type_id GetEntityWeatherBallType(struct entity* entity)
{
    return WEATHER_BALL_TYPE_TABLE[GetApparentWeather(entity)];
}

void UseMoveByMoveId(struct entity *entity, enum move_id move_id, bool8 add_move_if_not_exists)
{
    if (!IsMonster__0231A9D4(entity))
        return;

    s16 move_index = FindMoveOnMonster(entity, move_id);
    if (add_move_if_not_exists && move_index < 0) {
        struct monster *monster = GetEntInfo(entity);
        SetActionUseMoveAi(&monster->action, 0, DIR_DOWN);
        monster->moves.moves[0].flags0 = MOVE_FLAG_EXISTS;
        monster->moves.moves[0].flags2 = 0;
        monster->moves.moves[0].id = move_id;
        monster->moves.moves[0].pp = 1;
        monster->moves.moves[0].ginseng = 0;
        move_index = 0;
    }
    UseMove(entity, move_index, 1, 0, 0);
}

void ov29_0231AFB4(void)
{
    s32 i;

    for (i = 0; i < 2; i++) {
        struct monster_id_struct *slots = &DUNGEON_PTR[0]->storm_drain_lightning_rod[i * 2];
        s32 j;
        for (j = 0; j < 2; j++) {
            slots[j].entity = NULL;
            slots[j].entity_id = 0;
        }
    }
}

void ov29_0231B008(void)
{
    s32 i;

    for (i = 0; i < 2; i++) {
        struct monster_id_struct *slots = &DUNGEON_PTR[0]->storm_drain_lightning_rod[i * 2];
        s32 j;
        for (j = 0; j < 2; j++) {
            slots[j].entity = NULL;
            slots[j].entity_id = 2;
        }
    }
}

void ActivateMotorDrive(struct entity *entity)
{
    LogMessageByIdWithPopupCheckParticipants(entity, NULL, MESSAGE_C3B, 2, ABILITY_MOTOR_DRIVE);
    BoostSpeedOneStage(entity, entity, 0, TRUE);
}

void TryActivateFrisk(struct entity *user, struct entity *target)
{
    s16 chances[4];
    struct monster *user_info;
    struct monster *target_info;

    if (!EntityIsValid__0231B194(user))
        return;
    if (!EntityIsValid__0231B194(target))
        return;

    user_info = GetEntInfo(user);
    target_info = GetEntInfo(target);
    if (user_info->is_not_team_member)
        return;
    if (target == ov29_0232E80C() || !target_info->is_not_team_member)
        return;

    if (target_info->held_item.id == ITEM_NOTHING) {
        GetTreasureBoxChances(target_info->id, chances);
        if (chances[2] > 0 || chances[3] > 0) {
            ov29_022E4110(user);
            SubstitutePlaceholderStringTags(1, target, 0);
            LogMessageByIdWithPopupCheckUserTarget(user, target, MESSAGE_C3D);
        }
    }
    else {
        ov29_022E4110(user);
        SubstitutePlaceholderStringTags(1, target, 0);
        PrepareItemForPrinting__02345728(2, &target_info->held_item);
        LogMessageByIdWithPopupCheckUserTarget(user, target, MESSAGE_C3C);
    }
}
