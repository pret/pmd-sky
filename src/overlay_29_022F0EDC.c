#include "overlay_29_022F0EDC.h"
#include "dg_uty.h"
#include "dungeon.h"
#include "dungeon_action.h"
#include "dungeon_ai_movement.h"
#include "dungeon_capabilities_3.h"
#include "dungeon_logic.h"
#include "dungeon_logic_5.h"
#include "dungeon_map_access.h"
#include "dungeon_move.h"
#include "dungeon_util.h"
#include "joined_at_checks.h"
#include "main_0200F208.h"
#include "number_util.h"
#include "options.h"
#include "overlay_29_0234928C.h"
#include "overlay_29_022FB538.h"
#include "position_util.h"

#ifdef JAPAN
#define SET_LEADER_ACTION_DATA_OFFSET -0x2C1
#else
#define SET_LEADER_ACTION_DATA_OFFSET 0
#endif

struct unk_022F0BAC {
    s32 field_0x0;
    s32 field_0x4;
    s32 field_0x8;
    s32 field_0xc;
};

struct unk_0237C9A4 {
    u8 field_0x0;
    u8 field_0x1;
    u8 field_0x2;
    u8 field_0x3;
    s16 field_0x4;
    u16 field_0x6;
};

extern struct dungeon *DUNGEON_PTR;
extern struct unk_0237C9A4 ov29_0237C9A4;
extern u16 DUNGEON_BUTTON_INPUT[8];
extern u16 ov29_0237C6A4;

extern void AdvanceFrame(u32);
extern bool8 CanSeeTarget(struct entity *user, struct entity *target);
extern bool8 IsBlinded(struct entity *entity, bool8 check_held_item);
extern void MemZero(u8 *ptr, s32 len);
extern bool8 ShouldMonsterRunAwayAndShowEffect(struct entity *monster, bool8 show_run_away_effect);
extern s32 CannotStandOnTile__02300384();
extern s32 ChangeMonsterAnimation();
extern s32 CheckTouchscreenArea();
extern s32 GetEntityTouchscreenArea();
extern s32 GetIdleAnimationId();
extern struct monster *GetLeaderMonster();
extern struct entity *GetMonsterInFront();
extern void GetPressedButtons(u32 param_1, u16 *pressed);
extern s32 GetTeamMemberIndex();
extern s32 HasStatusThatPreventsLeaderActing();
extern s32 HideTileGrid();
extern s32 IsFloorOver();
extern s32 LogItemBlockedByEmbargo();
extern void LogMessageByIdWithPopupCheckUser(struct entity *user, u32 message_id);
extern s32 MonsterHasEmbargoStatus();
extern s32 OpenMenu(bool8 a, u8 b, s32 c);
extern s32 OpenMessageLog();
extern s32 PlaySeVolumeWrapper();
extern struct entity *PositionHasMonster();
extern s32 ResetLeaderActionFields();
extern s32 SetActionUseMovePlayer();
extern s32 SetLeaderActionFields();
extern s32 ShouldLeaderKeepRunning();
extern s32 StairsMenuAfterStep();
extern s32 TalkToTeamMemberInFront();
extern s32 TryPointCameraToMonster();
extern void UnkMapRelatedFunc(u32, u32);
extern s32 WaitUntilAlertBoxPauseIsOver();
extern s32 YesNoMenu();
extern s32 abs();
extern s32 ov29_022E0B44();
extern void ov29_022E0C2C(u32);
extern s32 ov29_022E0C3C();
extern void ov29_022E81F8(void);
extern s32 ov29_022EA370();
extern s32 ov29_022EA3B4();
extern s32 ov29_022EB944();
extern s32 ov29_022F0C1C();
extern s32 ov29_022F0C3C();
extern s32 ov29_022F0C98();
extern s32 ov29_022F2B3C();
extern s32 ov29_022F2B74();
extern s32 ov29_022F2FE4();
extern s32 ov29_022F35E0();
extern s32 ov29_022F37D0();
extern s32 ov29_022F3AFC();
extern s32 ov29_022F3EA0();
extern s32 ov29_022F40B8();
extern s32 ov29_022F426C();
extern s32 ov29_022FA2F0();
extern s32 ov29_0230105C();
extern s32 ov29_023055B0();
extern s32 ov29_02339CD4();
extern s32 ov29_0233A248();
extern s32 ov29_02346E5C();
extern s32 ov29_0234A980();
extern s32 ov29_0234BB38();
extern s32 sub_02006B70();

