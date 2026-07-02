#ifndef PMDSKY_MAIN_0207F3E4_H
#define PMDSKY_MAIN_0207F3E4_H

#include <file.h>

void FS_Init (u32 default_dma_no);

// Initializes a file_stream structure for file I/O.
// This function must always be called before opening a file.
// file: file_stream pointer
void FS_InitFile(struct file_stream* file);

#endif //PMDSKY_MAIN_0207F3E4_H
