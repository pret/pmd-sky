#ifndef PMDSKY_OVERLAY_11_022FE58C_H
#define PMDSKY_OVERLAY_11_022FE58C_H

#include "overlay_11_022FE490.h"

void SetMovementRangeLivePerformer(struct unk_022FE490 *p, struct unk_022FE498 *a,
        struct unk_022FE498 *b);
void GetCollisionBoxCenterLivePerformer(struct unk_022FE490 *p, struct unk_022FE498 *out);
void SetPositionLivePerformerVeneer(struct unk_022FE490 *p, struct unk_022FE498 *v);
void GetHeightLivePerformer(struct unk_022FE490 *p, s32 *a, s32 *b);
void SetHeightLivePerformer(struct unk_022FE490 *p, s32 h);
void GetDirectionLivePerformer(struct unk_022FE490 *p, s8 *dir);
void SetDirectionLivePerformer(struct unk_022FE490 *p, s8 dir);

#endif
