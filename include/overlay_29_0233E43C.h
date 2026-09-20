#ifndef PMDSKY_OVERLAY_29_0233E43C_H
#define PMDSKY_OVERLAY_29_0233E43C_H

#include "overlay_29_0233C9E8.h"


void CreateGridCellConnections(struct unk_0233C9E8 (*grid)[15], s32 grid_size_x,
                               s32 grid_size_y, s32 *arg4, s32 *arg5, bool8 arg6);
void GenerateRoomImperfections(struct unk_0233C9E8 (*grid)[15], s32 grid_size_x, s32 grid_size_y);
void CreateHallway(s32 x, s32 y, s32 end_x, s32 end_y, bool8 vertical, s32 turn_x, s32 turn_y);

#endif //PMDSKY_OVERLAY_29_0233E43C_H
