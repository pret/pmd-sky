#include "overlay_29_0233AE78.h"

u16 GetTileTerrain(struct tile *tile)
{
    return tile->terrain_flags & 3;
}
