#ifndef PMDSKY_OVERLAY_13_ENTRY_OVERLAY_13_H
#define PMDSKY_OVERLAY_13_ENTRY_OVERLAY_13_H

// Main function of this overlay.
void EntryOverlay13(void);
void ExitOverlay13(void);
// Handles the 'return' value from MENU_PERSONALITY_TEST called by scripts.
u32 PersonalityTestFrameUpdate(void);

#endif // PMDSKY_OVERLAY_13_ENTRY_OVERLAY_13_H
