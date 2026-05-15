#include "main_02000C6C.h"
#include <nitro.h>

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
extern void OS_DisableScheduler();
extern void DC_Enable();
extern u32 OS_GetArenaHi(u32);
extern u32 OS_GetArenaLo(u32);
extern u32 OS_SetArenaLo(u32, u32);
extern void sub_0207A95C(u32, u32);
extern u32 sub_0207A98C(u32, u32, u32, u32);
extern u32 sub_0207AA34(u32, u32, u32);
extern void OS_InitTick();
extern void OS_GetMacAddress(u8(*)[6]);
extern void FS_Init(u32);
extern void sub_02008DAC();
extern void Card_SetThreadPriority(u32);
extern void Card_SetPulledOutCallback(void (*));
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


  u8 macAddr[6];

  OS_Init();
  Card_SetThreadPriority(0x12);
  Card_SetPulledOutCallback(sub_020024D4);
  OS_InitTick();
  sub_02076070();
  FS_Init(0xffffffff);
  DC_Enable();
  IC_Enable();
  uVar2 = OS_GetArenaHi(0);
  uVar3 = OS_GetArenaLo(0);
  Debug_Print0(&_02092448,uVar3,uVar2);
  uVar4 = OS_GetArenaHi(0);
  if (OS_GetArenaLo(0) < uVar4) {
    uVar5 = OS_GetArenaHi(0);
    uVar7 = sub_0207A98C(0,OS_GetArenaLo(0),uVar5,1);
    OS_SetArenaLo(0,uVar7);
    uVar6 = OS_GetArenaHi(0);
    uVar7 = sub_0207AA34(0,OS_GetArenaLo(0),uVar6);
    sub_0207A95C(0,uVar7);
  }
  old_ime = reg_OS_IME;
  reg_OS_IME = 1;
  ClearIrqFlag(1,old_ime);
  sub_02008DAC();
  OS_GetMacAddress(&macAddr);
  sub_02002228(macAddr[0] * macAddr[1] +
               macAddr[2] * macAddr[3] +
               macAddr[4] * macAddr[5]);
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
  OS_DisableScheduler();
  do {
    WaitForInterrupt();
  } while( 1 );
}
