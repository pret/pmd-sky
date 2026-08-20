#include "overlay_29_0234396C.h"

u8 FixedRoomActionParamToDirection(u8 action_param)
{
    if (action_param == 0) {
        return 0xFF;
    }

    return action_param - 1;
}
