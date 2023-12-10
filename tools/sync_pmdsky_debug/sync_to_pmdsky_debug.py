import os
import re
from typing import Any, Dict, List
from ruamel.yaml.comments import CommentedMap
from ruamel.yaml.scalarint import HexCapsInt

from pmdsky_debug_reader import LANGUAGE_KEYS_XMAP_TO_PMDSKY_DEBUG, SYMBOLS_FOLDER, get_pmdsky_debug_location, read_pmdsky_debug_symbols
from symbol_details import MIXED_CASE_SYMBOLS_ARM7, MIXED_CASE_SYMBOLS_ARM9, WRAM_OFFSET, SymbolDetails
from xmap_reader import HEADER_FOLDER, read_xmap_symbols
from yaml_writer import YamlManager

# Syncs symbols from the decomp to a local clone of pmdsky-debug (https://github.com/UsernameFodder/pmdsky-debug).
# To use this script, you will need:
#   - A file named pmdsky_debug_location.txt with the file path to your local clone of pmdsky-debug.
#   - Python dependencies in requirements.txt.
# Make sure there are no uncommitted changes in pmdsky-debug when running this, in case you need to revert.

pmdsky_debug_symbols = read_pmdsky_debug_symbols()
xmap_symbols = read_xmap_symbols()

pmdsky_debug_location = get_pmdsky_debug_location()
default_symbol_name = re.compile(r'^(?:ov\d{2}|sub)?_[\dA-F]{8}(?:_[\w]{2})?$')
multiple_symbol_suffix = re.compile(r'__[\dA-F]{8}(?:_[\w]{2})?$')

def get_base_symbol_name(symbol_name: str) -> str:
    if multiple_symbol_suffix.search(symbol_name):
        return symbol_name[:symbol.name.find('__')]
    return symbol_name

