#ifndef PMDSKY_MAIN_PACK_H
#define PMDSKY_MAIN_PACK_H

#include <files/pack.h>

void OpenAllPackFiles(void);
u32 GetFileLengthInPackWithPackNb(enum pack_file_id pack_id, u32 file_index);
u32 LoadFileInPackWithPackId(enum pack_file_id pack_id, u32 file_index, void* output_buffer);
void AllocAndLoadFileInPack(enum pack_file_id pack_id, u32 file_index, struct pack_alloc_and_load_result *output, u32 malloc_flags);
void OpenPackFile(struct pack_file_opened *pack_file,char *file_path);
u32 GetFileLengthInPack(struct pack_file_opened* pack_file, u32 file_index);
u32 LoadFileInPack(struct pack_file_opened *pack_file,void *output_buffer,u32 file_index);

#endif //PMDSKY_MAIN_PACK_H
