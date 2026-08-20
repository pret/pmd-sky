#include "overlay_29_0233A218.h"

extern u8 *GetMinimapData(void);

void SetMinimapDataE447(u8 value)
{
    GetMinimapData()[0xE447] = value;
}

u8 GetMinimapDataE447(void)
{
    return GetMinimapData()[0xE447];
}

void SetMinimapDataE448(u8 value)
{
    GetMinimapData()[0xE448] = value;
}
