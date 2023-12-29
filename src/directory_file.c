#include "directory_file.h"

#include "file_rom.h"
#include "debug.h"

extern void* MemAlloc(u32 len, u32 flags);

extern char STRING_FILE_DIRECTORY_INIT;


void DirectoryFile_ExtractDirectoryFile(struct directory *pack_file, char *file_path) {
  FileRom_InitDataTransfer();
  FileRom_Veneer_FileInit(&pack_file->opened_file);
  FileRom_HandleOpen(&pack_file->opened_file,file_path);
  FileRom_HandleRead(&pack_file->opened_file,&pack_file->zero,8);
  FileRom_HandleSeek(&pack_file->opened_file,8,0);
  u32 toc_total_size = pack_file->nb_entry_table_of_content * sizeof(struct directory_entry);
  struct directory_entry *toc_alloc = (struct directory_entry *) MemAlloc(toc_total_size, 0);
  pack_file->table_of_content = toc_alloc;
  FileRom_HandleRead(&pack_file->opened_file,pack_file->table_of_content,toc_total_size);
  Debug_Print0(&STRING_FILE_DIRECTORY_INIT,pack_file->zero,
              pack_file->nb_entry_table_of_content,toc_total_size,file_path);
  FileRom_StopDataTransfer();
  return;
}

u32 DirectoryFile_GetDirectoryFileSize(struct directory* pack_file, u32 file_index) {
  struct directory_entry* element = &pack_file->table_of_content[file_index];
  return element->length;
}

u32 DirectoryFile_LoadDirectoryFile(struct directory *pack_file,void *output_buffer,u32 file_index) {
  FileRom_InitDataTransfer();
  struct directory_entry *toc_entry = &pack_file->table_of_content[file_index];
  FileRom_HandleSeek(&pack_file->opened_file,toc_entry->offset,0);
  FileRom_HandleRead(&pack_file->opened_file,output_buffer,toc_entry->length);
  FileRom_StopDataTransfer();
  return toc_entry->length;
}
