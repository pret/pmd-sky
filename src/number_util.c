#include "number_util.h"

struct fixed_point sub_02050EBC(struct fixed_point a, struct fixed_point b)
{
    a.fractional += b.fractional;
    a.integer += b.integer;
    if (a.fractional >= 1000)
    {
        a.integer++;
        a.fractional -= 1000;
    }
    return a;
}

struct fixed_point SubFixedPoint(struct fixed_point a, struct fixed_point b)
{
    a.fractional -= b.fractional;
    a.integer -= b.integer;
    if (a.fractional < 0)
    {
        a.integer--;
        a.fractional += 1000;
    }
    if (a.integer < 0)
    {
        a.fractional = 0;
        a.integer = 0;
    }
    return a;
}

struct fixed_point sub_02050F78(struct fixed_point a, struct fixed_point b)
{
    struct fixed_point result;

    if (a.integer > b.integer)
        return b;
    if (a.integer < b.integer)
        return a;

    if (a.fractional > b.fractional)
        result = b;
    else
        result = a;

    return result;
}

struct fixed_point sub_02050FF8(s16 value)
{
    struct fixed_point result;
    result.integer = value;
    result.fractional = 0;
    return result;
}

struct fixed_point BinToDecFixedPoint(struct fixed_point_64 *val)
{
    struct fixed_point result;
    result.integer = val->lower >> 16;
    result.fractional = ((val->lower & 0xFFFF) * 1000) >> 16;
    return result;
}

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
