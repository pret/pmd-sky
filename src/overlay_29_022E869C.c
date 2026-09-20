#include "overlay_29_022E869C.h"
#include "main_02001188.h"
#include "main_020483B8.h"
#include "options.h"
#include "overlay_29_022DC684.h"
#include "overlay_29_022F7364.h"
#include "overlay_29_0233A218.h"

extern struct unk_02353554 *TOP_SCREEN_STATUS_PTR;
extern struct dungeon *DUNGEON_PTR[];
extern u32 DUNGEON_FRAMES_PASSED;

extern void ov10_022C1E50(void *a);
extern void ov10_022C1E80(void *a, struct unk_022DC694 *b, s32 c, s32 d);
extern void ov10_022C21D8(void *a);
extern void ov10_022C2278(void *a);
extern void ov10_022C22A0(struct unk_022DC694 *p);

extern void ov29_022E8CE8(void);
extern void ov29_022E8F78(u8 *a);
extern bool8 ov29_022E8FCC(void);
extern bool8 ov29_022E8FF8(void);
extern void ov29_022E9008(void);
extern void ov29_022E9014(u8 *a);
extern void ov29_02339138(void);
extern void ov29_02339D7C(s32 a, s32 b);
extern void ov29_0233A0E8(s32 a, s32 b);
extern void ov29_0233A1BC(s32 a);
extern u8 ov29_0234B4E0(void);

extern s32 GetIdleAnimationId(struct entity *entity);
extern int GetPlayerGender(void);
extern void FreeTopScreen(void);
extern void DungeonChangeTopScreenType(s16 type);
extern bool8 InitDungeonControlsMenu(void);
extern bool8 FreeDungeonControlsMenu(void);
extern void sub_02048384(void);
extern void UpdateMinimap(void);

void FreeTopScreenStatus(void)
{
    if (TOP_SCREEN_STATUS_PTR == NULL) {
        return;
    }
    FreeTopScreen();
    MemFree(TOP_SCREEN_STATUS_PTR);
    TOP_SCREEN_STATUS_PTR = NULL;
}

void ov29_022E7F7C(void)
{
    TOP_SCREEN_STATUS_PTR->field_0x0 = 0;
}

bool8 ov29_022E7F94(void)
{
    bool8 female;

    TOP_SCREEN_STATUS_PTR->field_0x228 = 0;
    TOP_SCREEN_STATUS_PTR->field_0x0 = 1;
    ov29_02339138();
    ov29_02339D7C(1, 1);
    UpdateMinimap();
    SetMinimapDataE447(0);
    TOP_SCREEN_STATUS_PTR->field_0x0 = 1;
    SetMinimapDataE448(1);
    ov29_022E8104();
    female = GetPlayerGender() == 2;
    ov29_022DC738((s32) TOP_SCREEN_STATUS_PTR->field_0xb8, female);
    return TRUE;
}

bool8 ov29_022E8018(void)
{
    if (TOP_SCREEN_STATUS_PTR->field_0x228 != 0) {
        ov29_022DC76C();
        ov29_022DC778();
        TOP_SCREEN_STATUS_PTR->field_0x228 = 0;
    }
    return TRUE;
}

void ov29_022E8054(struct unk_022E8054 *a)
{
    if (a->field_0x10 == 0) {
        return;
    }
    a->field_0x10 = 0;
    if (GetTopScreenOption() != 3) {
        TOP_SCREEN_STATUS_PTR->field_0x0 = 0;
        return;
    }
    if (TOP_SCREEN_STATUS_PTR->field_0x0 != 0) {
        return;
    }
    ov29_02339138();
    ov29_0233A0E8(0, 1);
    ov29_02339D7C(1, 0);
    TOP_SCREEN_STATUS_PTR->field_0x0 = 1;
}

bool8 ov29_022E80D0(void)
{
    ov29_022DC77C();
    TOP_SCREEN_STATUS_PTR->field_0x0 = 0;
    SetMinimapDataE448(0);
    ov29_0233A1BC(1);
    ov29_02339138();
    return TRUE;
}

void ov29_022E8104(void)
{
    TOP_SCREEN_STATUS_PTR->field_0x228 = 0;
    ov10_022C1E50(TOP_SCREEN_STATUS_PTR->field_0xb8);
    ov29_022E8CE8();
}

bool8 InitializeTeamStats(void)
{
    bool8 female;

    TOP_SCREEN_STATUS_PTR->field_0x228 = 0;
    TOP_SCREEN_STATUS_PTR->field_0x229 = 0;
    ov29_022E8104();
    TOP_SCREEN_STATUS_PTR->field_0x24 = 1;
    female = GetPlayerGender() == 2;
    ov29_022DC694((s32) TOP_SCREEN_STATUS_PTR->field_0xb8, female);
    return TRUE;
}

bool8 UpdateTeamStatsWrapper(void)
{
    if (TOP_SCREEN_STATUS_PTR->field_0x228 != 0) {
        ov29_022DC6D0();
        TOP_SCREEN_STATUS_PTR->field_0x228 = 0;
    }
    return TRUE;
}

void ov29_022E81C8(struct unk_022E8054 *a)
{
    ov29_022DC6DC();
    if (a->field_0x10 != 0) {
        a->field_0x10 = 0;
    }
}

bool8 FreeTeamStatsWrapper(void)
{
    ov29_022DC728();
    return TRUE;
}

void ov29_022E81F8(void)
{
    if (!IsTeamStatsOnTopScreen()) {
        ov29_022E8104();
        return;
    }
    if (GetTopScreenOption() == 1 && TOP_SCREEN_STATUS_PTR->field_0x8 != 1) {
        DungeonChangeTopScreenType(1);
    }
    ov29_022E8CE8();
}

