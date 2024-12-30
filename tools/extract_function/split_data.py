import os
import re
import sys

from write_inc_file import write_inc_file

# Use this script to split a data file at a certain symbol.
# Example usage: python split_data.py overlay_29_0234EC38 TWO_TURN_STATUSES

if len(sys.argv) != 3:
    print('Usage: python extract_function.py <asm_file> <split_symbol_name>')
    exit(1)

_, symbol_location, symbol_name = sys.argv[0:3]


if symbol_location.endswith('.s'):
    symbol_location = symbol_location[:-2]
if symbol_location.startswith("./asm/"):
    symbol_location = symbol_location[6:]

ASM_FOLDER = 'asm'
INCLUDE_FOLDER = os.path.join(ASM_FOLDER, 'include')
original_file_path = os.path.join(ASM_FOLDER, f'{symbol_location}.s')
original_inc_path = os.path.join(INCLUDE_FOLDER, f'{symbol_location}.inc')
with open(original_file_path, 'r') as original_file:
    original_lines = original_file.readlines()

SYMBOL_START = '\t.global '
symbol_line = None
new_symbol_address = None
hex_regex = re.compile('_[0-9A-F]{8}$')
data_type = None
for i, line in enumerate(original_lines):
    if line.startswith(f'{SYMBOL_START}{symbol_name}'):
        symbol_line = i
    elif line.startswith('\t.data') or line.startswith('\t.rodata') or line.startswith('\t.bss'):
        data_type = line[line.index('.') + 1:].rstrip()

    if symbol_line is not None and line.startswith(SYMBOL_START) and hex_regex.search(line) is not None:
        new_symbol_address = line[-9:-1]
        break

if symbol_line is None:
    print(f'Failed to find symbol {symbol_name}.')
    exit(1)

new_asm_lines = original_lines[symbol_line:]
original_asm_lines = original_lines[:symbol_line]

if symbol_location.startswith('main'):
    file_prefix = 'main_'
else:
    file_prefix = symbol_location[:len('overlay_00_')]
    if file_prefix[-1] != '_':
        file_prefix += '_'

LSF_FILE_PATH = 'main.lsf'
with open(LSF_FILE_PATH, 'r') as lsf_file:
    lsf_lines = lsf_file.readlines()

new_asm_base_name = f"{file_prefix}{data_type}_{new_symbol_address}"

# If needed, add the extracted function's new .o file to main.lsf.
merge_prev_file = None
merge_next_file = None
SRC_LSF_PREFIX = '\tObject src/'
for i, line in enumerate(lsf_lines):
    if line.endswith(f'{symbol_location}.o\n'):
        lsf_lines[i] += f'\tObject asm/{new_asm_base_name}.o\n'

print('Updating', LSF_FILE_PATH)
with open(LSF_FILE_PATH, 'w') as lsf_file:
    lsf_file.writelines(lsf_lines)

print('Updating', original_file_path)
with open(original_file_path, 'w') as original_file:
    original_file.writelines(original_asm_lines)
print('Updating', original_inc_path)
write_inc_file(original_asm_lines, original_inc_path)

new_inc_file_name = f"{new_asm_base_name}.inc"
new_asm_name = f'{new_asm_base_name}.s'
new_asm_header = f"""\t.include "asm/macros.inc"
\t.include "{new_inc_file_name}"

\t.{data_type}
"""
new_asm_file_path = os.path.join(ASM_FOLDER, new_asm_name)
print('Creating', new_asm_file_path)
with open(os.path.join(ASM_FOLDER, new_asm_name), 'w') as new_asm_file:
    new_asm_file.write(new_asm_header)
    new_asm_file.writelines(new_asm_lines)

new_asm_inc_path = os.path.join(INCLUDE_FOLDER, f'{new_asm_base_name}.inc')
print('Creating', new_asm_inc_path)
write_inc_file(new_asm_lines, new_asm_inc_path)
