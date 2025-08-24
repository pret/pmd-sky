#ifndef PMDSKY_OVERLAY_11_022EBB40_H
#define PMDSKY_OVERLAY_11_022EBB40_H

#include "ground_bg.h"

void LoadBackgroundAttributes(struct bg_list_entry *entry, s32 bg_id);
void GroundBgInit(struct ground_bg *ground_bg, const struct ground_bg_substruct_52c *a1);
void GroundBgFreeAll(struct ground_bg *ground_bg);

#endif //PMDSKY_OVERLAY_11_022EBB40_H
