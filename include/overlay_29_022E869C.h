#ifndef PMDSKY_OVERLAY_29_022E869C_H
#define PMDSKY_OVERLAY_29_022E869C_H

#include "dungeon.h"
#include "dungeon_mode.h"
#include "item.h"
#include "move.h"

struct unk_02353554 {
    u8 field_0x0;
    u8 field_0x1[3];
    s32 field_0x4;
    s16 field_0x8;
    u8 field_0xa[0x1a];
    u8 field_0x24;
    u8 field_0x25[4];
    u8 field_0x29;
    u8 field_0x2a;
    u8 field_0x2b;
    u8 field_0x2c;
    u8 field_0x2d[0x53];
    u8 field_0x80[0x38];
    u8 field_0xb8[0x170];
    u8 field_0x228;
    u8 field_0x229;
    u8 field_0x22a[6];
};

struct unk_022E8054 {
    u8 field_0x0[0x10];
    u8 field_0x10;
};

void FreeTopScreenStatus(void);
void ov29_022E7F7C(void);
bool8 ov29_022E7F94(void);
bool8 ov29_022E8018(void);
void ov29_022E8054(struct unk_022E8054 *a);
bool8 ov29_022E80D0(void);
void ov29_022E8104(void);
bool8 InitializeTeamStats(void);
bool8 UpdateTeamStatsWrapper(void);
void ov29_022E81C8(struct unk_022E8054 *a);
bool8 FreeTeamStatsWrapper(void);
void ov29_022E81F8(void);
void ov29_022E8244(void);
void DisplayTeamStatsSprite(struct entity *entity, s16 a, s16 b);
bool8 ov29_022E840C(void);
void ov29_022E847C(struct unk_022E8054 *a);
bool8 ov29_022E84B0(void);
bool8 InitDungeonControlsMenuWithBg(void);
void ov29_022E854C(struct unk_022E8054 *a);
bool8 FreeDungeonControlsMenuWithBg(void);
bool8 ov29_022E85A8(void);
void ov29_022E85F4(struct unk_022E8054 *a);
bool8 ov29_022E8630(void);
bool8 ov29_022E8650(void);
bool8 ov29_022E869C(void);

#endif
