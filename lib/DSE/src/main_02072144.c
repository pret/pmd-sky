#include "main_02072144.h"

u8* DseTrackEvent_SetNoteRandomRegion(u8 *ptr_next_byte, struct dse_sequence *sequence, struct dse_track *track, struct dse_channel *channel)
{
    u8 a = ptr_next_byte[0];
    u8 b = ptr_next_byte[1];
    u8 lo = a;
    u8 hi = b;

    ptr_next_byte += 2;
    if (a > b) {
        lo = b;
        hi = a;
    }
    channel->note_random_region_begin = lo;
    channel->note_random_region_end = hi;
    return ptr_next_byte;
}
