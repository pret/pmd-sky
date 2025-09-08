#include "main_0204DD80.h"
#include "debug.h"
#include "main_0200330C.h"

extern u8 WONDER_MAIL_BITS_SWAP[];
extern u8 _0209E264[];

extern u8 sub_0204DA2C(u8(*)[34], UnkStruct_WonderMailPasswordToMission*, s32);
extern void sub_0204E0A0(u8, u8*, s32);
extern s32 sub_02004F80(u8*, s32);
extern void sub_02050974(u8*, u8*, s32);
extern void sub_0205FD88(u8*, u32, s32);
extern void sub_020509BC(u8*);

s32 WonderMailPasswordToMission(u8* param_1, u32 param_2)
{
	int ret;

    UnkStruct_WonderMailPasswordToMission ctx;
    u8 local_22_2[34];
    u8 local_22_1[34];
    u8 auStack_78[16];

	MemcpySimple(local_22_1, param_1, 34);

	for (int i = 0; i < 34; i++) {
        int j;
		for (j = 0; j < 34; j++) {
            if (j == WONDER_MAIL_BITS_SWAP[i]) {
			    break;
            }
		}

		local_22_2[i] = local_22_1[j];
	}

	if (sub_0204DA2C(&local_22_2, &ctx, 34) == 0) {
		ret = 0;
	} else {
		sub_0204E0A0(ctx.y, ctx.auStack_20, 0x11);
		s32 uVar2 = sub_02004F80(ctx.auStack_20, 0x11);
		Debug_Print0(_0209E264, uVar2, ctx.y);
		if (ctx.x == uVar2) {
			sub_02050974(auStack_78, ctx.auStack_20, 0x11);
			sub_0205FD88(auStack_78, param_2, 1);
			sub_020509BC(auStack_78);
			ret = 1;
		} else {
			ret = 0;
		}
	}
	return ret;
}
