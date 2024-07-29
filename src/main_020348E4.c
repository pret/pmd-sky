#include "main_020348E4.h"

extern struct struct_02AFDB8* _020AFDB8;
extern u32 sub_020347A0(struct struct_1*, struct struct_1*);

u32 sub_020348E4(struct struct_1* src)
{
    if (sub_020347A0(src, &(_020AFDB8->b)) == 0) {
        if (_020AFDB8->a != 0 && sub_020347A0(src, &(_020AFDB8->c))) {
            return 0;
        }
        _020AFDB8->a = 1;
        _020AFDB8->d = 0;
        _020AFDB8->c = *src;
        _020AFDB8->e = 0;
        return 1;
    }
    return 0;
}

