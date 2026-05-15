#include "file_rom.h"

void CardPullOutWithStatus(u32 status);
u32 FS_OpenFile(struct file_stream* file, const u8* filepath);

void FileRom_HandleOpen(struct file_stream* file, const char* filepath) {
    while (TRUE) {
        if (FS_OpenFile(file,filepath) != 0) {
            return;
        }
        CardPullOutWithStatus(1);
    }
}
