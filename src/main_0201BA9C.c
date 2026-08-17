#include "main_0201BA9C.h"

void GroupOamObjs(u8 *p);
void SetShouldCopyToOam(u8 *p);
void CopyAttributesToOam(u8 *p);

void GroupOamAttributesWrapper(u8* p)
{
    GroupOamObjs(p + 0x20);
}

void CopyAttributesToOamWrapper(u8* p)
{
    SetShouldCopyToOam(p + 0x20);
    CopyAttributesToOam(p + 0x20);
}
