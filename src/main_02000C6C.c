#include "main_02000C6C.h"
#include "nitro/types.h"

extern u32 _02092448;
extern u32 _02092460;

extern void sub_02002228(u32);
extern void sub_020024D4();
extern void sub_020024E4();
extern void sub_020028AC();
extern void sub_0200294C();
extern void sub_02002A98();
extern void sub_02002C2C();
extern void sub_02002FB8();
extern void sub_02002F0C();
extern void sub_02003ECC();
extern void sub_020082F4(u32*);
extern void sub_0204A5D0();
extern void sub_02076070();
extern void sub_02079C14();
extern void sub_0207A220();
extern void sub_0207A30C();
extern void sub_0207A36C();
extern u32 sub_0207A524(u32);
extern u32 sub_0207A538(u32);
extern u32 sub_0207A6EC(u32, u32);
extern void sub_0207A95C(u32, u32);
extern u32 sub_0207A98C(u32, u32, u32, u32);
extern u32 sub_0207AA34(u32, u32, u32);
extern void sub_0207AD54();
extern void sub_0207B9EC(u8(*)[6]);
extern void sub_0207F3BC(u32);
extern void sub_02008DAC();
extern void sub_020833F8(u32);
extern void sub_020845D8(void (*));
extern void ClearIrqFlag(u32, u32);
extern void Debug_Init();
extern void Debug_Print0(u32*, u32, u32);
extern void InitMemAllocTableVeneer();
extern void TaskProcBoot();
extern void WaitForInterrupt();

void NitroMain(void)
{
  u32 uVar2;
  u32 uVar3;
  u32 uVar4;
  u32 uVar5;
  u32 uVar6;
  u32 uVar7;
  u32 old_ime;


  u8 stack[6];

  sub_0207A36C();
  sub_020833F8(0x12);
  sub_020845D8(sub_020024D4);
  sub_0207AD54();
  sub_02076070();
  sub_0207F3BC(0xffffffff);
  sub_0207A220();
  sub_0207A30C();
  uVar2 = sub_0207A524(0);
  uVar3 = sub_0207A538(0);
  Debug_Print0(&_02092448,uVar3,uVar2);
  uVar4 = sub_0207A524(0);
  if (sub_0207A538(0) < uVar4) {
    uVar5 = sub_0207A524(0);
    uVar7 = sub_0207A98C(0,sub_0207A538(0),uVar5,1);
    sub_0207A6EC(0,uVar7);
    uVar6 = sub_0207A524(0);
    uVar7 = sub_0207AA34(0,sub_0207A538(0),uVar6);
    sub_0207A95C(0,uVar7);
  }
  old_ime = reg_OS_IME;
  reg_OS_IME = 1;
  ClearIrqFlag(1,old_ime);
  sub_02008DAC();
  sub_0207B9EC(&stack);
  sub_02002228(stack[0] * stack[1] +
               stack[2] * stack[3] +
               stack[4] * stack[5]);
  sub_020024E4();
  sub_020028AC();
  sub_0200294C();
  sub_02002A98();
  sub_02002C2C();
  sub_02002F0C();
  InitMemAllocTableVeneer();
  Debug_Init();
  sub_02002FB8();
  sub_020082F4(&_02092460);
  sub_0204A5D0();
  sub_02003ECC();
  TaskProcBoot();
  sub_02079C14();
  do {
    WaitForInterrupt();
  } while( 1 );
}
