#ifndef PMDSKY_MAIN_0202593C_H
#define PMDSKY_MAIN_0202593C_H

u8* AllocateTemp1024ByteBufferFromPool(void);
void GetStringFromFileVeneer(u8* buf,s32 string_id);
u8* StringFromId(u32 id);
void CopyStringFromId(u8* buf, u32 string_id);
void CopyNStringFromId(char* buf, int string_id, int buf_len);
void LoadTblTalk(void);

#endif //PMDSKY_MAIN_0202593C_H
