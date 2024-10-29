#include "main_020897AC.h"

char* strcat(char* dest, const char* src) {
    char *end_of_dest = dest;
    char *appended_point;
    while ((*(end_of_dest++)) != 0) {}

    end_of_dest--;
    do {
        char src_char = *(src++);
        char *append_point = end_of_dest;
        append_point = end_of_dest++;
        *append_point = src_char;
        appended_point = &(*append_point);
        if ((*appended_point) == 0) return dest;
    } while (1);
}
