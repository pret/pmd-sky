#include "main_020724A8.h"

u8* DseTrackEvent_SetupVolumeLfo(u8 *ptr_next_byte, struct dse_sequence *sequence, struct dse_track *track, struct dse_channel *channel)
{
    u8 b0 = ptr_next_byte[0];
    u8 b1 = ptr_next_byte[1];
    u8 b2 = ptr_next_byte[2];
    u8 b3 = ptr_next_byte[3];
    u8 b4 = ptr_next_byte[4];
    struct dse_lfo_settings *lfo = &channel->lfo_settings[1];

    lfo->type = 1;
    lfo->output_type = 2;
    lfo->lfo_waveform_index = b4;
    lfo->amplitude = (s16) (b0 + (b1 << 8));
    lfo->lfo_phase_change_msec = b2 + (b3 << 8);
    lfo->msec_until_lfo_started = 0;
    lfo->lfo_envelope_len_msec = 0;
    lfo->field_0xE = 0;
    return ptr_next_byte + 5;
}
