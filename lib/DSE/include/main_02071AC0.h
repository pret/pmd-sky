#ifndef PMDSKY_MAIN_02071AC0_H
#define PMDSKY_MAIN_02071AC0_H

#include "dse.h"

u8* DseTrackEvent_SetOctave(u8 *ptr_next_byte, struct dse_sequence *sequence, struct dse_track *track, struct dse_channel *channel);
u8* DseTrackEvent_OctaveDelta(u8 *ptr_next_byte, struct dse_sequence *sequence, struct dse_track *track, struct dse_channel *channel);

#endif
