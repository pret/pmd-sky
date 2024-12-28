import os
import re
from collections import defaultdict
from dataclasses import dataclass
from typing import Any, Dict, List
from ruamel.yaml.comments import CommentedMap
from ruamel.yaml.scalarint import HexCapsInt

from pmdsky_debug_reader import LANGUAGE_KEYS_XMAP_TO_PMDSKY_DEBUG, SYMBOLS_FOLDER, get_pmdsky_debug_location, read_pmdsky_debug_symbols
from symbol_details import ITCM_RAM_START_ADDRESSES, NONMATCHING_SYMBOLS_ARM7, NONMATCHING_SYMBOLS_ARM9, WRAM_OFFSET, SymbolDetails
from xmap_reader import HEADER_FOLDER, read_xmap_symbols
from yaml_writer import YamlManager, yaml

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

def read_symbol_array(symbol_path: str, symbol_type_key: str, yaml_manager: YamlManager) -> List[Any]:
    symbols_yaml_outer: Dict[str, Any] = yaml_manager.read_yaml(symbol_path)
    symbols_yaml: Dict[str, Any] = symbols_yaml_outer[list(symbols_yaml_outer.keys())[0]]
    return symbols_yaml[symbol_type_key]

def find_symbol_in_header(symbol_name: str, is_data: bool, header_contents: List[str]) -> int:
    for i, line in enumerate(header_contents):
        if is_data and re.search(fr' {symbol_name}[\[;]', line) or not is_data and f' {symbol_name}(' in line:
            return i
    return None

@dataclass
class SubsymbolDir:
    file_path: str
    addresses: Dict[str, int]
    length: Dict[str, int]

subsymbol_dirs = {}

