#include "main_0201D198.h"
#include "graphics.h"

void SetAnimationControlPausedFlag(struct animation_control* anim, bool8 paused)
{
    if (paused) {
        anim->some_bitfield |= 0x4000;
    } else {
        anim->some_bitfield &= ~0x4000;
    }
}
