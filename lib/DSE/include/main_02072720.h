#ifndef PMDSKY_MAIN_02072720_H
#define PMDSKY_MAIN_02072720_H

#include "dse.h"

u8* DseTrackEvent_SetupPanLfoEnvelope(u8 *ptr_next_byte, struct dse_sequence *sequence, struct dse_track *track, struct dse_channel *channel);
u8* DseTrackEvent_UsePanLfo(u8 *ptr_next_byte, struct dse_sequence *sequence, struct dse_track *track, struct dse_channel *channel);

#endif
