#ifndef PMDSKY_MAIN_0207222C_H
#define PMDSKY_MAIN_0207222C_H

#include "dse.h"

u8* DseTrackEvent_SetupKeyBendLfoEnvelope(u8 *ptr_next_byte, struct dse_sequence *sequence, struct dse_track *track, struct dse_channel *channel);
u8* DseTrackEvent_UseKeyBendLfo(u8 *ptr_next_byte, struct dse_sequence *sequence, struct dse_track *track, struct dse_channel *channel);

#endif
