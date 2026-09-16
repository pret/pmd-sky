#include "main_02048C5C.h"
#include "main_02048BB4.h"
#include "main_02048CB8.h"
#include "main_0200330C.h"

extern struct unk_022AAE74 _022AAE74;
extern char _022AAE78;

void sub_02048C5C(void)
{
    MemsetSimple((u8 *)(&_022AAE78 - 4), 0, 0x30);
    _022AAE74.field_0x24 = 0x09011416;
    ReadStringSave(&_022AAE78);
    _022AAE74.field_0x28 = 0x000F1206;
    _022AAE74.field_0x2C = 0xFF;
    _022AAE74.field_0x2D = 0;
}
