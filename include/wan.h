#ifndef PMDSKY_WAN_H
#define PMDSKY_WAN_H

#include "util.h"

struct wan_animation_frame {
    u8 duration;
    u8 flag;
    u16 frame_id;
    struct vec2_16 offset;
    struct vec2_16 shadow_offset;
};

#endif //PMDSKY_WAN_H