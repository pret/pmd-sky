#ifndef PMDSKY_OVERLAY_29_022E563C_H
#define PMDSKY_OVERLAY_29_022E563C_H

#include "dungeon_mode.h"
#include "enums.h"
#include "item.h"
#include "move.h"

void ov29_022E563C(struct pixel_position *pixel_pos);

void ov29_022E5650(struct entity *a, struct entity *b);
void PlaySeByIdIfShouldDisplayEntity(struct entity *entity, s32 se_id);
void ov29_022E56D4(struct position *pos, s32 se_id);
void ov29_022E56F4(struct entity *entity, s32 id);
void PlayItemThrowSfx(struct entity *entity, enum item_category category);
void PlayMissSfx__022E611C(struct entity *attacker, struct entity *defender);
void PlayMissSfx__022E6150(struct entity *entity);
void ov29_022E57D4(struct entity *entity);
void ov29_022E5864(struct entity *entity);
void ov29_022E58B0(struct entity *entity, struct position *pos, s32 trap_id);
void ov29_022E5A00(struct entity *entity, struct item *item);
void ov29_022E5AE4(struct entity *entity, struct item *item);
s32 ov29_022E5BD8(struct entity *entity);
void PlayStairsSfx(void);
void ov29_022E5DBC(s32 param_1, s32 param_2);
void ov29_022E5E84(struct entity *a, struct entity *b);
bool8 ShouldDisplayEntityAdvanced(struct entity *entity);
void ov29_022E5F20(void);
void ov29_022E5FE8(enum weather_id weather, bool8 param_2);
void ov29_022E60E4(struct entity *entity);
void PlayEffectAnimation0x1A9__022E6130(struct entity *entity);
void PlayEffectAnimation0x1A9__022E617C(struct entity *entity);
void PlayEffectAnimation0x1A9__022E61C8(struct entity *entity);
void PlayEffectAnimation0x1A9__022E6214(struct entity *entity);
void ov29_022E6260(struct entity *entity);
void PlayEffectAnimation0x29(struct entity *entity);
void ov29_022E62F0(struct entity *entity);
void ov29_022E6338(struct entity *entity);
void ov29_022E6388(struct entity *entity);
void PlayEffectAnimation0x18E(struct entity *entity);
void ov29_022E6424(struct entity *entity);
void ov29_022E647C(struct entity *entity);
void PlayEffectAnimation0x1A9__022E64C4(struct entity *entity);
void PlayEffectAnimation0x1A9__022E6510(struct entity *entity);
void ov29_022E655C(struct entity *entity);
void ov29_022E65A8(struct entity *entity);
void ov29_022E65F4(struct entity *entity);
void ov29_022E6644(struct entity *entity);
void PlayKeyDoorUnlockEffect(struct position *pos, bool8 param_2);

#endif
