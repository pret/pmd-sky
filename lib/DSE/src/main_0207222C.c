#include "main_0207222C.h"

u8* DseTrackEvent_SetupKeyBendLfoEnvelope(u8 *ptr_next_byte, struct dse_sequence *sequence, struct dse_track *track, struct dse_channel *channel)
{
    channel->lfo_settings[0].msec_until_lfo_started = ptr_next_byte[0] + (ptr_next_byte[1] << 8);
    channel->lfo_settings[0].lfo_envelope_len_msec = ptr_next_byte[2] + (ptr_next_byte[3] << 8);
    ptr_next_byte += 4;
    return ptr_next_byte;
}

u8* DseTrackEvent_UseKeyBendLfo(u8 *ptr_next_byte, struct dse_sequence *sequence, struct dse_track *track, struct dse_channel *channel)
{
    u8 v = *ptr_next_byte++;

    if (v == 2) {
        v = 1;
    }
    channel->lfo_settings[0].type = v;
    if (v == 0) {
        channel->lfo_settings[0].output_type = 0;
    } else {
        channel->lfo_settings[0].output_type = 1;
    }
    return ptr_next_byte;
}
