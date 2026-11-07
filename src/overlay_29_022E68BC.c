#include "overlay_29_022E68BC.h"

extern void PlayEscapeEffect(s32 a, struct entity *entity, s32 b);

void PlayStandardEscapeEffect__022E726C(struct entity *entity)
{
    PlayEscapeEffect(0x13E, entity, 5);
}

void PlayEscapeOrbEscapeEffect(struct entity *entity)
{
    PlayEscapeEffect(0x1BC, entity, 0xE);
}

void PlayStandardEscapeEffect__022E72A0(struct entity *entity)
{
    PlayEscapeEffect(0x13E, entity, 5);
}

void PlayStandardEscapeEffect__022E72BC(struct entity *entity)
{
    PlayEscapeEffect(0x13E, entity, 5);
}