def sync_xmap_symbol(address: int, symbol: SymbolDetails, language: str, section_name: str, yaml_manager: YamlManager, pmdsky_debug_section: Dict[int, SymbolDetails]):
    if default_symbol_name.match(symbol.name):
        return

    language_key = LANGUAGE_KEYS_XMAP_TO_PMDSKY_DEBUG[language]

    if section_name == 'arm7':
        nonmatching_symbols = NONMATCHING_SYMBOLS_ARM7
    else:
        nonmatching_symbols = NONMATCHING_SYMBOLS_ARM9
    if symbol.name in nonmatching_symbols:
        symbol.name = nonmatching_symbols[symbol.name]

    base_symbol_name = get_base_symbol_name(symbol.name)

    wram_address = None
    if section_name == 'arm7' and address >= 0x37F8000:
        # Shift ARM 7 WRAM to its ROM location.
        wram_address = address
        address -= WRAM_OFFSET

    path_prefix = os.path.join(pmdsky_debug_location, SYMBOLS_FOLDER)
    if base_symbol_name in symbol_file_paths[section_name]:
        symbol_path = symbol_file_paths[section_name][base_symbol_name]
        base_symbol_path = symbol_path[len(path_prefix) + 1:]
    else:
        if section_name == 'main':
            base_symbol_path = 'arm9.yml'
        elif section_name == 'arm7':
            base_symbol_path = 'arm7.yml'
        elif section_name == 'ITCM':
            base_symbol_path = os.path.join('arm9', 'itcm.yml')
        elif section_name == 'ram':
            base_symbol_path = 'ram.yml'
        else:
            base_symbol_path = f'overlay{int(section_name):02d}.yml'

        symbol_path = os.path.join(path_prefix, base_symbol_path)

        # Look through subdirectories to see if the symbol address is within range of them.
        subsymbol_dir = symbol_path[:-4]
        if subsymbol_dir not in subsymbol_dirs:
            subsymbol_dirs[subsymbol_dir] = []
            if os.path.exists(subsymbol_dir):
                for root, _, files in os.walk(subsymbol_dir):
                    for file in files:
                        if file == 'itcm.yml' or not file.endswith('.yml'):
                            continue

                        file_path = os.path.join(root, file)
                        with open(file_path, 'r') as yaml_file:
                            yaml_contents = yaml.load(yaml_file)
                            subsymbol_dirs[subsymbol_dir].append(SubsymbolDir(file_path, yaml_contents[file[:-4]]['address'], yaml_contents[file[:-4]]['length']))

        if subsymbol_dirs[subsymbol_dir] is not None:
            matching_subsymbol_file = None
            for file in subsymbol_dirs[subsymbol_dir]:
                file_address = file.addresses[language_key]
                if address > file_address and address < file_address + file.length[language_key] and (matching_subsymbol_file is None or file_address > matching_subsymbol_file.addresses[language_key]):
                    matching_subsymbol_file = file
            if matching_subsymbol_file is not None:
                symbol_path = matching_subsymbol_file.file_path


    if symbol.is_data:
        symbol_type_key = 'data'
    else:
        symbol_type_key = 'functions'

    if address in pmdsky_debug_section:
        # If the address is already defined in pmdsky-debug, add an alias with the new symbol name from the decomp.
        old_symbol = pmdsky_debug_section[address]
        base_old_symbol_names = [get_base_symbol_name(symbol_name) for symbol_name in old_symbol.get_all_names()]
        base_old_symbol_name = base_old_symbol_names[0]
        if base_symbol_name not in base_old_symbol_names and base_symbol_name not in symbol_file_paths[section_name]:
            print(f'Adding alias for {base_old_symbol_name}: {base_symbol_name}')
            symbol_array = read_symbol_array(symbol_path, symbol_type_key, yaml_manager)
            for yaml_symbol in symbol_array:
                if yaml_symbol['name'] == base_old_symbol_name:
                    if 'aliases' in yaml_symbol:
                        yaml_symbol['aliases'].append(base_symbol_name)
                    else:
                        yaml_symbol['aliases'] = [base_symbol_name]
                    break
        return

    matching_symbol_entry = None

    symbol_array = read_symbol_array(symbol_path, symbol_type_key, yaml_manager)

    # Add the symbol to the correspond header file.
    base_symbol_path = base_symbol_path.replace('.yml', '.h')
    header_path = symbol_path.replace(SYMBOLS_FOLDER, os.path.join('headers', symbol_type_key)).replace('.yml', '.h')
    if not os.path.exists(header_path):
        return
    with open(header_path, 'r') as header_file:
        header_contents = header_file.readlines()

    # Find the existing symbol and replace its address, or make a new one if it isn't there.
    symbol_preexisting = False
    insert_index = None
    target_header_line = None
    for i, symbol_entry in enumerate(symbol_array):
        if base_symbol_name == symbol_entry['name']:
            matching_symbol_entry = symbol_entry
            symbol_preexisting = True
            break
        else:
            # Keep track of the symbol directly before the target symbol.
            # This will be used as an anchor when appending to the header file.
            symbol_header_line = find_symbol_in_header(symbol_entry['name'], symbol.is_data, header_contents)
            if symbol_header_line is not None and insert_index is None:
                target_header_line = symbol_header_line - 1
            if language_key in symbol_entry['address']:
                current_symbol_address: int | List[int] = symbol_entry['address'][language_key]
                if isinstance(current_symbol_address, list):
                    current_symbol_address = current_symbol_address[0]
                if current_symbol_address > address and insert_index is None:
                    insert_index = i
    if not matching_symbol_entry:
        matching_symbol_entry = {
            'name': base_symbol_name,
            'address': CommentedMap()
        }
        if insert_index is None:
            symbol_array.append(matching_symbol_entry)
        else:
            symbol_array.insert(insert_index, matching_symbol_entry)


    symbol_entry_language_addresses: Dict[str, Any] = matching_symbol_entry['address']
    if language_key not in symbol_entry_language_addresses:
        symbol_entry_language_addresses[language_key] = None
    symbol_entry_addresses: int | List[int] = symbol_entry_language_addresses[language_key]


    hex_address = HexCapsInt(address)
    # When adding a new EU address, reorder it to the first key in the YAML for consistency with existing pmdsky-debug entries.
    reorder_languages = language_key == 'EU' and len(symbol_entry_language_addresses) > 1 and not symbol_entry_language_addresses[language_key]
    if multiple_symbol_suffix.search(symbol.name):
        if symbol_entry_addresses is None:
            symbol_entry_language_addresses[language_key] = [hex_address]
            if reorder_languages:
                symbol_entry_language_addresses.move_to_end(language_key, last=False)
        else:
            if isinstance(symbol_entry_addresses, HexCapsInt):
                print(f'Converting single address into array for {base_symbol_name}.')
                symbol_entry_addresses = [symbol_entry_addresses]
                symbol_entry_language_addresses[language_key] = symbol_entry_addresses
            if address not in symbol_entry_addresses:
                symbol_entry_addresses.append(hex_address)
                symbol_entry_addresses.sort()
            return
    else:
        if section_name == 'ITCM':
            # ITCM needs to be handled specially to add both ROM and RAM addresses.
            symbol_entry_language_addresses[language_key] = HexCapsInt(ITCM_RAM_START_ADDRESSES[language_key] + (hex_address - 0x1FF8000))
            symbol_entry_language_addresses[f'{language_key}-ITCM'] = hex_address
        else:
            symbol_entry_language_addresses[language_key] = HexCapsInt(hex_address)
            if reorder_languages:
                symbol_entry_language_addresses.move_to_end(language_key, last=False)

        if wram_address is not None:
            symbol_entry_language_addresses[language_key + '-WRAM'] = HexCapsInt(wram_address)
            if reorder_languages:
                symbol_entry_language_addresses.move_to_end('NA-WRAM')

    if symbol_preexisting:
        print(f'Updating address of {base_symbol_name} (region {language_key}) in {symbol_path}')
    else:
        print(f'Adding {base_symbol_name} (region {language_key}) to {symbol_path}')

    if symbol_preexisting:
        return

    # Look for the symbol that was immediately before the new symbol in the YAML.
    # The new symbol will be added directly after this anchor symbol.
    if target_header_line is None:
        if 'arm9' in header_path:
            for i, line in enumerate(header_contents):
                if line.startswith('// If declaring'):
                    target_header_line = i
                    break
        else:
            target_header_line = len(header_contents) - 2

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
        # Match the typedefs used in pmdsky-debug.
        if symbol_header is not None:
            symbol_header = symbol_header.replace('u32', 'uint32_t')
            symbol_header = symbol_header.replace('u16', 'uint16_t')
            symbol_header = symbol_header.replace('u8', 'uint8_t')
            symbol_header = symbol_header.replace('s32', 'int')
            symbol_header = symbol_header.replace('s16', 'int16_t')
            symbol_header = symbol_header.replace('s8', 'int8_t')
    else:
        symbol_header = f'void {base_symbol_name}(void);\n'

    header_contents[target_header_line] += symbol_header

    print(f'Adding {base_symbol_name} to {header_path}')

    with open(header_path, 'w') as header_file:
        header_file.writelines(header_contents)

# Extract all pmdsky-debug file paths for symbols between all languages.
symbol_file_paths: Dict[str, Dict[str, str]] = defaultdict(dict)
for language, pmdsky_debug_language_symbols in pmdsky_debug_symbols.items():
    for section_name, pmdsky_debug_section in pmdsky_debug_language_symbols.items():
        for address, symbol in pmdsky_debug_section.items():
            base_symbol_name = get_base_symbol_name(symbol.name)
            symbol_file_paths[section_name][base_symbol_name] = symbol.file_path

with YamlManager() as yaml_manager:
    for language, xmap_language_symbols in xmap_symbols.items():
        pmdsky_debug_language_symbols = pmdsky_debug_symbols[language]
        for section_name, xmap_section in xmap_language_symbols.items():
            if section_name in pmdsky_debug_language_symbols:
                pmdsky_debug_section = pmdsky_debug_language_symbols[section_name]
            else:
                pmdsky_debug_section = {}

            for address, symbol in xmap_section.items():
                sync_xmap_symbol(address, symbol, language, section_name, yaml_manager, pmdsky_debug_section)
