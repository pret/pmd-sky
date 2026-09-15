#include "number_util.h"
#include "main_020504A4.h"

void ResetPlayTimer(struct unk_022AB694 *timer)
{
    timer->field_0x4 = 0;
    timer->field_0x0 = 0;
}

void PlayTimerTick(struct unk_022AB694 *timer)
{
    if (++timer->field_0x4 < 60)
    {
        return;
    }
    timer->field_0x4 = 0;
    if (timer->field_0x0 < 0x22550ff)
    {
        timer->field_0x0++;
    }
}

s32 GetPlayTimeSeconds(struct unk_022AB694 *timer)
{
    return timer->field_0x0;
}

void sub_02050E5C(struct unk_022AB694 *timer, struct bitstream *stream)
{
    CopyBitsTo(stream, &timer->field_0x4, 6);
    CopyBitsTo(stream, &timer->field_0x0, 0x20);
}

void sub_02050E8C(struct unk_022AB694 *timer, struct bitstream *stream)
{
    CopyBitsFrom(stream, &timer->field_0x4, 6);
    CopyBitsFrom(stream, &timer->field_0x0, 0x20);
}

extern void CopyBitsTo(struct bitstream *stream, void *buf_write, s32 nbits);
extern void CopyBitsFrom(struct bitstream *stream, void *buf_read, s32 nbits);

extern s32 MT_TABLE;
extern u32 _020AFF80[2];
extern u32 _020AFF88[624];

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

void sub_02051098(struct bitstream *stream, u16 *buf)
{
    CopyBitsFrom(stream, buf, 16);
    CopyBitsFrom(stream, buf + 1, 16);
}

void sub_020510C0(struct bitstream *stream, u16 *buf)
{
    CopyBitsTo(stream, buf, 16);
    CopyBitsTo(stream, buf + 1, 16);
}

void MtInit(u32 seed)
{
    _020AFF88[0] = seed;
    for (MT_TABLE = 1; MT_TABLE < 624; MT_TABLE++)
    {
        _020AFF88[MT_TABLE] = 1812433253 * (_020AFF88[MT_TABLE - 1] ^ (_020AFF88[MT_TABLE - 1] >> 30)) + MT_TABLE;
    }
}

u32 MtNext(void)
{
    u32 y;
    s32 kk;

    if (MT_TABLE >= 624)
    {
        if (MT_TABLE == 625)
        {
            MtInit(5489);
        }

        for (kk = 0; kk < 227; kk++)
        {
            y = (_020AFF88[kk] & 0x80000000) | (_020AFF88[kk + 1] & 0x7FFFFFFF);
            _020AFF88[kk] = _020AFF88[kk + 397] ^ (y >> 1) ^ _020AFF80[y & 1];
        }
        for (; kk < 623; kk++)
        {
            y = (_020AFF88[kk] & 0x80000000) | (_020AFF88[kk + 1] & 0x7FFFFFFF);
            _020AFF88[kk] = _020AFF88[kk - 227] ^ (y >> 1) ^ _020AFF80[y & 1];
        }
        y = (_020AFF88[623] & 0x80000000) | (_020AFF88[0] & 0x7FFFFFFF);
        _020AFF88[623] = _020AFF88[396] ^ (y >> 1) ^ _020AFF80[y & 1];

        MT_TABLE = 0;
    }

    y = _020AFF88[MT_TABLE++];

    y ^= y >> 11;
    y ^= (y << 7) & 0x9D2C5680;
    y ^= (y << 15) & 0xEFC60000;
    y ^= y >> 18;

    return y;
}
