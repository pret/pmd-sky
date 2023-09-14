#ifndef PMDSKY_MAIN_DEBUG_H
#define PMDSKY_MAIN_DEBUG_H

#include <stdarg.h>

// Program position info (basically stack trace info) for debug logging.
struct prog_pos_info {
    char* file; // file name
    int line;   // line number
};

// Would have initialized debugging-related things, if they were not removed.
// As for the release version, does nothing but set DEBUG_IS_INITIALIZED to true.
void InitDebug(void);

// Would have initialised the first set of debug flags.
// Does nothing in release binary.
void InitDebugFlag1(void);

// Just returns 0 in the final binary.
u32 GetDebugFlag1(u32 flag_id);

// A no-op in the final binary.
void SetDebugFlag1(u32 flag_id, u32 val);

// Does nothing, only called in the debug initialisation function.
void InitDebugStripped6(void);

// Write a base message into a string and append the file name and line number to the end in the format "file = '%s'  line = %5d\n".
// If no program position info is given, "ProgPos info NULL\n" is appended instead.     
int AppendProgPos(char* str, struct prog_pos_info* prog_pos, const char* msg);

// Does nothing, only called in the debug initialisation function.
void InitDebugStripped5(void);

// Would log a printf format string tagged with the file name and line number in the debug binary.
// This still constructs the string, but doesn't actually do anything with it in the final binary.
// If message is a null pointer, the string "  Print  " is used instead.
void DebugPrintTrace(const char* msg, struct prog_pos_info* prog_pos);

// Would display a printf format string on the top screen in the debug binary.
// This still constructs the string with vsprintf, but doesn't actually do anything with it in the final binary.
// Identical to DebugPrint0 in release builds
void DebugDisplay(const char* fmt, ...);

// Would do something with a printf format string.
// This still constructs the string with vsprintf, but doesn't actually do anything with it in the final binary.
// Identical to DebugDisplay in release builds
void DebugPrint0(const char* fmt, ...);

// Would have initialised the second set of debug flags.
// Does nothing in release binary.
void InitDebugFlag2(void);

// Just returns 0 in the final binary.
u32 GetDebugFlag2(u32 flag_id);

// A no-op in the final binary.
void SetDebugFlag2(u32 flag_id, u32 val);

// Would log a printf format string in the debug binary. A no-op in the final binary.
void DebugPrint(u8 level, const char* fmt, ...);

// Does nothing, only called in the debug initialisation function.
void InitDebugStripped4(void);

// Does nothing, only called in the debug initialisation function.
void InitDebugStripped3(void);

// Does nothing, only called in the debug initialisation function.
void InitDebugStripped2(void);

// Does nothing, only called in the debug initialisation function.
void InitDebugStripped1(void);

// Display some debug messages, then hangs the process.     
// This function is called in lots of places to bail on a fatal error. Looking at the static data callers use to fill in the program position info is informative, as it tells you the original file name (probably from the standard __FILE__ macro) and line number (probably from the standard __LINE__ macro) in the source code.
void FatalError(struct prog_pos_info *prog_pos, const char* fmt, ...);

#endif //PMDSKY_MAIN_DEBUG_H