void ov29_022E8244(void)
{
    if (GetTopScreenOption() == 4 && TOP_SCREEN_STATUS_PTR->field_0x8 == 4) {
        ov29_022E9008();
    }
}

void DisplayTeamStatsSprite(struct entity *entity, s16 a, s16 b)
{
    s32 sprite;
    s32 anim;
    s16 c;
    s16 d;
    u8 e;
    struct monster *monster;

    if (TOP_SCREEN_STATUS_PTR == NULL) {
        return;
    }
    monster = entity->info;
    anim = GetIdleAnimationId(entity);
    c = 0;
    d = 0;
    e = 0;
    sprite = (s16) entity->sprite_index;
    if ((DUNGEON_PTR[0]->display_data.camera_target == entity
             ? 0 : DUNGEON_PTR[0]->display_data.hallucinating)
        || monster->curse_class_status.curse == 2) {
        sprite = DungeonGetSpriteIndex(0x229);
    }
    if (monster->frozen_class_status.freeze != 1 && monster->frozen_class_status.freeze != 6) {
        if (DUNGEON_PTR[0]->leader_running && ov29_0234B4E0() == 0) {
            c += 2;
        }
        else if (entity->animation_group_id_mirror == 0 || entity->animation_group_id_mirror == 7) {
            if (((struct monster *) entity->info)->speed_stage > 1) {
                c += 1;
            }
        }
        c += 1;
    }
    else {
        c = 0;
    }
    if (monster->two_turn_move_invincible != 2
        && (monster->frozen_class_status.freeze == 6 || monster->burn_class_status.burn == 4
            || monster->frozen_class_status.freeze == 2)) {
        d += DUNGEON_FRAMES_PASSED & 2;
    }
    if (monster->invisible_class_status.status == 1
        && DUNGEON_PTR[0]->display_data.can_see_traps == 0) {
        e = 1;
    }
    if (anim == 0xff) {
        return;
    }
    ov29_022DC6E8(sprite, monster->apparent_id, anim, monster->unique_id, 1, a, b, c, d, e);
}

bool8 ov29_022E840C(void)
{
    struct unk_022DC694 s;

    if (TOP_SCREEN_STATUS_PTR->field_0x29 != 0) {
        return FALSE;
    }
    ov10_022C22A0(&s);
    ov10_022C1E80(TOP_SCREEN_STATUS_PTR->field_0x80, &s, 0, 1);
    if (sub_02048400()) {
        sub_02048384();
    }
    TOP_SCREEN_STATUS_PTR->field_0x29 = 1;
    return TRUE;
}

void ov29_022E847C(struct unk_022E8054 *a)
{
    if (a->field_0x10 == 0) {
        return;
    }
    a->field_0x10 = 0;
    sub_020483B8();
    ov10_022C21D8(TOP_SCREEN_STATUS_PTR->field_0x80);
}

bool8 ov29_022E84B0(void)
{
    if (TOP_SCREEN_STATUS_PTR->field_0x29 == 0) {
        return FALSE;
    }
    ov10_022C2278(TOP_SCREEN_STATUS_PTR->field_0x80);
    if (sub_02048400()) {
        sub_020483D8();
    }
    TOP_SCREEN_STATUS_PTR->field_0x29 = 0;
    return TRUE;
}

bool8 InitDungeonControlsMenuWithBg(void)
{
    struct unk_022DC694 s;

    ov10_022C22A0(&s);
    ov10_022C1E80(TOP_SCREEN_STATUS_PTR->field_0x80, &s, 0, 1);
    ov10_022C21D8(TOP_SCREEN_STATUS_PTR->field_0x80);
    return InitDungeonControlsMenu();
}

void ov29_022E854C(struct unk_022E8054 *a)
{
    if (a->field_0x10 == 0) {
        return;
    }
    ov29_022E8F78(&a->field_0x10);
    ov10_022C21D8(TOP_SCREEN_STATUS_PTR->field_0x80);
    a->field_0x10 = 0;
}

bool8 FreeDungeonControlsMenuWithBg(void)
{
    ov10_022C2278(TOP_SCREEN_STATUS_PTR->field_0x80);
    return FreeDungeonControlsMenu();
}

bool8 ov29_022E85A8(void)
{
    struct unk_022DC694 s;

    ov10_022C22A0(&s);
    ov10_022C1E80(TOP_SCREEN_STATUS_PTR->field_0x80, &s, 0, 1);
    ov10_022C21D8(TOP_SCREEN_STATUS_PTR->field_0x80);
    return ov29_022E8FCC();
}

void ov29_022E85F4(struct unk_022E8054 *a)
{
    if (a->field_0x10 == 0) {
        return;
    }
    ov29_022E9014(&a->field_0x10);
    ov10_022C21D8(TOP_SCREEN_STATUS_PTR->field_0x80);
    a->field_0x10 = 0;
}

bool8 ov29_022E8630(void)
{
    ov10_022C2278(TOP_SCREEN_STATUS_PTR->field_0x80);
    return ov29_022E8FF8();
}

bool8 ov29_022E8650(void)
{
    struct unk_022DC694 s;

    ov10_022C22A0(&s);
    ov10_022C1E80(TOP_SCREEN_STATUS_PTR->field_0x80, &s, 0, 1);
    ov10_022C21D8(TOP_SCREEN_STATUS_PTR->field_0x80);
    return TRUE;
}

bool8 ov29_022E869C(void)
{
    return TRUE;
}
