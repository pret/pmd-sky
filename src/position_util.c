#include "position_util.h"

const s32 POSITION_DISPLACEMENT_TO_DIRECTION[3][3] =
{
    {DIR_UP_LEFT, DIR_UP, DIR_UP_RIGHT},
    {DIR_LEFT, DIR_DOWN, DIR_RIGHT},
    {DIR_DOWN_LEFT, DIR_DOWN, DIR_DOWN_RIGHT}
};

s32 GetDirectionTowardsPosition(struct position *origin, struct position *target)
{
    s32 x_diff = target->x - origin->x;
    s32 y_diff = target->y - origin->y;
    if (x_diff == 0 && y_diff == 0)
        return DIR_DOWN;

    if (x_diff >= 1)
        x_diff = 1;

    if (y_diff >= 1)
        y_diff = 1;

    if (x_diff <= -1)
        x_diff = -1;

    if (y_diff <= -1)
        y_diff = -1;

    return POSITION_DISPLACEMENT_TO_DIRECTION[++y_diff][++x_diff];
}