def sync_xmap_symbol(address: int, symbol: SymbolDetails, language: str, yaml_manager: YamlManager):
    if default_symbol_name.match(symbol.name):
        return

    language_key = LANGUAGE_KEYS_XMAP_TO_PMDSKY_DEBUG[language]

    if section_name == 'arm7':
        mixed_case_symbols = MIXED_CASE_SYMBOLS_ARM7
    else:
        mixed_case_symbols = MIXED_CASE_SYMBOLS_ARM9
    if symbol.name in mixed_case_symbols:
        symbol.name = mixed_case_symbols[symbol.name]

    base_symbol_name = get_base_symbol_name(symbol.name)

    wram_address = None
    if section_name == 'arm7' and address >= 0x37F8000:
        # Shift ARM 7 WRAM to its ROM location.
        wram_address = address
        address -= WRAM_OFFSET

    if address in pmdsky_debug_section:
        # If the address is already defined in pmdsky-debug, replace the old symbol name with the new one in the YAML and header files.
        old_symbol = pmdsky_debug_section[address]
        base_old_symbol_name = get_base_symbol_name(old_symbol.name)
        if base_old_symbol_name != base_symbol_name:
            yaml_manager.write_yaml()
            print(f'Replacing {base_old_symbol_name} with {base_symbol_name}')
            with open(old_symbol.file_path, 'r') as symbols_file:
                symbol_contents = symbols_file.read()
            symbol_contents = symbol_contents.replace(f'name: {base_old_symbol_name}\n', f'name: {base_symbol_name}\n')
            with open(old_symbol.file_path, 'w') as symbol_file:
                symbol_file.write(symbol_contents)

            header_path = old_symbol.file_path.replace(SYMBOLS_FOLDER, os.path.join('headers', 'functions')).replace('.yml', '.h')
            with open(header_path, 'r') as header_file:
                header_contents = header_file.read()
            header_contents = header_contents.replace(f' {base_old_symbol_name}(', f' {base_symbol_name}(')
            with open(header_path, 'w') as header_file:
                header_file.write(header_contents)
        return

    path_prefix = os.path.join(pmdsky_debug_location, SYMBOLS_FOLDER)
    if base_symbol_name in symbol_file_paths:
        symbol_path = symbol_file_paths[base_symbol_name]
        base_symbol_path = symbol_path[len(path_prefix) + 1:]
    else:
        if section_name == 'main':
            base_symbol_path = 'arm9.yml'
        elif section_name == 'arm7':
            base_symbol_path = 'arm7.yml'
        elif section_name == 'ITCM':
            base_symbol_path = os.path.join('arm9', 'itcm.yml')
        else:
            base_symbol_path = f'overlay{int(section_name):02d}.yml'

        symbol_path = os.path.join(path_prefix, base_symbol_path)

    symbols_yaml_outer: Dict[str, Any] = yaml_manager.read_yaml(symbol_path)

    symbols_yaml: Dict[str, Any] = symbols_yaml_outer[list(symbols_yaml_outer.keys())[0]]

    if symbol.is_data:
        symbol_type_key = 'data'
    else:
        symbol_type_key = 'functions'
    symbol_array: List[Any] = symbols_yaml[symbol_type_key]

    matching_symbol_entry = None
    symbol_before = None

    # Find the existing symbol and replace its address, or make a new one if it isn't there.
    symbol_preexisting = False
    insert_index = None
    for i, symbol_entry in enumerate(symbol_array):
        if base_symbol_name == symbol_entry['name']:
            matching_symbol_entry = symbol_entry
            symbol_preexisting = True
            break
        else:
            # Keep track of the symbol directly before the target symbol.
            # This will be used later as an anchor when appending to the header file.
            symbol_before: str = symbol_entry['name']
            if language_key in symbol_entry['address']:
                current_symbol_address: int | List[int] = symbol_entry['address'][language_key]
                if isinstance(current_symbol_address, list):
                    current_symbol_address = current_symbol_address[0]
                if current_symbol_address > address:
                    insert_index = i
                    break
    if not matching_symbol_entry:
        matching_symbol_entry = {
            'name': base_symbol_name,
            'address': CommentedMap()
        }
        if insert_index is None:
            symbol_array.append(matching_symbol_entry)
        else:
            symbol_array.insert(insert_index, matching_symbol_entry)

    if symbol_preexisting:
        print(f'Updating address of {base_symbol_name} in {base_symbol_path}')
    else:
        print(f'Adding {base_symbol_name} to {base_symbol_path}')

    symbol_entry_language_addresses: Dict[str, Any] = matching_symbol_entry['address']
    if language_key not in symbol_entry_language_addresses:
        symbol_entry_language_addresses[language_key] = None
    symbol_entry_addresses: int | List[int] = symbol_entry_language_addresses[language_key]


    hex_address = HexCapsInt(address)
    reorder_languages = language_key == 'EU' and len(symbol_entry_language_addresses) > 1 and not symbol_entry_language_addresses[language_key]
    if multiple_symbol_suffix.search(symbol.name):
        if symbol_entry_addresses is None:
            symbol_entry_language_addresses[language_key] = [hex_address]
            if reorder_languages:
                symbol_entry_language_addresses.move_to_end(language_key, last=False)
        else:
            if address not in symbol_entry_addresses:
                symbol_entry_addresses.append(hex_address)
            return
    else:
        symbol_entry_language_addresses[language_key] = HexCapsInt(hex_address)
        if reorder_languages:
            symbol_entry_language_addresses.move_to_end(language_key, last=False)

        if wram_address is not None:
            symbol_entry_language_addresses[language_key + '-WRAM'] = HexCapsInt(wram_address)
            if reorder_languages:
                symbol_entry_language_addresses.move_to_end('NA-WRAM')

    if symbol_preexisting:
        return

    base_symbol_path = base_symbol_path.replace('.yml', '.h')
    header_path = symbol_path.replace(SYMBOLS_FOLDER, os.path.join('headers', symbol_type_key)).replace('.yml', '.h')
    with open(header_path, 'r') as header_file:
        header_contents = header_file.readlines()

    target_line = None
    if symbol_before is not None:
        for i, line in enumerate(header_contents):
            if symbol.is_data and re.search(fr' {symbol_before}[[;]', line) or not symbol.is_data and f' {symbol_before}(' in line:
                target_line = i
                break
        if target_line is None:
            print(f'Could not find preceding symbol {symbol_before} to {base_symbol_name} in {base_symbol_path}')
            return

    if target_line is None:
        if 'arm9' in header_path:
            for i, line in enumerate(header_contents):
                if line.startswith('// If declaring'):
                    target_line = i
                    break
        else:
            target_line = len(header_contents) - 2

    # If the symbol is a data symbol, look through the ASM to find how much space the symbol takes.
    symbol_length = 0
    string_length = None
    if symbol.is_data:
        asm_path = os.path.join('asm', symbol.file_path.replace('.o', '.s'))
        if os.path.exists(asm_path):
            with open(asm_path) as asm_file:
                asm_contents = asm_file.readlines()
            for i, line in enumerate(asm_contents):
                if line.startswith(f'\t.global {base_symbol_name}'):
                    target_asm_line = asm_contents[i + 2]
                    string_index = target_asm_line.find('.string "')
                    if string_index >= 0:
                        target_string = target_asm_line[string_index + len('.string "'):-2].replace('\\n', 'n')
                        string_length = len(target_string)
                        symbol_length = string_length + 1
                        if symbol_length % 4 > 0:
                            symbol_length += 4 - symbol_length % 4
                    break

    # Write the new symbol within the header file.
    symbol_header_path = os.path.join(HEADER_FOLDER, symbol.file_path.replace('.o', '.h'))
    if not os.path.exists(symbol_header_path):
        symbol_header_path = os.path.join('lib', 'DSE', symbol_header_path)
    if symbol.is_data:
        if string_length is not None:
            symbol_header = f'extern char {base_symbol_name}[{string_length}];\n'
        else:
            symbol_header = f'extern undefined {base_symbol_name};\n'
    elif os.path.exists(symbol_header_path):
        with open(symbol_header_path, 'r') as symbol_header_file:
            symbol_header_contents = symbol_header_file.readlines()
        for line in symbol_header_contents:
            if f' {base_symbol_name}(' in line:
                symbol_header = line
                break
        symbol_header = symbol_header.replace('u32', 'uint32_t')
        symbol_header = symbol_header.replace('u16', 'uint16_t')
        symbol_header = symbol_header.replace('u8', 'uint8_t')
        symbol_header = symbol_header.replace('s32', 'int')
        symbol_header = symbol_header.replace('s16', 'int16_t')
        symbol_header = symbol_header.replace('s8', 'int8_t')
    else:
        symbol_header = f'void {base_symbol_name}(void);\n'

    header_contents[target_line - 1] += symbol_header

    with open(header_path, 'w') as header_file:
        header_file.writelines(header_contents)

# Extract all pmdsky-debug file paths for symbols between all languages.
symbol_file_paths: Dict[str, str] = {}
for language, pmdsky_debug_language_symbols in pmdsky_debug_symbols.items():
    for section_name, pmdsky_debug_section in pmdsky_debug_language_symbols.items():
        for address, symbol in pmdsky_debug_section.items():
            base_symbol_name = get_base_symbol_name(symbol.name)
            symbol_file_paths[base_symbol_name] = symbol.file_path

with YamlManager() as yaml_manager:
    for language, xmap_language_symbols in xmap_symbols.items():
        pmdsky_debug_language_symbols = pmdsky_debug_symbols[language]
        for section_name, xmap_section in xmap_language_symbols.items():
            if section_name in pmdsky_debug_language_symbols:
                pmdsky_debug_section = pmdsky_debug_language_symbols[section_name]
            else:
                pmdsky_debug_section = {}

            for address, symbol in xmap_section.items():
                sync_xmap_symbol(address, symbol, language, yaml_manager)
