#ifndef PMDSKY_FILE_ROM_H
#define PMDSKY_FILE_ROM_H

#include <file.h>

extern void FileRom_InitDataTransfer(void);
extern void FileRom_StopDataTransfer(void);

extern void FileRom_Veneer_FileInit(struct file_stream* file);
extern void FileRom_HandleOpen(struct file_stream* file, const char* filepath);
extern u32 FileRom_HandleRead(struct file_stream* file, void* buf, u32 size);
extern void FileRom_HandleSeek(struct file_stream* file, int offset, int whence);

#endif
