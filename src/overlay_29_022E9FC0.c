#include "overlay_29_022E9FC0.h"
#include "dg_camera.h"
#include "dungeon.h"
#include "dungeon_map_access.h"
#include "dungeon_util_static.h"
#include "main_0201BCCC.h"
#include "options.h"
#include "overlay_29_0234B104.h"

struct unk_02353560 {
    u8 field_0x0;
    u8 field_0x1;
    u8 field_0x2;
    u8 field_0x3;
    u8 field_0x4;
    u8 field_0x5;
    u8 field_0x6;
    u8 field_0x7;
    s32 field_0x8;
    s32 field_0xc;
};

struct unk_0237C850 {
    u32 field_0x0;
    s32 field_0x4;
    s32 field_0x8;
    u8 field_0xc;
    u8 field_0xd;
    u8 field_0xe;
    u8 field_0xf;
    s32 field_0x10;
    u8 field_0x14;
    u8 field_0x15;
    u8 field_0x16;
    u8 field_0x17;
    u8 field_0x18;
    u8 field_0x19;
    u8 field_0x1a;
    u8 field_0x1b;
    s16 field_0x1c;
    u16 field_0x1e;
    s32 field_0x20;
    u8 field_0x24;
    u8 field_0x25;
    u8 field_0x26;
    u8 field_0x27;
    struct entity *field_0x28;
    u32 field_0x2c;
    s32 field_0x30;
    s32 field_0x34;
};

extern struct dungeon *DUNGEON_PTR[2];
extern struct unk_02353560 ov29_02353560;
extern struct unk_0237C850 DUNGEON_FRAMES_PASSED;
extern u16 DUNGEON_BUTTON_INPUT[8];
extern u8 *ov29_02353540;
extern struct unk_0201BCCC *OBJ_GRAPHICS_CONTROLS_PTR;

extern void ov29_022DDEF8(void);
extern void InitWeirdMinimapMatrix(void);
extern void ov29_022DE638(s32 param_1);
extern void ov29_02339FF4(s32 param_1);
extern void ov29_0233A248(s32 param_1);
extern void UpdateMinimap(void);
extern void ChangeSimpleObjTexture(struct unk_oam_sub *obj, u8 *texture, s16 param_3,
                            s32 param_4, u8 param_5, u8 param_6);
extern void ov29_02335F40(s16 param_1, s16 param_2, s32 param_3, s16 param_4,
                   u16 param_5, s16 param_6, u8 param_7);
extern void ov29_0234B854(void);
extern void HandleTopScreenFades(void);
extern void UpdateCamera(s32 param_1);
extern void sub_02051E20(s16 param_1, s16 param_2, s32 param_3, s32 param_4);
extern void ov29_0230473C(void);
extern void DisplayMonstersAndItems(void);
extern void RenderWeather3D(void);
extern void ov29_022E8C10(void);
extern void FlashLeaderIcon(s32 param_1);
extern void DisplayUi(void);
extern bool8 ov29_022DE11C(void);
extern s32 GetAlertBoxLoadingStatus(void);
extern void ov29_022DE134(s32 param_1, s32 param_2, struct rgba *param_3, u8 param_4);
extern void ov29_022ED800(struct dungeon_generation_info *param_1, u8 param_2,
                   struct display_data *param_3);
extern void ov29_022DD8B4(struct position *param_1);

u8 ov29_022E9FC0(void)
{
    return ov29_02353560.field_0x3;
}

void ov29_022E9FD0(u8 value)
{
    ov29_02353560.field_0x3 = value;
}

void AdvanceFrame(u32 param_1)
{
    if (ov29_02353560.field_0x3) {
        ov29_022EA2A4(param_1);
    }
    else {
        ov29_022EA324(param_1);
    }
}

