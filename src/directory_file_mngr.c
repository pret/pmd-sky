#include "directory_file_mngr.h"
#include "directory_file.h"

extern void* MemAlloc(u32 len, u32 flags);
extern void MemZero(void* ptr, u32 len);

extern struct directory *DIRECTORY_FILES_EXTRACTED;
extern char* DIRECTORY_FILE_TABLE[6];

void DirectoryFileMngr_ExtractAllDirectoryFiles(void) {
  u32 total_size = sizeof(struct directory[6]);
  DIRECTORY_FILES_EXTRACTED = MemAlloc(total_size, 0);
  MemZero(DIRECTORY_FILES_EXTRACTED, total_size);
  for (s16 i = 0; i < 6; i++) {
      DirectoryFile_ExtractDirectoryFile(&DIRECTORY_FILES_EXTRACTED[i], DIRECTORY_FILE_TABLE[i]);
  };
}

u32 DirectoryFileMngr_GetDirectoryFileSize(enum directory_id pack_id, u32 file_index) {
  struct directory* pack_file = &DIRECTORY_FILES_EXTRACTED[pack_id];
  return DirectoryFile_GetDirectoryFileSize(pack_file, file_index);
}

u32 DirectoryFileMngr_LoadDirectoryFile(enum directory_id pack_id, u32 file_index, void* output_buffer) {
  return DirectoryFile_LoadDirectoryFile(&DIRECTORY_FILES_EXTRACTED[pack_id], output_buffer, file_index);
}

void DirectoryFileMngr_OpenDirectoryFile(enum directory_id pack_id, u32 file_index, struct directory_open_result *output, u32 malloc_flags) {
  u32 entry_length = DirectoryFile_GetDirectoryFileSize(&DIRECTORY_FILES_EXTRACTED[pack_id], file_index);
  output->length = entry_length;
  void * data_dest = MemAlloc(output->length, malloc_flags);
  output->data = data_dest;
  DirectoryFile_LoadDirectoryFile(&DIRECTORY_FILES_EXTRACTED[pack_id], output->data, file_index);
  return;
}
