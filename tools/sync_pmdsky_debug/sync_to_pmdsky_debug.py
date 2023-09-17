from pmdsky_debug_reader import *
from symbol_details import *
from xmap_reader import *
import re

# Syncs symbols from the decomp to a local clone of pmdsky-debug (https://github.com/UsernameFodder/pmdsky-debug).
# To use this script, you will need:
#   - A file named pmdsky_debug_location.txt with the file path to your local clone of pmdsky-debug.
#   - Python dependencies in requirements.txt.
# Make sure there are no uncommitted changes in pmdsky-debug when running this, in case you need to revert.

pmdsky_debug_symbols = read_pmdsky_debug_symbols()
xmap_symbols = read_xmap_symbols()

pmdsky_debug_location = get_pmdsky_debug_location()
default_symbol_name = re.compile(r'^(?:ov\d{2}|sub)?_[\dA-F]{8}$')
multiple_symbol_suffix = re.compile(r'__[\dA-F]{8}$')

for section_name, xmap_section in xmap_symbols.items():
    if section_name in pmdsky_debug_symbols:
        pmdsky_debug_section = pmdsky_debug_symbols[section_name]
    else:
        pmdsky_debug_section = {}

    for address, symbol in xmap_section.items():
        if default_symbol_name.match(symbol.name):
            continue

        if symbol.name in MIXED_CASE_SYMBOLS:
            symbol.name = MIXED_CASE_SYMBOLS[symbol.name]

        if address in pmdsky_debug_section:
            old_symbol = pmdsky_debug_section[address]
            if pmdsky_debug_section[address].name != symbol.name:
                print(f'Replacing {old_symbol.name} with {symbol.name}')
                with open(old_symbol.file_path, 'r') as symbol_file:
                    symbol_contents = symbol_file.read()
                symbol_contents = symbol_contents.replace(f'name: {old_symbol.name}\n', f'name: {symbol.name}\n')
                with open(old_symbol.file_path, 'w') as symbol_file:
                    symbol_file.write(symbol_contents)

                header_path = old_symbol.file_path.replace(SYMBOLS_FOLDER, os.path.join('headers', 'functions')).replace('.yml', '.h')
                with open(header_path, 'r') as header_file:
                    header_contents = header_file.read()
                header_contents = header_contents.replace(f' {old_symbol.name}(', f' {symbol.name}(')
                with open(header_path, 'w') as header_file:
                    header_file.write(header_contents)
        else:
            if section_name == 'main':
                symbol_path = 'arm9.yml'
            elif section_name == 'ITCM':
                symbol_path = os.path.join('arm9', 'itcm.yml')
            else:
                symbol_path = f'overlay{int(section_name):02d}.yml'
            print(f'Adding {symbol.name} to {symbol_path}')

            symbol_path = os.path.join(pmdsky_debug_location, SYMBOLS_FOLDER, symbol_path)
            with open(symbol_path, 'r') as symbol_file:
                symbol_contents = symbol_file.readlines()

            if multiple_symbol_suffix.search(symbol.name):
                base_symbol_name = symbol.name[:symbol.name.find('__')]
                found_base_symbol = False
                found_base_symbol_na = False
                write_multisymbol_address = False
                for i, line in enumerate(symbol_contents):
                    if not found_base_symbol:
                        found_base_symbol = line == f'    - name: {base_symbol_name}\n'
                    elif found_base_symbol and not found_base_symbol_na:
                        found_base_symbol_na = line == '        NA:\n'
                    elif found_base_symbol_na:
                        if line.startswith('          - '):
                            if int(line[-11:-1], 16) > address:
                                write_multisymbol_address = True
                        else:
                            write_multisymbol_address = True
                        if write_multisymbol_address:
                            symbol_contents[i - 1] += f'          - 0x{address:X}\n'
                            break

                if write_multisymbol_address:
                    with open(symbol_path, 'w') as symbol_file:
                        symbol_file.writelines(symbol_contents)
                    continue
                else:
                    symbol.name = base_symbol_name

            symbol_length = 0
            string_length = None
            if symbol.is_data:
                symbols_start = '  data:\n'

                asm_path = os.path.join('asm', symbol.file_path.replace('.o', '.s'))
                if os.path.exists(asm_path):
                    with open(asm_path) as asm_file:
                        asm_contents = asm_file.readlines()
                    for i, line in enumerate(asm_contents):
                        if line.startswith(f'\t.global {symbol.name}'):
                            target_line = asm_contents[i + 2]
                            string_index = target_line.find('.string "')
                            if string_index >= 0:
                                target_string = target_line[string_index + len('.string "'):-2].replace('\\n', 'n')
                                string_length = len(target_string)
                                symbol_length = string_length + 1
                                if symbol_length % 4 > 0:
                                    symbol_length += 4 - symbol_length % 4
                            break

            else:
                symbols_start = '  functions:\n'

            found_symbols = False
            symbol_before = None
            write_end_list = False
            for i, line in enumerate(symbol_contents):
                if found_symbols:
                    write_new_symbol = False
                    if line.startswith('    - name:'):
                        current_symbol_index = i
                    elif line.startswith('        NA:'):
                        if line.endswith('NA:\n'):
                            address_line = symbol_contents[i + 1]
                        else:
                            address_line = line
                        address_line_string = address_line[-10 : -1]
                        if ':' not in address_line_string:
                            current_symbol_address = int(address_line_string, 16)
                            write_new_symbol = address < current_symbol_address
                    elif symbol.is_data and i >= len(symbol_contents) - 2 or not symbol.is_data and line == '  data:\n':
                        write_new_symbol = True
                        write_end_list = True
                        current_symbol_index = i

                    if write_new_symbol:
                        if write_end_list:
                            symbol_before = None
                        else:
                            symbol_before = symbol_contents[current_symbol_index][len('    - name: ') : -1]
                        if symbol.is_data:
                            symbol_contents[current_symbol_index - 1] += f"""    - name: {symbol.name}
      address:
        NA: 0x{address:X}
      length:
        NA: 0x{symbol_length:X}
"""
                        else:
                            symbol_contents[current_symbol_index - 1] += f"""    - name: {symbol.name}
      address:
        NA: 0x{address:X}
"""
                        break

                elif line == symbols_start:
                    found_symbols = True
                    current_symbol_index = i

            with open(symbol_path, 'w') as symbol_file:
                symbol_file.writelines(symbol_contents)


            if symbol.is_data:
                header_file_name = 'data'
            else:
                header_file_name = 'functions'

            header_path = symbol_path.replace(SYMBOLS_FOLDER, os.path.join('headers', header_file_name)).replace('.yml', '.h')
            with open(header_path, 'r') as header_file:
                header_contents = header_file.readlines()

            target_line = None
            if symbol_before is not None:
                for i, line in enumerate(header_contents):
                    if symbol.is_data and re.search(fr' {symbol_before}[[;]', line) or symbol.is_data and f' {symbol_before}(' in line:
                        target_line = i
                        break
                if target_line is None:
                    print(f'Could not find preceding symbol {symbol_before} to {symbol.name} in {header_path}')
                    continue

            if target_line is None:
                if 'arm9' in header_path:
                    for i, line in enumerate(header_contents):
                        if line.startswith('// If declaring'):
                            target_line = i
                            break
                else:
                    target_line = len(header_contents) - 2

            symbol_header_path = os.path.join(HEADER_FOLDER, symbol.file_path.replace('.o', '.h'))
            if symbol.is_data:
                if string_length is not None:
                    symbol_header = f'extern char {symbol.name}[{string_length}];\n'
                else:
                    symbol_header = f'extern undefined {symbol.name};\n'
            elif os.path.exists(symbol_header_path):
                with open(symbol_header_path, 'r') as symbol_header_file:
                    symbol_header_contents = symbol_header_file.readlines()
                for line in symbol_header_contents:
                    if f' {symbol.name}(' in line:
                        symbol_header = line
                        break
                symbol_header = symbol_header.replace('u32', 'uint32_t')
                symbol_header = symbol_header.replace('u16', 'uint16_t')
                symbol_header = symbol_header.replace('u8', 'uint8_t')
                symbol_header = symbol_header.replace('s32', 'int32_t')
                symbol_header = symbol_header.replace('s16', 'int16_t')
                symbol_header = symbol_header.replace('s8', 'int8_t')
            else:
                symbol_header = f'void {symbol.name}(void);\n'

            header_contents[target_line - 1] += symbol_header

            with open(header_path, 'w') as header_file:
                header_file.writelines(header_contents)
