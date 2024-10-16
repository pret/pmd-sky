#include "main_02008254.h"
#include <file_rom.h>
#include "main_02003D2C.h"
#include "main_0207F818.h"

u32 FileGetSize(struct file_stream* file)
{
    return file->end_address - file->start_address;
}

s32 FileRom_HandleRead(struct file_stream* file, void* buf, s32 size) {
    s32 total_bytes_read = 0;
    while (size>total_bytes_read) {
        s32 bytes_read = sub_0207F818(file,buf,size-total_bytes_read);
        if (bytes_read < 0) {
            CardPullOutWithStatus(1);
        } else {
            total_bytes_read += bytes_read;
            buf += bytes_read;
        }
    }
    return total_bytes_read;
}

u32 FileRom_HandleSeek(struct file_stream* file, s32 offset, s32 whence)
{
    u32 res = sub_0207F828(file,offset,whence);
    if (res != 0) {
        return res;
    } else {
        CardPullOutWithStatus(1);
        return;
    }
}
