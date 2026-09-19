#include "main_0205B354.h"
#include "main_0202593C.h"
#include "main_020897AC.h"

extern const char _020A353C[];
extern const char _020A3544[];
extern const char _020A354C[];

bool8 sub_0205B354(struct unkStruct_0205B354 *ptr)
{
    if (ptr->unk45 != 0)
    {
        return FALSE;
    }

    for (s16 i = 0; i < 2; i++)
    {
        if (ptr->unk18[i] == 111)
        {
            return TRUE;
        }
    }

    return FALSE;
}

u8 *sub_0205B39C(const s8 *table, s32 value)
{
    s32 count;
    u8 *buf;

    buf = AllocateTemp1024ByteBufferFromPool();
    while (table[0] >= 0)
    {
        if (value >= table[0])
        {
            break;
        }
        table += 2;
    }

    count = 0;
    buf[0] = 0;
    if (table[1] != 0)
    {
        while (count < table[1] / 2)
        {
            strcat(buf, _020A353C);
            count++;
        }
        if (table[1] & 1)
        {
            strcat(buf, _020A3544);
        }
    }
    else
    {
        strcat(buf, _020A354C);
    }
    return buf;
}
