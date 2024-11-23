#include "main_02089678.h"

u32 strlen(const char* str) {
    u32 len = -1;
    while (TRUE) {
        char chr = *str++;
        len++;
        if (chr==0) break;
    }
    return len;
}
