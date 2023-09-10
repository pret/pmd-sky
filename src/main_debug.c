#include "main_debug.h"

extern void DebugPrintTrace(const char* msg, struct prog_pos_info* prog_pos);
extern int vsprintf(char* str, const char* format, va_list ap);
extern char* strcpy(char* dest, const char* src);
extern char* strcat(char* dest, const char* src);
extern void DebugDisplay(const char* fmt, ...);
extern void WaitForever(void);

extern char STRING_DEBUG_FATAL;
extern char STRING_DEBUG_NEWLINE;
extern char STRING_DEBUG_LOG_NULL;
extern char STRING_DEBUG_STRING_NEWLINE;

#define va_start(list, arg) ({ list = (va_list)(((u32)&(arg) & ~3) + 4); })
#define va_end(list)        ((void)0)

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