#include "main_02072668.h"

u8* DseTrackEvent_PanFade(u8 *ptr_next_byte, struct dse_sequence *sequence, struct dse_track *track, struct dse_channel *channel)
{
    u16 ticks = ptr_next_byte[0] + (ptr_next_byte[1] << 8);
    s32 target = *(s8 *)&ptr_next_byte[2] << 16;

    channel->pan.target = target;
    if (ticks == 0) {
        channel->pan.current = target;
    } else {
        s32 diff = target - channel->pan.current;

        if (diff == 0) {
            ticks = 0;
        } else {
            channel->pan.delta = diff / ticks;
        }
    }
    channel->pan.ticks_remaining = ticks;
    return ptr_next_byte + 3;
}
