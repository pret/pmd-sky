#ifndef PMDSKY_NUMBER_UTIL_H
#define PMDSKY_NUMBER_UTIL_H

#include "util.h"
#include "save.h"

struct unk_022AB694 {
    u32 field_0x0;
    u8 field_0x4;
};

void ResetPlayTimer(struct unk_022AB694 *timer);
void PlayTimerTick(struct unk_022AB694 *timer);
s32 GetPlayTimeSeconds(struct unk_022AB694 *timer);
void sub_02050E5C(struct unk_022AB694 *timer, struct bitstream *stream);
void sub_02050E8C(struct unk_022AB694 *timer, struct bitstream *stream);
struct fixed_point sub_02050EBC(struct fixed_point a, struct fixed_point b);
struct fixed_point SubFixedPoint(struct fixed_point a, struct fixed_point b);
struct fixed_point sub_02050F78(struct fixed_point a, struct fixed_point b);
struct fixed_point sub_02050FF8(s16 value);
struct fixed_point BinToDecFixedPoint(struct fixed_point_64 *val);
s32 CeilFixedPoint(struct fixed_point val_fp);
void sub_02051098(struct bitstream *stream, u16 *buf);
void sub_020510C0(struct bitstream *stream, u16 *buf);
void MtInit(u32 seed);
u32 MtNext(void);

#endif //PMDSKY_NUMBER_UTIL_H
