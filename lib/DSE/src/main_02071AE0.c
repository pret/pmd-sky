#include "main_02071AE0.h"

u8* DseTrackEvent_SetBpm(u8 *ptr_next_byte, struct dse_sequence *sequence, struct dse_track *track, struct dse_channel *channel)
{
    u8 bpm = *ptr_next_byte;
    u32 t = (u32) ((sequence->tempo.current >> 16) * bpm) >> 8;

    if (t == 0) {
        t = 1;
    }
    sequence->microseconds_per_beat = _u32_div_f(0x03938700, t);
    sequence->bpm = bpm;
    return ptr_next_byte + 1;
}
