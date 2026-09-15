#ifndef PMDSKY_MAIN_020504A4_H
#define PMDSKY_MAIN_020504A4_H

#include "adventure_log.h"
#include "util.h"
#include "save.h"
u32 GetSentryDutyGamePoints(s32 index);

s32 SetSentryDutyGamePoints(u32 points);
void CopyLogTo(struct bitstream *stream);
void CopyLogFrom(struct bitstream *stream);
void GetAbilityString(char *buf, s32 ability_id);
u16 GetAbilityDescStringId(s32 ability_id);
u16 GetTypeStringId(s32 type_id);
u8 GetConversion2ConvertToType(s32 type_id);
void InitBitstreamForWrite(struct bitstream *stream, void *buf, s32 len);
void InitBitstreamForRead(struct bitstream *stream, void *buf, s32 len);
void BitstreamDebug(struct bitstream *stream);
void CopyBitsTo(struct bitstream *stream, void *buf_write, s32 nbits);
void CopyBitsFrom(struct bitstream *stream, void *buf_read, s32 nbits);
void StoreDefaultTeamData(void);
void GetMainTeamNameWithCheck(u8 *buf);
void GetMainTeamName(u8 *buf);
void SetMainTeamName(const u8 *name);
s32 GetRankupPoints(void);
void sub_02050C10(s32 points);
u8 GetRank(void);
u8 sub_02050CD0(void);
s32 GetRankStorageSize(void);

#endif