void ov29_022EA008(void)
{
    struct dungeon *dungeon;
    struct tile *tile;
    u8 room;

    if (DUNGEON_PTR[0] == NULL) {
        return;
    }
    if (ov29_02353560.field_0x3) {
        ov29_0234B854();
        HandleTopScreenFades();
        if (DUNGEON_PTR[0] != NULL) {
            UpdateCamera(1);
            sub_02051E20(DUNGEON_PTR[0]->display_data.camera_pixel_pos.x,
                         DUNGEON_PTR[0]->display_data.camera_pixel_pos.y
                             - DUNGEON_PTR[0]->display_data.screen_shake_offset,
                         1, 0);
            if (DUNGEON_PTR[0]->display_data.team_menu_or_grid) {
                DUNGEON_PTR[0]->display_data.field_0x20 = 2;
                sub_02051E20(DUNGEON_PTR[0]->display_data.camera_pixel_pos.x,
                             DUNGEON_PTR[0]->display_data.camera_pixel_pos.y
                                 - DUNGEON_PTR[0]->display_data.screen_shake_offset,
                             0, 0);
            }
            else {
                DUNGEON_PTR[0]->display_data.field_0x20 = 3;
                sub_02051E20(0, 0, 0, 0);
            }
        }
        ov29_0230473C();
        DisplayMonstersAndItems();
        ov29_022E335C();
        if (DUNGEON_PTR[0]->field_0x1c < 100) {
            DUNGEON_PTR[0]->field_0x1c++;
        }
        if (DUNGEON_FRAMES_PASSED.field_0x4 == 0 || DUNGEON_FRAMES_PASSED.field_0x4 == 3
            || DUNGEON_FRAMES_PASSED.field_0x4 == 12) {
            FlashLeaderIcon(0);
        }
        else if (GetTopScreenOption() == 3) {
            FlashLeaderIcon(1);
        }
        AnimateWaterShadows();
        ov29_022EA80C();
        DisplayUi();
        if (ov29_02353560.field_0x0) {
            if (DUNGEON_PTR[0]->display_data.field_0x2E) {
                if (ov29_022DE11C()) {
                    DUNGEON_PTR[0]->display_data.field_0x2E = 0;
                    ov29_02353560.field_0xc = ov29_02353560.field_0x8;
                }
            }
            else {
                ov29_02353560.field_0xc--;
                if (ov29_02353560.field_0xc <= 0) {
                    DUNGEON_PTR[0]->display_data.field_0x2E = 1;
                }
            }
        }
        if (DUNGEON_PTR[0]->display_data.field_0x2E && GetAlertBoxLoadingStatus() != 3) {
            ov29_022DE134(0xA0, 0x20, DUNGEON_PTR[0]->color_table,
                          ov29_02353560.field_0x2);
        }
        tile = GetTile(DUNGEON_PTR[0]->display_data.camera_pos.x,
                       DUNGEON_PTR[0]->display_data.camera_pos.y);
        if (tile != NULL) {
            room = tile->room;
            dungeon = DUNGEON_PTR[0];
            ov29_022ED800(dungeon != NULL ? &dungeon->gen_info : NULL, room,
                          &dungeon->display_data);
        }
        RenderWeather3D();
        ov29_022E8C10();
        ov29_022DD8B4(&DUNGEON_PTR[0]->display_data.camera_pixel_pos);
    }
    DUNGEON_FRAMES_PASSED.field_0x0++;
}

void ov29_022EA2A4(u32 param_1)
{
    if (DUNGEON_PTR[0] == NULL) {
        ov29_022DDEF8();
        return;
    }
    if (ov29_02353560.field_0x6) {
        DUNGEON_FRAMES_PASSED.field_0x10++;
    }
    ov29_022DDEF8();
    DUNGEON_PTR[0]->display_data.field_0x2C = 0;
    InitWeirdMinimapMatrix();
    if (ov29_02353560.field_0x6) {
        DUNGEON_FRAMES_PASSED.field_0x10--;
    }
}

void ov29_022EA324(u32 param_1)
{
    if (ov29_02353560.field_0x6) {
        DUNGEON_FRAMES_PASSED.field_0x10++;
    }
    ov29_022DDEF8();
    if (ov29_02353560.field_0x6) {
        DUNGEON_FRAMES_PASSED.field_0x10--;
    }
}

