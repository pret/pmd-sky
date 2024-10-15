#include "main_02008254.h"

s32 sub_0207F818(struct file_stream* file, u8* buf, s32 size);
void CardPullOutWithStatus(u32 status);

s32 FileRom_HandleRead(struct file_stream* file, u8* buf, s32 size) {
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
