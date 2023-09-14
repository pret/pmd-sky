#include "main_debug.h"

extern int vsprintf(char* str, const char* format, va_list ap);
extern char* strcpy(char* dest, const char* src);
extern char* strcat(char* dest, const char* src);
extern void WaitForever(void);
extern int sprintf(char* str, const char* format, ...);

extern char STRING_DEBUG_EMPTY;
extern char STRING_DEBUG_FORMAT_LINE_FILE;
extern char STRING_DEBUG_NO_PROG_POS;
extern char STRING_DEBUG_SPACED_PRINT;
extern char STRING_DEBUG_FATAL;
extern char STRING_DEBUG_NEWLINE;
extern char STRING_DEBUG_LOG_NULL;
extern char STRING_DEBUG_STRING_NEWLINE;

extern BOOL DEBUG_IS_INITIALIZED;

void InitDebug(void) {
    InitDebugStripped6();
    InitDebugStripped5();
    InitDebugStripped4();
    InitDebugStripped3();
    InitDebugStripped2();
    InitDebugStripped1();

    InitDebugFlag2();
    
    DEBUG_IS_INITIALIZED = TRUE;
    
    InitDebugFlag1();
}

void InitDebugFlag1(void) {}

u32 GetDebugFlag1(u32 flag_id) {
    return 0;
}

void SetDebugFlag1(u32 flag_id, u32 val) {}

void InitDebugStripped6(void) {}

int AppendProgPos(char* str, struct prog_pos_info* prog_pos, const char* msg) {
    if (msg == NULL) {
        msg = &STRING_DEBUG_EMPTY;
    };

    if (prog_pos != NULL) {
        return sprintf(str, &STRING_DEBUG_FORMAT_LINE_FILE, msg, prog_pos->file, prog_pos->line);
    } else {
        return sprintf(str, &STRING_DEBUG_NO_PROG_POS, msg);
    };
}

void InitDebugStripped5(void) {}

void DebugPrintTrace(const char* msg, struct prog_pos_info* prog_pos) {
    char message_buffer[256];
    
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

void DebugDisplay(const char* fmt, ...) {
    va_list args;
    va_start(args, fmt);
    char message_buffer[256];
    vsprintf(message_buffer, fmt, args);
    // Would have called the "display to top screen" function here
}

void DebugPrint0(const char* fmt, ...) {
    va_list args;
    va_start(args, fmt);
    char message_buffer[256];
    vsprintf(message_buffer, fmt, args);
}

void InitDebugFlag2(void) {}

u32 GetDebugFlag2(u32 flag_id) {
    return 0;
}

void SetDebugFlag2(u32 flag_id, u32 val) {}

void DebugPrint(u8 level, const char* fmt, ...) {}

void InitDebugStripped4(void) {}
void InitDebugStripped3(void) {}
void InitDebugStripped2(void) {}
void InitDebugStripped1(void) {}

void FatalError(struct prog_pos_info *prog_pos, const char* fmt, ...) {
    va_list args;
    char message_buffer[256];
    DebugPrintTrace(&STRING_DEBUG_FATAL, prog_pos);
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