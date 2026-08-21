#ifndef PMDSKY_OVERLAY_11_0230CB88_H
#define PMDSKY_OVERLAY_11_0230CB88_H

struct unk_0238A098 {
    u32 field_0x0[38];
};

#include "util.h"
#include "main_020348E4.h"

void ov11_0230CB88(s32 a);
u32 LoadDuskullBankOverlay(void);
u32 LoadLuminousSpringOverlay(void);
void LoadChimechoAssemblyOverlay(s32 a);
void LoadElectivireLinkShopOverlay(s32 a);
void LoadSpindaCafeOverlayInit(void);
void LoadSpindaCafeOverlayResume(void);
bool8 IsSpindaCafeOverlaySuspended(void);
void LoadRecycleShopOverlayInit(void);
void LoadRecycleShopOverlayResume(void);
bool8 IsRecycleShopOverlaySuspended(void);
s32 ov11_0230CCF0(struct unk_0238A098 *dst);

#endif
