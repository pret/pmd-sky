#include "main_0202A66C.h"

bool8 IsEmptyString(u8* str)
{
    if (str == 0) {
        return TRUE;
    }
    return *str == 0;
}
