#ifndef PMDSKY_DEBUG_H
#define PMDSKY_DEBUG_H

#include <stdarg.h>

// Program position info (basically stack trace info) for debug logging.
struct prog_pos_info {
    u8* file; // file name
    s32 line;   // line number
};

// Flags listed in the debug menu
enum debug_flag {
    DEBUG_FLAG_TEXT_SPEEDUP = 0,    // Increases text speed (x4)
    DEBUG_FLAG_NO_SCREEN_FADE = 1,  // The screen doesn't fade to black when it's supposed to
    DEBUG_FLAG_SOUND_OFF = 2,       // Disables all sounds?
    DEBUG_FLAG_BGM_OFF = 3,         // Background music won't be played
    DEBUG_FLAG_SE_OFF = 4,          // Sound effects won't be played
    DEBUG_FLAG_STAGE_NPC_DUMMY = 5, // Unknown purpose
    // Was supposed to throw an error if text overflowed the textbox it was contained in, but it
    // does nothing in the final game.
    DEBUG_FLAG_TEXT_LIMIT_CHECK = 6,
    DEBUG_FLAG_NO_CHEAT_CHECK = 7,             // Unknown purpose
    DEBUG_FLAG_NO_PLUNGE_CHECK = 8,            // Unknown purpose
    DEBUG_FLAG_DUNGEON_INFINITE_COMEBACK = 10, // Unknown purpose
    DEBUG_FLAG_GENERAL_DEBUG = 11,             // Enables debug menus
    // Allows manually overriding the results of a dungeon expedition
    DEBUG_FLAG_EDIT_MODE = 12,
};

// Logging flags listed in the debug menu. They enable certain kinds of debug logging.
enum debug_log_flag {
    DEBUG_LOG_FLAG_DUNGEON = 0,
    DEBUG_LOG_FLAG_GROUND = 1,
    DEBUG_LOG_FLAG_SCRIPT = 2,
    DEBUG_LOG_FLAG_SCRIPT_DEBUG = 3,
    DEBUG_LOG_FLAG_SCRIPT_SUPERVISION = 4,
    DEBUG_LOG_FLAG_SCRIPT_COMMAND = 5,
    DEBUG_LOG_FLAG_SOUND = 6,
    DEBUG_LOG_FLAG_BGM = 7,
    DEBUG_LOG_FLAG_SE = 8,
    DEBUG_LOG_FLAG_FLAG = 10,
    DEBUG_LOG_FLAG_FILE = 11,
    DEBUG_LOG_FLAG_MEMORY = 12,
    DEBUG_LOG_FLAG_BACKUP = 13,
    DEBUG_LOG_FLAG_THREAD = 14,
    DEBUG_LOG_FLAG_KERNEL = 15,
    DEBUG_LOG_FLAG_PERFORMANCE = 16,
};

// Would have initialized debugging-related things, if they were not removed.
// As for the release version, does nothing but set DEBUG_IS_INITIALIZED to true.
void Debug_Init(void);

// Would have initialized the first set of debug flags.
// Does nothing in release binary.
void Debug_InitDebugFlag(void);

// Just returns 0 in the final binary.
// flag: flag ID
// return: flag value
u32 Debug_GetDebugFlag(enum debug_flag flag);

// Should set the value of a debug flag. A no-op in the final binary.
void Debug_SetDebugFlag(enum debug_flag flag, u32 val);

// Does nothing, only called in the debug initialization function.
void Debug_Stripped6(void);

// Write a base message into a string and append the file name and line number to the end in the format "file = '%s'  line = %5d\n".
// If no program position info is given, "ProgPos info NULL\n" is appended instead.
// str: [output] str
// prog_pos: program position info
// msg: base message
// return: number of characters printed, excluding the null-terminator
s32 AppendProgPos(u8* str, struct prog_pos_info* prog_pos, const u8* msg);

// Does nothing, only called in the debug initialization function.
void Debug_Stripped5(void);

// Would log a printf format string tagged with the file name and line number in the debug binary.
// This still constructs the string, but doesn't actually do anything with it in the final binary.
// If message is a null pointer, the string "  Print  " is used instead.
// msg: message
// prog_pos: program position info (can be null)
void Debug_PrintTrace(const u8* msg, struct prog_pos_info* prog_pos);

// Would display a printf format string on the top screen in the debug binary.
// This still constructs the string with vsprintf, but doesn't actually do anything with it in the final binary.
// Identical to Debug_Print0 in release builds.
void DebugDisplay(const u8* fmt, ...);

// Would log a printf format string in the debug binary.
// This still constructs the string with vsprintf, but doesn't actually do anything with it in the final binary.
// Identical to DebugDisplay in release builds.
void Debug_Print0(const u8* fmt, ...);

// Would have initialized the second set of debug flags.
// Does nothing in release binary.
void Debug_InitLogFlag(void);

// Should return the value of the specified debug log flag. Just returns FALSE in the final binary.
// flag: flag ID
// return: flag value
u32 Debug_GetLogFlag(enum debug_log_flag flag);

// Should set the value of a debug log flag. A no-op in the final binary.
// flag: flag ID
// val: flag value
void Debug_SetLogFlag(enum debug_log_flag flag, u32 val);

// Would log a printf format string in the debug binary. A no-op in the final binary.
// level: log level
// fmt: format
void Debug_Print(u8 level, const u8* fmt, ...);

// Does nothing, only called in the debug initialization function.
void Debug_Stripped4(void);

// Does nothing, only called in the debug initialization function.
void Debug_Stripped3(void);

// Does nothing, only called in the debug initialization function.
void Debug_Stripped2(void);

// Does nothing, only called in the debug initialization function.
void Debug_Stripped1(void);

// Display some debug messages, then hangs the process.
// This function is called in lots of places to bail on a fatal error. Looking at the static data callers use to fill in the program position info is informative, as it tells you the original file name (probably from the standard __FILE__ macro) and line number (probably from the standard __LINE__ macro) in the source code.
void Debug_FatalError(struct prog_pos_info *prog_pos, const u8* fmt, ...);

#endif //PMDSKY_DEBUG_H