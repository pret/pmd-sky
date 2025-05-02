#include "number_util.h"

s32 CeilFixedPoint(struct fixed_point val_fp)
{
    if (val_fp.integer == 0)
    {
        if (val_fp.fractional == 0)
        {
            return 0;
        }
        return 1;
    }
    else if (val_fp.fractional != 0)
    {
        return val_fp.integer + 1;
    }
    else
    {
        return val_fp.integer;
    }
}