void ov29_022EA370(s32 a, s32 b)
{
    while (a != 0) {
        if (ov29_02353560.field_0x3) {
            ov29_022EA2A4(b);
        }
        else {
            ov29_022EA324(b);
        }
        a--;
    }
}

void ov29_022EA3B4(s32 param_1)
{
    do {
        if (ov29_02353560.field_0x3) {
            ov29_022EA2A4(param_1);
        }
        else {
            ov29_022EA324(param_1);
        }
    } while (DUNGEON_BUTTON_INPUT[0] & 0xF0);
}

void ov29_022EA3F8(void)
{
    ov29_022DE638(0x100);
}

s32 ov29_022EA408(void)
{
    return DUNGEON_FRAMES_PASSED.field_0x4;
}

void ov29_022EA418(u8 param_1)
{
    ov29_02353560.field_0x4 = param_1;
}

void UnkMapRelatedFunc(s32 switch_case, u32 param_2)
{
    if (switch_case == DUNGEON_FRAMES_PASSED.field_0x4) {
        return;
    }
    switch (switch_case) {
    case 1:
        if (ov29_02353560.field_0x3) {
            ov29_0234B1A4(0);
        }
        break;
    case 0:
        if (ov29_02353560.field_0x3 && !ov29_02353560.field_0x4) {
            UpdateMinimap();
            ov29_02339FF4(0);
        }
        break;
    case 3:
        if (ov29_02353560.field_0x3 && !ov29_02353560.field_0x4) {
            ov29_02339FF4(1);
        }
        break;
    case 6:
        if (ov29_02353560.field_0x3) {
            ov29_0234B1A4(0);
        }
        break;
    case 7:
        if (ov29_02353560.field_0x3) {
            ov29_0234B1A4(0);
        }
        break;
    case 2:
    case 4:
        if (ov29_02353560.field_0x3) {
            ov29_0234B1A4(0);
            if (GetBottomScreenOption()) {
                ov29_0233A248(0);
            }
        }
        break;
    case 5:
        if (ov29_02353560.field_0x3) {
            ov29_0234B1A4(0);
            ov29_0233A248(0);
        }
        break;
    case 13:
        if (ov29_02353560.field_0x3 && !ov29_02353560.field_0x4) {
            UpdateMinimap();
            ov29_02339FF4(1);
        }
        switch_case = 0;
        break;
    case 8:
        if (ov29_02353560.field_0x3) {
            ov29_0234B1A4(0);
        }
        break;
    case 9:
        if (ov29_02353560.field_0x3) {
            ov29_0234B1A4(0);
        }
        break;
    case 11:
        if (ov29_02353560.field_0x3) {
            ov29_0234B1A4(0);
        }
        break;
    case 999:
        break;
    }
    DUNGEON_FRAMES_PASSED.field_0x4 = switch_case;
}

void ov29_022EA62C(void)
{
    DUNGEON_FRAMES_PASSED.field_0x4 = 10;
    ov29_0234B1A4(FALSE);
}

void AnimateWaterShadows(void)
{
    s32 frame;

    DUNGEON_FRAMES_PASSED.field_0x8++;
    if (DUNGEON_FRAMES_PASSED.field_0x8 < 0) {
        DUNGEON_FRAMES_PASSED.field_0x8 = 0;
    }
    if (DUNGEON_FRAMES_PASSED.field_0x8 >= 12) {
        DUNGEON_FRAMES_PASSED.field_0x8 = 0;
    }
    frame = DUNGEON_FRAMES_PASSED.field_0x8 / 4 * 3;
    ChangeSimpleObjTexture(OBJ_GRAPHICS_CONTROLS_PTR->field_0x0,
                           ov29_02353540 + frame * 0x100, 0x1E8, 0x100, 0, 0xB);
    ChangeSimpleObjTexture(OBJ_GRAPHICS_CONTROLS_PTR->field_0x0,
                           ov29_02353540 + (frame * 0x100 + 0x100), 0x1EA, 0x200,
                           0, 0xB);
}

