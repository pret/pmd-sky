#include "main_0206A84C.h"

s16 sub_0206A84C(u32 arg0)
{
    if (arg0 < 0xB4U)
        return (s16) (arg0 + 1);

    if ((arg0 >= 0xB4U) && (arg0 <= 0xD3U))
        return 0xB8;

    return -1;
}
