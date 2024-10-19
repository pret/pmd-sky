#include "main_0202593C.h"
#include "main_02025788.h"
#include "file_rom.h"

u8* strcpy(u8* dest, u8* src);
u8* strncpy(u8* dest, u8* src, u32 n);

extern u16 _022A59B8[];
extern u8 _022A5A08[];

u8* AllocateTemp1024ByteBufferFromPool(void)
{
    u16 scratch_1 = _022A59B8[2];
    _022A59B8[2]=scratch_1 + 1;
    _022A59B8[2] &= 7;
    return &_022A5A08[scratch_1*0x400];
}

void GetStringFromFileVeneer(u8* buf,s32 string_id)
{
    GetStringFromFile(buf,string_id);
}

u8* StringFromId(u32 id)
{
    u8* res = AllocateTemp1024ByteBufferFromPool();
    GetStringFromFile(res,id);
    return res;
}

void CopyStringFromId(u8* buf, u32 string_id)
{
    u8 buffer[0x400];
    GetStringFromFile(buffer,string_id);
    strcpy(buf,buffer);
}

void CopyNStringFromId(char* buf, int string_id, int buf_len)
{
    u8 buffer[0x400];
    GetStringFromFile(buffer,string_id);
    strncpy(buf,buffer,buf_len);
}

extern struct file_stream _022A7A0C;
extern const char _0209AAD8;
extern const char _022A7A08;

void LoadTblTalk(void)
{
    FileRom_InitDataTransfer();
    FileRom_Veneer_FileInit(&_022A7A0C);
    FileRom_HandleOpen(&_022A7A0C,&_0209AAD8);
    FileRom_HandleSeek(&_022A7A0C,0x33c,0);
    FileRom_HandleRead(&_022A7A0C,&_022A7A08,2);
    FileRom_StopDataTransfer();
}
