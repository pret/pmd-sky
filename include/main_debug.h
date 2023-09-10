#ifndef PMDSKY_MAIN_DEBUG_H
#define PMDSKY_MAIN_DEBUG_H

#include <stdarg.h>

// Program position info (basically stack trace info) for debug logging.
struct prog_pos_info {
    char* file; // file name
    int line;   // line number
};

// Display some debug messages, then hangs the process.     
// This function is called in lots of places to bail on a fatal error. Looking at the static data callers use to fill in the program position info is informative, as it tells you the original file name (probably from the standard __FILE__ macro) and line number (probably from the standard __LINE__ macro) in the source code.
void FatalError(struct prog_pos_info *prog_pos, const char* fmt, ...);

#endif //PMDSKY_MAIN_DEBUG_H