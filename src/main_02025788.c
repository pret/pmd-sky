#include "main_02025788.h"
#include <file_rom.h>
#include <file.h>

extern struct file_stream _022A59C0;

void GetStringFromFile(u8* buf,s32 string_id)
{
    struct string_info {
        u32 start;
        u32 end;
    } string_info[1];
      
    FileRom_InitDataTransfer();
    FileRom_HandleSeek(&_022A59C0,(u32)((string_id - 1) * 0x10000) >> 0xe,0);
    FileRom_HandleRead(&_022A59C0,string_info,8);
    FileRom_HandleSeek(&_022A59C0,string_info[0].start,0);
    FileRom_HandleRead(&_022A59C0,buf,string_info[0].end - string_info[0].start);
    FileRom_StopDataTransfer();
    return;
}
