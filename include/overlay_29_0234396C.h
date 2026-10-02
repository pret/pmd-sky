#ifndef PMDSKY_OVERLAY_29_0234396C_H
#define PMDSKY_OVERLAY_29_0234396C_H

#include "dungeon_mode.h"

u8 FixedRoomActionParamToDirection(u8 action_param);
void ov29_02343980(void);
void TryOpenKeyDoor(struct entity* arg0, struct tile* arg1, s32 arg2, s32 arg3);
void ApplyKeyEffect(struct entity* entity);
void ov29_02343D30(struct entity* entity);
void LoadFixedRoomData(void);
void *ov29_02343DC4(void);
void ov29_02343DD8(void);

#endif
