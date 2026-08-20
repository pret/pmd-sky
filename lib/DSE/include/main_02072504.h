#ifndef PMDSKY_MAIN_02072504_H
#define PMDSKY_MAIN_02072504_H

#include "dse.h"

u8* DseTrackEvent_SetupVolumeLfoEnvelope(u8 *ptr_next_byte, struct dse_sequence *sequence, struct dse_track *track, struct dse_channel *channel);
u8* DseTrackEvent_UseVolumeLfo(u8 *ptr_next_byte, struct dse_sequence *sequence, struct dse_track *track, struct dse_channel *channel);

#endif
