import os
import re
from typing import List

from pmdsky_debug_reader import read_pmdsky_debug_symbols
from symbol_details import NONMATCHING_SYMBOLS_ARM7, NONMATCHING_SYMBOLS_ARM9, WRAM_OFFSET
from xmap_reader import HEADER_FOLDER, read_xmap_symbols

# Syncs symbols from pmdsky-debug (https://github.com/UsernameFodder/pmdsky-debug) to the decomp.
# To use this script, you will need:
#   - A file named pmdsky_debug_location.txt with the file path to your local clone of pmdsky-debug.
#   - Python dependencies in requirements.txt.
# Make sure there are no uncommitted changes when running this, in case you need to revert.

pmdsky_debug_symbols = read_pmdsky_debug_symbols()
xmap_symbols = read_xmap_symbols()

asm_files = []
"""
Searches for all files within a directory that have certain extensions.
"""
def add_files_with_extensions(folder: str, extensions: List[str]) -> List[str]:
    found_files = []
    for root, _, files in os.walk(folder):
        for file in files:
            for extension in extensions:
                if file.endswith(extension):
                    found_files.append(os.path.join(root, file))
                    break
    return found_files

ASM_EXTENSIONS = ['.s', '.inc']
asm_files = add_files_with_extensions('asm', ASM_EXTENSIONS)
asm_files.extend(add_files_with_extensions('lib', ASM_EXTENSIONS))

asm_arm7_files = add_files_with_extensions(os.path.join('sub', 'asm'), ASM_EXTENSIONS)
asm_arm7_files.extend(add_files_with_extensions(os.path.join('sub', 'lib'), ASM_EXTENSIONS))

src_files = add_files_with_extensions(HEADER_FOLDER, ['.h'])
src_files.extend(add_files_with_extensions('src', ['.c']))
src_files.extend(add_files_with_extensions('lib', ['.c', '.h']))

replaced_symbols = set()
for language, pmdsky_debug_language_symbols in pmdsky_debug_symbols.items():
    if language not in xmap_symbols:
        continue
    xmap_language_symbols = xmap_symbols[language]
    for section_name, pmdsky_debug_section in pmdsky_debug_language_symbols.items():
        if section_name in xmap_language_symbols:
            xmap_section = xmap_language_symbols[section_name]
        else:
            xmap_section = {}

        for address, symbol in pmdsky_debug_section.items():
            if section_name == 'arm7' and address < 0x27E0000:
                # Shift ARM7 WRAM to its RAM location.
                address += WRAM_OFFSET
            if address not in xmap_section:
                continue
            old_symbol = xmap_section[address]
            if old_symbol.name in symbol.get_all_names():
                continue
            if old_symbol.name in NONMATCHING_SYMBOLS_ARM9 or old_symbol.name in NONMATCHING_SYMBOLS_ARM7:
                continue
            if old_symbol.name in replaced_symbols:
                continue
            if '__' in old_symbol.name:
                # When a symbol is duplicated in multiple places and has the address appended to the symbol name,
                # don't flag the EU name/address combination as a different symbol.
                base_symbol = old_symbol.name.split('__')[0]
                if any(symbol_name.startswith(f'{base_symbol}__') for symbol_name in symbol.get_all_names()):
                    continue

            print(f'Replacing {old_symbol.name} with {symbol.name}')
            replaced_symbols.add(old_symbol.name)

            # Replace symbol occurrences in ASM files.
            if symbol.is_data:
                asm_search_string_bases = [
                    f'\n{old_symbol.name}:\n',
                    f'.word {old_symbol.name}\n',
                    f'; ={old_symbol.name}\n',
                    f'.global {old_symbol.name}\n',
                    f'.public {old_symbol.name}\n',
                ]
            else:
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
            candidate_asm_files = asm_files
            if section_name == 'arm7':
                candidate_asm_files = asm_arm7_files
            for file_path in candidate_asm_files:
                with open(file_path, 'r') as asm_file:
                    asm_contents = asm_file.read()
                for search_string in asm_search_strings:
                    asm_contents = asm_contents.replace(search_string[0], search_string[1])
                if file_path.endswith('.inc') and 'macros' not in file_path and 'syscall' not in file_path:
                    asm_contents_split = asm_contents.split('\n')
                    sorted_imports = sorted(asm_contents_split[1:], key=str.casefold)
                    if len(sorted_imports) and sorted_imports[0] == '':
                        sorted_imports = sorted_imports[1:]
                    asm_contents = '#pragma once\n' + '\n'.join(sorted_imports) + '\n'

                with open(file_path, 'w') as asm_file:
                    asm_file.write(asm_contents)

            # Replace symbol occurrences in C files.
            src_search_string_data_regex = re.compile(fr'([ &*(]){old_symbol.name}([,); [])')
            src_search_string_data_regex_replace = fr'\1{symbol.name}\2'

            src_search_string_bases = [
                f' {old_symbol.name}(',
                f'({old_symbol.name}(',
            ]
            src_search_function_strings = [(base, base.replace(old_symbol.name, symbol.name)) for base in src_search_string_bases]
            for file_path in src_files:
                with open(file_path, 'r') as src_file:
                    src_contents = src_file.read()
                if symbol.is_data:
                    src_contents = src_search_string_data_regex.sub(src_search_string_data_regex_replace, src_contents)
                else:
                    for search_string in src_search_function_strings:
                        src_contents = src_contents.replace(search_string[0], search_string[1])
                with open(file_path, 'w') as src_file:
                    src_file.write(src_contents)