void SetLeaderAction(void)
{
    s32 loopn;
    struct unk_022F0BAC area;
    struct unk_022F0BAC area2;
    u8 buf[5];
    struct position pos_b2;
    struct position pos_ae;
    struct position pos_aa;
    struct position pos_a6;
    struct position pos_a2;
    struct position pos_9e;
    struct position pos_9a;
    struct position pos_96;
    struct position pos_92;
    u16 pressed_buttons;
    u16 buttons;
    u16 b1;
    u16 b2;
    u16 h1;
    u16 h2;
    s32 local_6c;
    s32 local_68;
    s32 local_64;
    s32 local_60;
    s32 local_5c;
    bool8 local_58;
    bool8 local_54;
    bool8 local_50;
    s32 local_4c;
    s32 local_48;
    s32 local_44;
    s16 local_40;
    s16 local_3c;
    s16 local_38;
    s32 local_34;
    s32 local_30;
    s32 local_2c;
    bool8 local_28;
    s16 local_24;
    s32 local_20;
    s32 n;
    s32 found_dir;
    struct entity *ally;
    struct monster *lmon;
    struct monster *omon;
    s32 up_y;
    s32 up_x;
    struct display_data *display;
    struct entity *leader;
    s32 dir;
    s32 r8a;
    s32 mode;
    s32 r8flag;
    u8 r8b;
    struct monster *monster;
    bool8 flag_40;
    s32 both;
    s32 tmp;
    s32 fpflag;
    s32 pressed;
    u8 old_dir;
    struct tile *tile;
    s32 dx;
    s32 dy;
    s32 i;
    s32 j;
    struct entity *found2;
    s32 found_pp;
    bool8 exists;
    s32 swap_ok;
    struct monster *amon;
    struct entity *other;
    s32 same_tile;
    struct entity *found;
    struct monster *fmon;

    display = &DUNGEON_PTR->display_data;
    local_68 = 3;
    local_64 = 0;
    MemZero(buf, 5);
    *(u16 *)&DUNGEON_PTR->field_0x1c = 0;
    TryPointCameraToMonster(GetLeader(), 1, 1);
#ifndef JAPAN
    SetDecoyAiTracker(GetLeader());
#endif
    if (HasStatusThatPreventsLeaderActing(GetLeader())) {
        ov29_022EA370(0x3C, 0x10);
        return;
    }
    DUNGEON_PTR->pass_turn = FALSE;
    ov29_02339CD4();
    if (DUNGEON_PTR->stepped_on_stairs) {
        DUNGEON_PTR->stepped_on_stairs = FALSE;
        if (IsGoldenChamber()) {
            ov29_0234A980();
            if (DUNGEON_PTR->end_floor_no_death_check_flag) {
                return;
            }
        }
        if (!ShouldMonsterRunAwayAndShowEffect(GetLeader(), 1)) {
            WaitUntilAlertBoxPauseIsOver(0xA);
            ResetLeaderActionFields(1);
            ov29_022F2FE4();
            ov29_0233A248(0);
            StairsMenuAfterStep(GetLeader(), 0);
            ov29_022E0B44();
            sub_02006B70();
            if (GetLeaderMonster()->action.action_id != ACTION_NOTHING) {
                return;
            }
        }
    }
    ov29_022FA2F0(1, 1, 1);
    up_y = DIRECTIONS_XY[4].y;
    up_x = DIRECTIONS_XY[4].x;

    while (TRUE) {
        leader = GetLeader();
        monster = leader->info;
        if (DUNGEON_PTR->leader_running) {
            if (ShouldLeaderKeepRunning()) {
                monster->action.action_id = ACTION_WALK;
                monster->action.action_parameters[0].action_use_idx = 0;
                return;
            }
            ov29_022F2FE4();
        }
        ((volatile struct unk_0237C9A4 *) &ov29_0237C9A4)->field_0x2 = 0;
        ((volatile struct unk_0237C9A4 *) &ov29_0237C9A4)->field_0x1 = 0;
        if ((*(struct dungeon *volatile *) &DUNGEON_PTR)->field_0x614 >= 0) {
            buf[0] = 1;
            buf[1] = 0;
            buf[2] = 0;
            buf[4] = 0;
        } else {
            buf[0] = 0;
            buf[1] = 0;
            buf[2] = 0;
            buf[4] = 0;
        }
        local_6c = 0;
        SetLeaderActionFields(0);
        ov29_0237C9A4.field_0x0 = 0;
        ov29_0237C9A4.field_0x3 = 0;

        while (TRUE) {
            dir = 0;
            local_4c = 0;
            local_48 = 0;
            local_2c = 0;
            if (buf[0]) {
                break;
            }
            ov29_0237C9A4.field_0x4 = ov29_0237C9A4.field_0x4 + 1;
            if (display->team_menu_or_grid) {
                local_6c = 0;
            } else {
                local_6c = local_6c + 1;
            }
            if (local_68 != 0) {
                local_68--;
                if (local_68 == 0) {
                    ov29_023055B0(0);
                }
            }
            ov29_022F2B74(leader);
            buttons = ov29_0237C6A4;
            flag_40 = (buttons & 0x40) != 0;
            local_58 = (buttons & 0x10) != 0;
            local_54 = (buttons & 0x20) != 0;
            local_50 = (buttons & 0x200) != 0;
            r8a = 0;
            local_5c = r8a;
            if (ov29_022E0C3C()) {
                if (!flag_40) {
                    ov29_022E0C2C(r8a);
                }
                flag_40 = 0;
            } else {
                ov29_022E0C2C(r8a);
                flag_40 = (ov29_0237C6A4 & 0x100) != 0;
            }
            if (local_50) {
                ov29_022F3EA0(leader, &pos_ae, 0x64, 0);
                if (leader->pos.x == pos_ae.x && leader->pos.y == pos_ae.y) {
                    local_50 = 0;
                }
            }
            both = 0;
            if ((ov29_0237C6A4 & 0x80) && (ov29_0237C6A4 & 0x1000)) {
                both = 1;
            }
            if (both) {
                ov29_022F3EA0(leader, &pos_ae, 0x66, 0);
                ov29_022F3EA0(leader, &pos_aa, 0x64, 0);
                if (leader->pos.x == pos_ae.x && leader->pos.y == pos_ae.y &&
                    leader->pos.x == pos_aa.x && leader->pos.y == pos_aa.y) {
                    r8a = 1;
                }
            }
            if (local_54) {
                ov29_022F3EA0(leader, &pos_ae, 0x66, 0);
                ov29_022F3EA0(leader, &pos_aa, 0x64, 0);
                if (leader->pos.x == pos_ae.x && leader->pos.y == pos_ae.y &&
                    leader->pos.x == pos_aa.x && leader->pos.y == pos_aa.y) {
                    local_5c = 1;
                }
            }
            if (r8a != 0 ||
                ((DUNGEON_BUTTON_INPUT[0] & 1) && (DUNGEON_BUTTON_INPUT[0] & 2))) {
                if (CeilFixedPoint(monster->belly) != 0) {
                    SetLeaderActionFields(1);
                    DUNGEON_PTR->pass_turn = TRUE;
                    break;
                }
            }
            pos_b2.x = -1;
            pos_b2.y = -1;
            local_34 = 0;
            local_30 = 0;
            local_38 = 0;
            fpflag = 0;
            mode = 0;
            local_60 = 0;
            if (ov29_0237C9A4.field_0x2 == 0) {
                if (local_58) {
                    mode = 1;
                    if (GetEquippedThrowableItem() >= 0) {
                        local_60 = mode;
                    }
                } else {
                    tmp = mode;
                    if ((ov29_0237C6A4 & 0x80) && (ov29_0237C6A4 & 2)) {
                        tmp = 1;
                    }
                    if (tmp != 0) {
                        mode = 2;
                    } else if (flag_40 != 0 || local_50 != 0) {
                        mode = 3;
                    }
                }
            }
            if (mode != 0) {
                if (mode == 1) {
                    dir = ov29_022F3EA0(leader, &pos_a6, 0x65, 0);
                } else {
                    dir = ov29_022F3EA0(leader, &pos_a6, 0x64, 0);
                }
                if (dir >= 0 &&
                    !(leader->pos.x == pos_a6.x && leader->pos.y == pos_a6.y) &&
                    !ov29_022F426C(leader, &pos_a6)) {
                    pos_92 = pos_a6;
                    pos_a2 = pos_a6;
                    same_tile = 0;
                    pos_a2.x = pos_a2.x + DIRECTIONS_XY[(dir + 4) & 7].x;
                    pos_a2.y = pos_a2.y + DIRECTIONS_XY[(dir + 4) & 7].y;
                    if (leader->pos.x == pos_a2.x && leader->pos.y == pos_a2.y) {
                        same_tile = 1;
                    }
                    pos_b2 = pos_92;
                    if (mode == 2 || (local_60 != 0 && !same_tile)) {
                        found = PositionHasMonster(&pos_a6);
                        if (found != NULL) {
                            fmon = found->info;
                            if (local_60 == 1) {
                                if (ov29_022F2B3C(fmon)) {
                                    local_38 = 1;
                                } else {
                                    local_38 = 0;
                                }
                            } else if (local_60 == 2) {
                                if (ov29_022F2B3C(fmon)) {
                                    local_38 = 1;
                                } else {
                                    local_38 = 0;
                                }
                            } else if (mode == 2) {
                                local_30 = 0;
                                fpflag = 1;
                                local_34 = 0;
                            }
                        }
                    } else if (leader->pos.x == pos_a2.x &&
                               leader->pos.y == pos_a2.y) {
                        found2 = PositionHasMonster(&pos_a6);
                        if (found2 != NULL) {
                            fmon = found2->info;
                            if (mode == 1) {
                                local_30 = 0;
                                fpflag = 0;
                                if (ov29_022F2B3C(fmon)) {
                                    if (local_60 == 1) {
                                        local_38 = 1;
                                    } else {
                                        local_30 = 1;
                                        local_38 = 0;
                                    }
                                    local_34 = 0;
                                } else {
                                    local_38 = 0;
                                    if (IsBlinded(found2, TRUE)) {
                                        local_30 = 1;
                                        local_34 = 0;
                                    } else {
                                        local_34 = 1;
                                    }
                                }
                            } else if (mode == 3) {
                                if (ov29_022F2B3C(fmon)) {
                                    local_30 = 1;
                                } else {
                                    local_30 = 0;
                                }
                                fpflag = 0;
                                local_34 = 0;
                            }
                            monster->action.direction = dir & 7;
                        } else {
                            tile = GetTile(leader->pos.x + up_x,
                                           leader->pos.y + up_y);
                            if (tile->terrain_flags & 0x2000) {
                                monster->action.direction = 4;
                                local_4c = 1;
                                ChangeMonsterAnimation(leader,
                                                       GetIdleAnimationId(leader), 4);
                            }
                        }
                    }
                }
            }
            if (!GetDPadAttackOption()) {
                pressed = 0;
            } else if (ov29_0237C9A4.field_0x2 != 0) {
                pressed = 0;
            } else {
                b1 = DUNGEON_BUTTON_INPUT[0];
                b2 = b1;
                h1 = b1 & 0xF0;
                h2 = b2 & 0xF0;
                if (h1 == 0 && h2 == 0) {
                    pressed = 0;
                } else {
                    if (h1 == 0x50) { local_20 = 3; }
                    if (h1 == 0x60) { local_20 = 5; }
                    if (h1 == 0x90) { local_20 = 1; }
                    if (h1 == 0xA0) { local_20 = 7; }
                    if (h2 == 0x40) { local_20 = 4; }
                    if (h2 == 0x80) { local_20 = 0; }
                    if (h2 == 0x10) { local_20 = 2; }
                    if (h2 == 0x20) { local_20 = 6; }
                    pressed = 1;
                    if (ov29_0237C9A4.field_0x1 != 0 && !(local_20 & 1)) {
                        pressed = 0;
                    } else {
                        old_dir = monster->action.direction;
                        monster->action.direction = local_20 & 7;
                        if (GetMonsterInFront(leader) == NULL) {
                            pressed = 0;
                            monster->action.direction = old_dir;
                        } else {
                            pressed = 1;
                        }
                    }
                }
            }
            if (ov29_0237C9A4.field_0x2 == 0 && pressed) {
                if (local_64 == 0) {
                    if (DUNGEON_BUTTON_INPUT[0] & 2) {
                        if (GetMonsterInFront(leader) == NULL ||
                            ov29_022F37D0(leader, monster) != 0) {
                            local_48 = 0;
                        } else {
                            local_48 = 1;
                            DUNGEON_PTR->field_0x78c = 0;
                            local_2c = 1;
                        }
                    } else {
                        local_48 = 1;
                        DUNGEON_PTR->field_0x78c = 0;
                    }
                }
            } else if (ov29_0237C9A4.field_0x2 == 0 && local_5c != 0) {
                local_48 = 1;
            } else if (DUNGEON_BUTTON_INPUT[1] & 1) {
                local_48 = 1;
            }
            local_64 = 0;
            if (local_30 != 0 || fpflag != 0 || local_38 != 0) {
                tile = GetTileSafe(pos_b2.x, pos_b2.y);
                PlaySeVolumeWrapper(7);
                if (local_38 != 0) {
                    dx = (s16) abs(pos_b2.x - leader->pos.x);
                    dy = (s16) abs(pos_b2.y - leader->pos.y);
                    if (tile->monster != NULL) {
                        if (local_60 == 2) {
                            monster->action.direction =
                                GetDirectionTowardsPosition(&leader->pos, &pos_b2);
                            monster->action.item_target_position.x = pos_b2.x;
                            monster->action.item_target_position.y = pos_b2.y;
                        } else if (dx == 0 || dy == 0 || dx == dy) {
                            monster->action.direction =
                                GetDirectionTowardsPosition(&leader->pos, &pos_b2);
                        }
                    }
                } else if (abs(pos_b2.x - leader->pos.x) <= 1 &&
                           abs(pos_b2.y - leader->pos.y) <= 1 &&
                           tile->monster != NULL) {
                    monster->action.direction =
                        GetDirectionTowardsPosition(&leader->pos, &pos_b2);
                }
            }
            if (local_48 != 0 || local_34 != 0 || local_30 != 0 || fpflag != 0) {
                if (local_2c == 0 && (DUNGEON_BUTTON_INPUT[0] & 2)) {
                    if (CeilFixedPoint(monster->belly) != 0) {
                        SetLeaderActionFields(1);
                        DUNGEON_PTR->pass_turn = TRUE;
                        break;
                    }
                } else {
                    if (ShouldMonsterRunAwayAndShowEffect(leader, 1)) {
                        LogMessageByIdWithPopupCheckUser(leader, 0xB9A + SET_LEADER_ACTION_DATA_OFFSET);
                        SetLeaderActionFields(1);
                        DUNGEON_PTR->pass_turn = TRUE;
                        break;
                    }
                    if ((DUNGEON_BUTTON_INPUT[0] & 0x200) || fpflag != 0) {
                        for (i = 0; i < 4; i++) {
                            exists = (monster->moves.moves[i].flags0 & 1) != 0;
                            if (exists && (((volatile struct move *) monster->moves.moves)[i].flags0 & 8)) {
                                break;
                            }
                        }
                        if (i == 4) {
                            LogMessageByIdWithPopupCheckUser(leader, 0xB9B + SET_LEADER_ACTION_DATA_OFFSET);
                            if (fpflag != 0) {
                                sub_02006B70();
                            }
                            break;
                        }
                        for (j = 0; j < 4; j++) {
                            exists = (monster->moves.moves[j].flags0 & 1) != 0;
                            if (exists && monster->moves.moves[j].pp != 0) {
                                break;
                            }
                        }
                        if (j == 4) {
                            if (GetCheckDirectionOption() &&
                                ov29_022F0C3C(leader, 0) == 0) {
                                break;
                            }
                            SetMonsterActionFields(&monster->action, ACTION_STRUGGLE);
                            break;
                        }
                        found_pp = 0;
                        for (j = i; j < 4; j++) {
                            if (j != i && !(monster->moves.moves[j].flags0 & 2)) {
                                break;
                            }
                            if (monster->moves.moves[j].pp != 0) {
                                found_pp = 1;
                                break;
                            }
                        }
                        if (!found_pp) {
                            LogMessageByIdWithPopupCheckUser(leader, 0xB9C + SET_LEADER_ACTION_DATA_OFFSET);
                            if (fpflag != 0) {
                                sub_02006B70();
                            }
                            break;
                        }
                        if (GetCheckDirectionOption() &&
                            ov29_022F0C3C(leader, &monster->moves.moves[j]) == 0) {
                            break;
                        }
                        SetActionUseMovePlayer(&monster->action,
                                               GetTeamMemberIndex(leader), (s16) i);
                        break;
                    }
                    if (local_34 != 0) {
                        if (ov29_022F37D0(leader, monster) != 0) {
                            local_64 = 1;
                            break;
                        }
                    } else {
                        if (local_30 == 0 && ov29_022F37D0(leader, monster) != 0) {
                            local_64 = 1;
                            break;
                        }
                        if (ov29_022F3AFC(leader, monster) != 0) {
                            break;
                        }
                        SetMonsterActionFields(&monster->action, ACTION_REGULAR_ATTACK);
                        break;
                    }
                }
            } else {
                if (local_4c != 0 && ov29_022F3AFC(leader, monster) != 0) {
                    break;
                }
            }
            if (DUNGEON_BUTTON_INPUT[1] & 0x400) {
                buf[0] = 1;
                buf[1] = 0;
                buf[2] = 0;
                buf[3] = 0;
                buf[4] = 0;
                break;
            }
            if (local_58) {
                GetEntityTouchscreenArea(leader, &area);
                if (CheckTouchscreenArea((s16) area.field_0x8, (s16) area.field_0x0,
                                         (s16) area.field_0xc, (s16) area.field_0x4)) {
                    buf[0] = 1;
                    buf[1] = 0;
                    buf[2] = 0;
                    buf[3] = 0;
                    buf[4] = 0;
                    break;
                }
            }
            if (DUNGEON_BUTTON_INPUT[3] & 2) {
                buf[0] = 1;
                buf[1] = 0;
                buf[2] = 0;
                buf[3] = 1;
                break;
            }
            if (local_6c >= 0x708) {
                buf[0] = 1;
                buf[1] = 1;
                buf[2] = 0;
                buf[3] = 0;
                break;
            }
            if (!(DUNGEON_BUTTON_INPUT[0] & 0x800) &&
                !(DUNGEON_BUTTON_INPUT[0] & 8) && flag_40 == 0 &&
                display->team_menu_or_grid) {
                HideTileGrid();
                ov29_0237C9A4.field_0x2 = 0;
            }
            if ((DUNGEON_BUTTON_INPUT[0] & 0x200) && (DUNGEON_BUTTON_INPUT[1] & 2)) {
                IsTextLogOnTopScreen();
                PlaySeVolumeWrapper(4);
                OpenMessageLog(0, 1);
                if (IsTextLogOnTopScreen()) {
                    ov29_0234BB38();
                    ov29_022E81F8();
                }
                ov29_022E0B44();
                sub_02006B70();
            }
            local_44 = 0;
            if (DUNGEON_BUTTON_INPUT[0] & 0x100) {
                if (ov29_0237C9A4.field_0x1 == 0) {
                    ov29_0237C9A4.field_0x4 = 0;
                }
                ov29_0237C9A4.field_0x1 = 1;
            } else {
                ov29_0237C9A4.field_0x1 = 0;
            }
            r8flag = 0;
            if ((DUNGEON_BUTTON_INPUT[1] & 0x800) || (DUNGEON_BUTTON_INPUT[1] & 8)) {
                r8flag = 1;
            }
            if (flag_40 != 0 && ov29_0237C9A4.field_0x2 == 0) {
                GetEntityTouchscreenArea(leader, &area2);
                if ((ov29_0237C6A4 & 0x100) &&
                    CheckTouchscreenArea((s16) area2.field_0x8, (s16) area2.field_0x0,
                                         (s16) area2.field_0xc, (s16) area2.field_0x4)) {
                    r8flag = 1;
                }
            }
            if (r8flag != 0) {
                lmon = leader->info;
                if (lmon->blinker_class_status.blinded != 2 &&
                    !IsBlinded(leader, 1)) {
                    for (loopn = 0; loopn < 1; loopn++) {
                        found_dir = 0;
                        r8flag = lmon->action.direction + 1;
                        n = 1;
                        while (n < 8) {
                            r8flag = r8flag & 7;
                            tile = GetTile(leader->pos.x + DIRECTIONS_XY[r8flag].x,
                                           leader->pos.y + DIRECTIONS_XY[r8flag].y);
                            other = tile->monster;
                            if (other != NULL && other->type == ENTITY_MONSTER) {
                                omon = other->info;
                                if (CanSeeTarget(leader, other) &&
                                    (loopn != 0 || omon->is_not_team_member != 0)) {
                                    found_dir = 1;
                                    break;
                                }
                            }
                            r8flag++;
                            n++;
                        }
                        if (found_dir) {
                            ((struct monster *) leader->info)->action.direction = r8flag & 7;
                            ChangeMonsterAnimation(leader, GetIdleAnimationId(leader), r8flag);
                            break;
                        }
                    }
                }
                ov29_0237C9A4.field_0x2 = 1;
                display->leader_target_direction = (enum direction_id) monster->action.direction;
                display->leader_target_direction_mirror = 0xFF;
                ov29_022E0B44();
            }
            if (local_38 != 0 ||
                ((DUNGEON_BUTTON_INPUT[0] & 0x200) &&
                 (DUNGEON_BUTTON_INPUT[1] & 0x100))) {
                local_44 = 1;
            }
            if (local_44 != 0 && MonsterHasEmbargoStatus(leader)) {
                LogItemBlockedByEmbargo(leader);
                local_44 = 0;
            }
            if (local_44 != 0) {
                fpflag = GetEquippedThrowableItem();
                if (fpflag >= 0) {
                    r8flag = 1;
                    if (GetCheckDirectionOption() && ov29_022F0C1C(leader) == 0) {
                        r8flag = 0;
                    }
                    if (r8flag == 0) {
                        break;
                    }
                    SetLeaderActionFields(0xB);
                    monster->action.action_parameters[0].action_use_idx = fpflag + 1;
                    monster->action.action_parameters[0].item_pos.x = 0;
                    monster->action.action_parameters[0].item_pos.y = 0;
                    if (monster->action.action_id != ACTION_NOTHING) {
                        break;
                    }
                }
            }
            if (!DUNGEON_PTR->display_data.blinded && (DUNGEON_BUTTON_INPUT[1] & 4)) {
                ov29_022F0C98(0);
                flag_40 = 0;
            }
            pos_b2.x = -1;
            pos_b2.y = -1;
            local_3c = 0;
            local_40 = 0;
            if (DUNGEON_PTR->field_0x1d8.x >= 0) {
                if (leader->pos.x == DUNGEON_PTR->field_0x1d8.x &&
                    leader->pos.y == DUNGEON_PTR->field_0x1d8.y) {
                    dir = -1;
                } else {
                    dir = ov29_022F40B8(leader, &DUNGEON_PTR->field_0x1d8);
                }
            } else if (ov29_0237C9A4.field_0x2 == 0 &&
                       (local_58 != 0 || flag_40 != 0 || local_50 != 0)) {
                if (flag_40 != 0) {
                    dir = ov29_022F3EA0(leader, &pos_9e, 0x64, 0);
                } else if (local_58 != 0) {
                    dir = ov29_022F3EA0(leader, &pos_9e, 0x66, 0);
                } else if (local_50 != 0) {
                    dir = ov29_022F3EA0(leader, &pos_9e, 0x64, 0);
                }
                if (dir >= 0) {
                    if (leader->pos.x != pos_9e.x || leader->pos.y != pos_9e.y) {
                        if (ov29_022F426C(leader, &pos_9e) != 0) {
                            dir = ov29_022F40B8(leader, &pos_9e);
                            local_40 = 1;
                            pos_b2 = pos_9e;
                            if (local_50 != 0) {
                                local_3c = 1;
                            }
                        }
                    } else {
                        dir = monster->action.direction;
                    }
                }
            } else {
                if (DUNGEON_PTR->field_0x78c != 0 && ov29_0237C9A4.field_0x1 == 0) {
                    b1 = DUNGEON_BUTTON_INPUT[1];
                    b2 = b1;
                } else {
                    b1 = DUNGEON_BUTTON_INPUT[0];
                    if (display->team_menu_or_grid) {
                        b2 = DUNGEON_BUTTON_INPUT[1];
                    } else {
                        b2 = b1;
                    }
                }
                h1 = b1 & 0xF0;
                b2 &= 0xF0;
                dir = -1;
                if (h1 == 0x50) { dir = 3; }
                if (h1 == 0x60) { dir = 5; }
                if (h1 == 0x90) { dir = 1; }
                if (h1 == 0xA0) { dir = 7; }
                if (b2 == 0x40) { dir = 4; }
                if (b2 == 0x80) { dir = 0; }
                if (b2 == 0x10) { dir = 2; }
                if (b2 == 0x20) { dir = 6; }
            }
            if (local_5c == 0 && local_54 != 0) {
                dir = ov29_022F3EA0(leader, &pos_9a, 2, 0);
                if (dir >= 0 &&
                    !(leader->pos.x == pos_9a.x && leader->pos.y == pos_9a.y)) {
                    monster->action.direction = dir;
                    local_3c = 1;
                    if (display->team_menu_or_grid) {
                        HideTileGrid();
                        ov29_0237C9A4.field_0x2 = 0;
                    }
                }
            }
            DUNGEON_PTR->field_0x1dc.x = -1;
            DUNGEON_PTR->field_0x1dc.y = -1;
            if (flag_40 != 0 && ov29_0237C9A4.field_0x2 != 0) {
                dir = ov29_022F3EA0(leader, &pos_96, 0x64, 0);
                display->leader_target_direction = (enum direction_id) dir;
            }
            if (dir >= 0) {
                if (ov29_0237C9A4.field_0x1 == 0 || (dir & 1)) {
                    local_28 = monster->action.direction != dir;
                    monster->action.direction = dir & 7;
                    if (ov29_0237C9A4.field_0x2 != 0) {
                        display->leader_target_direction = (enum direction_id) dir;
                        ChangeMonsterAnimation(leader, GetIdleAnimationId(leader), dir);
                        DUNGEON_PTR->field_0x1d8.x = -1;
                        DUNGEON_PTR->field_0x1d8.y = -1;
                    } else {
                    r8b = 0;
                    local_24 = 0;
                    GetPressedButtons(0, &pressed_buttons);
                    lmon = leader->info;
                    tile = GetTile((s16) (leader->pos.x + DIRECTIONS_XY[lmon->action.direction].x),
                                   (s16) (leader->pos.y + DIRECTIONS_XY[lmon->action.direction].y));
                    ally = tile->monster;
                    if (ally == NULL) {
                        swap_ok = 0;
                    } else if (ally->type != ENTITY_MONSTER) {
                        swap_ok = 0;
                    } else {
                        amon = ally->info;
                        if (!(amon->is_not_team_member == 0 || amon->shopkeeper == 1 ||
                              amon->shopkeeper == 2 || IsExperienceLocked(amon) ||
                              amon->monster_behavior == 7)) {
                            swap_ok = 0;
                        } else if (!ov29_022F35E0(lmon)) {
                            swap_ok = 0;
                        } else if (!ov29_022F35E0(amon)) {
                            swap_ok = 0;
                        } else if (lmon->cringe_class_status.cringe == 2) {
                            swap_ok = 0;
                        } else if (amon->cringe_class_status.cringe == 2) {
                            swap_ok = 0;
                        } else if (amon->sleep_class_status.sleep != 0 &&
                                   amon->sleep_class_status.sleep != 2 &&
                                   amon->sleep_class_status.sleep != 4) {
                            swap_ok = 0;
                        } else if (lmon->sleep_class_status.sleep != 0 &&
                                   lmon->sleep_class_status.sleep != 2 &&
                                   lmon->sleep_class_status.sleep != 4) {
                            swap_ok = 0;
                        } else if (IsChargingAnyTwoTurnMove(ally, 0)) {
                            swap_ok = 0;
                        } else if (!ov29_0230105C(leader, lmon->action.direction)) {
                            swap_ok = 0;
                        } else if (CannotStandOnTile__02300384(ally, &leader->pos) &&
                                   YesNoMenu(0, 0xBA3 + SET_LEADER_ACTION_DATA_OFFSET, 1, 0, 0) == 2) {
                            swap_ok = 0;
                        } else {
                            SetMonsterActionFields(&lmon->action, ACTION_WALK);
                            if (DUNGEON_BUTTON_INPUT[0] & 2) {
                                lmon->action.action_parameters[0].action_use_idx = 0;
                            } else {
                                lmon->action.action_parameters[0].action_use_idx = 1;
                            }
                            lmon->flags = lmon->flags | 0x8000;
                            SetMonsterActionFields(&amon->action, ACTION_WALK);
                            amon->action.action_parameters[0].action_use_idx = 0;
                            amon->action.direction = (lmon->action.direction + 4) & 7;
                            amon->flags = amon->flags | 0x8000;
                            amon->target_pos.x = ally->pos.x;
                            amon->target_pos.y = ally->pos.y;
                            DUNGEON_PTR->field_0x10 = 1;
                            swap_ok = 1;
                        }
                    }
                    if (swap_ok != 0) {
                        break;
                    }
                    if (monster->frozen_class_status.freeze == 2) {
                        local_24 = 0xB9F + SET_LEADER_ACTION_DATA_OFFSET;
                        r8b |= 1;
                    } else if (monster->frozen_class_status.freeze == 7) {
                        local_24 = 0xB9E + SET_LEADER_ACTION_DATA_OFFSET;
                        r8b |= 1;
                    } else if (monster->frozen_class_status.freeze == 5) {
                        local_24 = 0xBA0 + SET_LEADER_ACTION_DATA_OFFSET;
                        r8b |= 1;
                    } else if (monster->frozen_class_status.freeze == 3) {
                        local_24 = 0xBA1 + SET_LEADER_ACTION_DATA_OFFSET;
                        r8b |= 1;
                    } else if (monster->frozen_class_status.freeze == 4) {
                        local_24 = 0xBA2 + SET_LEADER_ACTION_DATA_OFFSET;
                        r8b |= 1;
                    }
                    if (!CanMonsterMoveInDirection(leader, dir)) {
                        r8b |= 2;
                    }
                    if (local_28 != 0) {
                        ChangeMonsterAnimation(leader, GetIdleAnimationId(leader), dir);
                    }
                    if (!(r8b & 2)) {
                        if (r8b & 1) {
                            if (local_24 != 0) {
                                LogMessageByIdWithPopupCheckUser(leader, local_24);
                            }
                            SetLeaderActionFields(1);
                            DUNGEON_PTR->pass_turn = TRUE;
                            DUNGEON_PTR->field_0x1d8.x = -1;
                            DUNGEON_PTR->field_0x1d8.y = -1;
                            break;
                        }
                        SetLeaderActionFields(2);
                        if (local_40 != 0) {
                            DUNGEON_PTR->field_0x1d8 = pos_b2;
                            PlaySeVolumeWrapper(7);
                        }
                        if (((DUNGEON_BUTTON_INPUT[0] & 2) || local_3c != 0) &&
                            CeilFixedPoint(monster->belly) != 0) {
                            if (((struct monster *) leader->info)->cringe_class_status.cringe != 2) {
                                DUNGEON_PTR->leader_running = TRUE;
                            }
                            monster->action.action_parameters[0].action_use_idx = 0;
                        } else {
                            monster->action.action_parameters[0].action_use_idx = 1;
                        }
                        break;
                    } else {
                        if (r8b & 1) {
                            ov29_022EA3B4(0x23);
                        }
                        DUNGEON_PTR->field_0x1d8.x = -1;
                        DUNGEON_PTR->field_0x1d8.y = -1;
                    }
                    }
                }
            } else {
                DUNGEON_PTR->field_0x1d8.x = -1;
                DUNGEON_PTR->field_0x1d8.y = -1;
            }
            AdvanceFrame(0xF);
        }

        if (display->team_menu_or_grid) {
            HideTileGrid();
        }
        if (monster->action.action_id == ACTION_UNK_2D ||
            monster->action.action_id == ACTION_TALK_FIELD) {
            TalkToTeamMemberInFront(leader);
            if (IsFloorOver()) {
                return;
            }
            SetLeaderActionFields(0);
            continue;
        }
        if (buf[0] == 0) {
            DUNGEON_PTR->field_0x78c = 0;
            if (monster->action.action_id != ACTION_NOTHING) {
                if (ov29_022EB944(leader)) {
                    return;
                }
                AdvanceFrame(0xF);
                return;
            }
            AdvanceFrame(0xF);
            continue;
        }
        AdvanceFrame(0xF);
        ov29_02346E5C();
        ov29_0233A248(0);
        UnkMapRelatedFunc(1, 0);
        if (buf[3] != 0 &&
            !ShouldMonsterRunAwayAndShowEffect(GetLeader(), TRUE)) {
            PlaySeVolumeWrapper(4);
            OpenMenu(buf[1] == 0, buf[2], TRUE);
            sub_02006B70();
        } else {
            PlaySeVolumeWrapper(4);
            OpenMenu(buf[1] == 0, buf[2], FALSE);
            sub_02006B70();
        }
        ov29_022E0B44();
#ifdef EUROPE
        ov29_022F2FE4();
#endif
        ov29_0237C9A4.field_0x2 = 0;
        display->team_menu_or_grid = 0;
        HideTileGrid();
        if (IsFloorOver()) {
            return;
        }
        if (monster->action.action_id != ACTION_NOTHING) {
            if (monster->action.action_id == ACTION_QUICKSAVE) {
                DUNGEON_PTR->end_floor_no_death_check_flag = TRUE;
                DUNGEON_PTR->quicksave_flag = TRUE;
            }
            if (monster->action.action_id == ACTION_GIVE_UP) {
                DUNGEON_PTR->end_floor_no_death_check_flag = TRUE;
                DUNGEON_PTR->quicksave_flag = FALSE;
            }
            return;
        }
        AdvanceFrame(0xF);
        if (DUNGEON_PTR->end_floor_no_death_check_flag) {
            return;
        }
    }
}
