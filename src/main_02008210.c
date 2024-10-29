#include "file_rom.h"

void CardPullOutWithStatus(u32 status);
u32 sub_0207F6C4(struct file_stream* file, const u8* filepath);

void FileRom_HandleOpen(struct file_stream* file, const char* filepath) {
    while (TRUE) {
        if (sub_0207F6C4(file,filepath) != 0) {
            return;
        }
        CardPullOutWithStatus(1);
    }
}
