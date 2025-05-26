#ifndef PMDSKY_MAIN_0200330C_H
#define PMDSKY_MAIN_0200330C_H

void ZInit8(int* ptr);
u8 PointsToZero(int* ptr);
void MemZero(u8* ptr, s32 len);
void MemZero16(u16* ptr, s32 len);
void MemZero32(u32* ptr, s32 len);
void MemsetSimple(u8* ptr, u8 val, s32 len);
void Memset32(u32* ptr, u32 val, s32 len);
void MemcpySimple(u8* dest, u8* src, s32 n);
void Memcpy16(u16* dest, u16* src, s32 n);
void Memcpy32(u32* dest, u32* src, s32 n);

#endif //PMDSKY_MAIN_0200330C_H
