#include "main_020727C8.h"

u8* DseTrackEvent_SetupLfoEnvelope(u8 *ptr_next_byte, struct dse_sequence *sequence, struct dse_track *track, struct dse_channel *channel)
{
    struct dse_lfo_settings *lfo = &channel->lfo_settings[channel->field_0x5A[7]];

    lfo->msec_until_lfo_started = ptr_next_byte[0] + (ptr_next_byte[1] << 8);
    lfo->lfo_envelope_len_msec = ptr_next_byte[2] + (ptr_next_byte[3] << 8);
    ptr_next_byte += 4;
    return ptr_next_byte;
}
