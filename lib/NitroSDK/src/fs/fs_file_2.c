#include "main_0207F818.h"

s32 FSi_ReadFileCore(struct file_stream* file, u8* buf, s32 size, s32 param_3);

s32 FS_ReadFile(struct file_stream* file, u8* buf, s32 size)
{
    return FSi_ReadFileCore(file,buf,size,0);
}

u32 FS_SeekFile(struct file_stream* file, s32 offset, u32 whence)
{
    switch (whence) {
        case 0:
            offset = offset + (s32) file->start_address;
            break;
        case 1:
            offset = offset + (s32) file->current_address;
            break;
        case 2:
            offset = offset + (s32) file->end_address;
            break;
        default:
            return 0;
    }
    if (offset < (s32) file->start_address) {
        offset = (s32) file->start_address;
    }
    if (offset > (s32) file->end_address) {
        offset = (s32) file->end_address;
    }
    file->current_address = (void*) offset;
    return 1;
}


