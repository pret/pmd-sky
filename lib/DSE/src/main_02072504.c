#include "main_02072504.h"

u8* DseTrackEvent_SetupVolumeLfoEnvelope(u8 *ptr_next_byte, struct dse_sequence *sequence, struct dse_track *track, struct dse_channel *channel)
{
    channel->lfo_settings[1].msec_until_lfo_started = ptr_next_byte[0] + (ptr_next_byte[1] << 8);
    channel->lfo_settings[1].lfo_envelope_len_msec = ptr_next_byte[2] + (ptr_next_byte[3] << 8);
    ptr_next_byte += 4;
    return ptr_next_byte;
}

u8* DseTrackEvent_UseVolumeLfo(u8 *ptr_next_byte, struct dse_sequence *sequence, struct dse_track *track, struct dse_channel *channel)
{
    u8 v = *ptr_next_byte++;

    if (v == 2) {
        v = 1;
    }
    channel->lfo_settings[1].type = v;
    if (v == 0) {
        channel->lfo_settings[1].output_type = 0;
    } else {
        channel->lfo_settings[1].output_type = 2;
    }
    return ptr_next_byte;
}