void DisplayAnimatedNumbers(s32 amount, struct entity *entity, bool8 display_sign,
                            s32 number_color)
{
    s32 i;

    if (amount == 0) {
        return;
    }
    if (DUNGEON_PTR[0]->display_data.blinded) {
        return;
    }
    for (i = 0; i < 20; i++) {
        if (DUNGEON_FRAMES_PASSED.field_0x1c == 0) {
            break;
        }
        if (ov29_02353560.field_0x3) {
            ov29_022EA2A4(0x29);
        }
        else {
            ov29_022EA324(0x29);
        }
    }
    DUNGEON_FRAMES_PASSED.field_0x20 = amount;
    DUNGEON_FRAMES_PASSED.field_0x24 = display_sign;
    DUNGEON_FRAMES_PASSED.field_0x1c = 60;
    DUNGEON_FRAMES_PASSED.field_0x28 = entity;
    DUNGEON_FRAMES_PASSED.field_0x2c = entity->spawn_genid;
    DUNGEON_FRAMES_PASSED.field_0x30 = 0;
    DUNGEON_FRAMES_PASSED.field_0x34 = 0;
    if (number_color < 0) {
        if (amount < -999) {
            DUNGEON_FRAMES_PASSED.field_0x1e = 6;
        }
        else if (amount >= 0) {
            DUNGEON_FRAMES_PASSED.field_0x1e = 10;
        }
        else {
            DUNGEON_FRAMES_PASSED.field_0x1e = 3;
        }
    }
    else {
        DUNGEON_FRAMES_PASSED.field_0x1e = number_color;
    }
}

void ov29_022EA80C(void)
{
    const struct unk_0237C850 *cframes;
    struct entity *entity;
    struct monster *info;
    bool8 valid;
    s32 x;
    s32 y;
    s32 alpha;

    if (DUNGEON_FRAMES_PASSED.field_0x1c == 0) {
        return;
    }
    if (DUNGEON_FRAMES_PASSED.field_0x28 == NULL) {
        valid = FALSE;
    }
    else {
        valid = GetEntityType(DUNGEON_FRAMES_PASSED.field_0x28) != ENTITY_NOTHING;
    }
    if (!valid) {
        DUNGEON_FRAMES_PASSED.field_0x1c = 0;
        return;
    }
    cframes = &DUNGEON_FRAMES_PASSED;
    entity = cframes->field_0x28;
    if (DUNGEON_FRAMES_PASSED.field_0x2c != entity->spawn_genid) {
        DUNGEON_FRAMES_PASSED.field_0x1c = 0;
        return;
    }
    DUNGEON_FRAMES_PASSED.field_0x1c--;
    DUNGEON_FRAMES_PASSED.field_0x34 -= 0x2E;
    info = GetEntInfo(entity);
    x = info->pixel_pos.x + (DUNGEON_FRAMES_PASSED.field_0x30 >> 8)
        - DUNGEON_PTR[0]->display_data.camera_pixel_pos.x;
    y = info->pixel_pos.y + (DUNGEON_FRAMES_PASSED.field_0x34 >> 8) - 0x18
        - DUNGEON_PTR[0]->display_data.camera_pixel_pos.y;
    if (x < -0x20 || y < -8) {
        return;
    }
    if (x >= 0xFF || y >= 0xC0) {
        return;
    }
    alpha = 0xFF;
    if (DUNGEON_FRAMES_PASSED.field_0x1c < 0x1F) {
        alpha = DUNGEON_FRAMES_PASSED.field_0x1c * 0xFF / 0x1F;
    }
    ov29_02335F40(x, y, 0xFF, alpha, DUNGEON_FRAMES_PASSED.field_0x1e,
                  DUNGEON_FRAMES_PASSED.field_0x20, DUNGEON_FRAMES_PASSED.field_0x24);
}
