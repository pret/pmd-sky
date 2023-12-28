#include "directory_file.h"

extern void DataTransferInit(void);
extern void DataTransferStop(void);
extern void FileSeek(struct file_stream* file, int offset, int whence);
extern u32 FileRead(struct file_stream* file, void* buf, u32 size);
extern void FileInitVeneer(struct file_stream* file);
extern void FileOpen(struct file_stream* file, const char* filepath);

#include "debug.h"

extern void* MemAlloc(u32 len, u32 flags);

extern char STRING_FILE_DIRECTORY_INIT;


void DirectoryFile_ExtractDirectoryFile(struct directory *pack_file, char *file_path) {
  DataTransferInit();
  FileInitVeneer(&pack_file->opened_file);
  FileOpen(&pack_file->opened_file,file_path);
  FileRead(&pack_file->opened_file,&pack_file->zero,8);
  FileSeek(&pack_file->opened_file,8,0);
  u32 toc_total_size = pack_file->nb_entry_table_of_content * sizeof(struct directory_entry);
  struct directory_entry *toc_alloc = (struct directory_entry *) MemAlloc(toc_total_size, 0);
  pack_file->table_of_content = toc_alloc;
  FileRead(&pack_file->opened_file,pack_file->table_of_content,toc_total_size);
  Debug_Print0(&STRING_FILE_DIRECTORY_INIT,pack_file->zero,
              pack_file->nb_entry_table_of_content,toc_total_size,file_path);
  DataTransferStop();
  return;
}

u32 DirectoryFile_GetDirectoryFileSize(struct directory* pack_file, u32 file_index) {
  struct directory_entry* element = &pack_file->table_of_content[file_index];
  return element->length;
}

u32 DirectoryFile_LoadDirectoryFile(struct directory *pack_file,void *output_buffer,u32 file_index) {
  DataTransferInit();
  struct directory_entry *toc_entry = &pack_file->table_of_content[file_index];
  FileSeek(&pack_file->opened_file,toc_entry->offset,0);
  FileRead(&pack_file->opened_file,output_buffer,toc_entry->length);
  DataTransferStop();
  return toc_entry->length;
}
