#include "debug.h"

extern s32 vsprintf(u8* str, const u8* format, va_list ap);
extern u8* strcpy(u8* dest, const u8* src);
extern u8* strcat(u8* dest, const u8* src);
extern void WaitForever(void);
extern s32 sprintf(u8* str, const u8* format, ...);

extern u8 STRING_DEBUG_EMPTY;
extern u8 STRING_DEBUG_FORMAT_LINE_FILE;
extern u8 STRING_DEBUG_NO_PROG_POS;
extern u8 STRING_DEBUG_SPACED_PRINT;
extern u8 STRING_DEBUG_FATAL;
extern u8 STRING_DEBUG_NEWLINE;
extern u8 STRING_DEBUG_LOG_NULL;
extern u8 STRING_DEBUG_STRING_NEWLINE;

extern BOOL DEBUG_IS_INITIALIZED;

void Debug_Init(void) {
    Debug_Stripped6();
    Debug_Stripped5();
    Debug_Stripped4();
    Debug_Stripped3();
    Debug_Stripped2();
    Debug_Stripped1();

    Debug_InitLogFlag();

    DEBUG_IS_INITIALIZED = TRUE;

    Debug_InitDebugFlag();
}

void Debug_InitDebugFlag(void) {}

u32 Debug_GetDebugFlag(enum debug_flag flag) {
    return FALSE;
}

void Debug_SetDebugFlag(enum debug_flag flag, u32 val) {}

void Debug_Stripped6(void) {}

s32 AppendProgPos(u8* str, struct prog_pos_info* prog_pos, const u8* msg) {
    if (msg == NULL) {
        msg = &STRING_DEBUG_EMPTY;
    };

    if (prog_pos != NULL) {
        return sprintf(str, &STRING_DEBUG_FORMAT_LINE_FILE, msg, prog_pos->file, prog_pos->line);
    } else {
        return sprintf(str, &STRING_DEBUG_NO_PROG_POS, msg);
    };
}

void Debug_Stripped5(void) {}

void Debug_PrintTrace(const u8* msg, struct prog_pos_info* prog_pos) {
    u8 message_buffer[256];

    if (prog_pos != NULL) {
        if (msg != NULL) {
            AppendProgPos(message_buffer, prog_pos, msg);
        } else {
            AppendProgPos(message_buffer, prog_pos, &STRING_DEBUG_SPACED_PRINT);
        };
    } else {
        if (msg != NULL) {
            strcpy(message_buffer, msg);
        } else {
            strcpy(message_buffer, &STRING_DEBUG_SPACED_PRINT);
        };
    };

    // Call to function that actually print something would have been here
}

void DebugDisplay(const u8* fmt, ...) {
    va_list args;
    va_start(args, fmt);
    u8 message_buffer[256];
    vsprintf(message_buffer, fmt, args);
    // Would have called the "display to top screen" function here
}

void Debug_Print0(const u8* fmt, ...) {
    va_list args;
    va_start(args, fmt);
    u8 message_buffer[256];
    vsprintf(message_buffer, fmt, args);
}

void Debug_InitLogFlag(void) {}

u32 Debug_GetLogFlag(enum debug_log_flag flag) {
    return FALSE;
}

void Debug_SetLogFlag(enum debug_log_flag flag, u32 val) {}

void Debug_Print(u8 level, const u8* fmt, ...) {}

void Debug_Stripped4(void) {}
void Debug_Stripped3(void) {}
void Debug_Stripped2(void) {}
void Debug_Stripped1(void) {}

void Debug_FatalError(struct prog_pos_info *prog_pos, const u8* fmt, ...) {
    va_list args;
    u8 message_buffer[256];
    Debug_PrintTrace(&STRING_DEBUG_FATAL, prog_pos);
    if (fmt != NULL) {
        va_start(args, fmt);
        vsprintf(message_buffer, fmt, args);
        strcat(message_buffer, &STRING_DEBUG_NEWLINE);
    } else {
        strcpy(message_buffer, &STRING_DEBUG_LOG_NULL);
    }
    DebugDisplay(&STRING_DEBUG_STRING_NEWLINE, message_buffer);
    WaitForever();
}