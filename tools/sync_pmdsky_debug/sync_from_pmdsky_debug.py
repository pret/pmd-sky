from pmdsky_debug_reader import *
from symbol_details import *
from xmap_reader import *
from typing import List

# Syncs symbols from pmdsky-debug (https://github.com/UsernameFodder/pmdsky-debug) to the decomp.
# To use this script, you will need:
#   - A file named pmdsky_debug_location.txt with the file path to your local clone of pmdsky-debug.
#   - Python dependencies in requirements.txt.
# Make sure there are no uncommitted changes when running this, in case you need to revert.

pmdsky_debug_symbols = read_pmdsky_debug_symbols()
xmap_symbols = read_xmap_symbols()

asm_files = []
def add_files_with_extensions(folder: str, extensions: List[str]) -> List[str]:
    found_files = []
    for root, _, files in os.walk(folder):
        for file in files:
            for extension in extensions:
                if file.endswith(extension):
                    found_files.append(os.path.join(root, file))
                    break
    return found_files

asm_files = add_files_with_extensions('asm', ['.s', '.inc'])
src_files = add_files_with_extensions(HEADER_FOLDER, ['.h'])
src_files.extend(add_files_with_extensions('src', ['.c']))

for section_name, pmdsky_debug_section in pmdsky_debug_symbols.items():
    if section_name in xmap_symbols:
        xmap_section = xmap_symbols[section_name]
    else:
        xmap_section = {}

    for address, symbol in pmdsky_debug_section.items():
        if address in xmap_section and xmap_section[address].name != symbol.name and xmap_section[address].name not in MIXED_CASE_SYMBOLS:
            old_symbol = xmap_section[address]
            print(f'Replacing {old_symbol.name} with {symbol.name}')
            asm_search_string_bases = [
                f'arm_func_start {old_symbol.name}\n',
                f'arm_func_end {old_symbol.name}\n',
                f'\n{old_symbol.name}: ',
                f'thumb_func_start {old_symbol.name}\n',
                f'thumb_func_end {old_symbol.name}\n',
                f'.word {old_symbol.name}\n',
                f'b {old_symbol.name} ; case',
                f'bl {old_symbol.name}\n',
                f'blx {old_symbol.name}\n',
                f'beq {old_symbol.name}\n',
                f'bne {old_symbol.name}\n',
                f'; ={old_symbol.name}\n',
                f'.public {old_symbol.name}\n',
            ]
            asm_search_strings = [(base, base.replace(old_symbol.name, symbol.name)) for base in asm_search_string_bases]
            for file_path in asm_files:
                with open(file_path, 'r') as asm_file:
                    asm_contents = asm_file.read()
                for search_string in asm_search_strings:
                    asm_contents = asm_contents.replace(search_string[0], search_string[1])
                with open(file_path, 'w') as asm_file:
                    asm_file.write(asm_contents)

            src_search_string_bases = [
                f' {old_symbol.name}(',
                f'({old_symbol.name}(',
            ]
            src_search_strings = [(base, base.replace(old_symbol.name, symbol.name)) for base in src_search_string_bases]
            for file_path in src_files:
                with open(file_path, 'r') as src_file:
                    src_contents = src_file.read()
                for search_string in src_search_strings:
                    src_contents = src_contents.replace(search_string[0], search_string[1])
                with open(file_path, 'w') as src_file:
                    src_file.write(src_contents)
