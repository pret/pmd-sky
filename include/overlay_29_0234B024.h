#ifndef PMDSKY_OVERLAY_29_0234B024_H
#define PMDSKY_OVERLAY_29_0234B024_H

#include "util.h"
#include "main_0200C4FC.h"
#include "dungeon_mode.h"

void SetMessageLogGroupStartFlag(bool8 flag);
struct preprocessor_args* GetMessageLogPreprocessorArgs(void);
void InitMessageLogPreprocessorArgs(void);
void SetMessageLogPreprocessorArgsFlagVal(s32 idx, u32 val);
void SetPreprocessorArgsIdVal(s32 idx, u32 val);
void SetMessageLogPreprocessorArgsNumberVal(s32 idx, s32 val);
void SetMessageLogPreprocessorArgsString(s32 idx, char *str);
void SetMessageLogPreprocessorArgsStringToName(s32 idx, struct entity* entity);

#endif
