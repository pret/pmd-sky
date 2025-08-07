#include "main_0200383C.h"

extern vu8 _020AEF7C[];
extern void *_020AF028;
extern void *_020AF000;

extern void sub_02002628(void*, u32);
extern void sub_02002670();
extern void sub_020026B8();
extern void sub_020029A0(void*);
extern void sub_02002A44(void*);
extern void sub_0200265C(void*);

void sub_0200383C(s32 arg)
{
    u32 temp[2]; // allocate 8 bytes on stack
    s32 r5 = arg;

    sub_02002628((void *)temp, 0xB);
    sub_02002670();

    vu8 *state = _020AEF7C;
    state[2] = 1;

    u32 r4 = *((vu32 *)(state + 0x10));
    *((vu32 *)(state + 0x10)) = (u32)r5;

    sub_020026B8();

    if (r5 == 0) {
        if (r4 != 0) {
            _020AEF7C[3] = 0;
            sub_020029A0(&_020AF028);
        }
    } else {
        if (r4 == 0) {
            _020AEF7C[0] = 1;
            sub_020029A0(&_020AF028);
            sub_02002A44(&_020AF000);
        }
    }

    sub_0200265C((void *)temp);
}
