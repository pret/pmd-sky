#ifndef PMDSKY_MAIN_0207F818_H
#define PMDSKY_MAIN_0207F818_H

#include <file.h>

s32 FS_ReadFile(struct file_stream* file, u8* buf, s32 size);
u32 FS_SeekFile(struct file_stream* file, s32 offset, u32 whence);

#endif //PMDSKY_MAIN_0207F818_H
