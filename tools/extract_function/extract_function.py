import os
import sys

from typing import List

# Use this script to extract a function out of assembly and create a blank C function as a placeholder.
# If the function is in the middle, the assembly file is split in two. If the function is at either end, it is added to the next/previous source file.
# This is intended for use after decompiling a function, so that you can place the decompiled C code in the placeholder after running the script.
# Since this script updates files, it's recommended to have no uncommitted changes when running this script, in case something goes wrong and needs a revert.
# Example usage: python extract_function.py overlay_29_0234EC38 "u8 ov29_0234FCA8(u8 arg0)"

if len(sys.argv) != 3:
    print('Usage: python extract_function.py <asm_file> <function_header>')
    exit(1)

_, function_location, function_header = sys.argv
if function_location.endswith('.s'):
    function_location = function_location[:-2]
if function_header.endswith(';'):
    function_header = function_header[:-1]

left_parentheses_index = function_header.find('(')
if left_parentheses_index >= 0:
    function_name = function_header[function_header.rfind(' ', None, left_parentheses_index) + 1 : left_parentheses_index]
else:
    print('Unable to find function name in function header.')
    exit(1)

if os.getcwd().endswith('extract_function'):
    os.chdir(os.path.join('..', '..'))

ASM_FOLDER = 'asm'
INCLUDE_FOLDER = os.path.join(ASM_FOLDER, 'include')
HEADER_FOLDER = 'include'
SRC_FOLDER = 'src'
LSF_FILE_PATH = 'main.lsf'

original_file_path = os.path.join(ASM_FOLDER, f'{function_location}.s')
original_inc_path = os.path.join(INCLUDE_FOLDER, f'{function_location}.inc')
with open(original_file_path, 'r') as original_file:
    original_lines = original_file.readlines()

if function_location.startswith('main'):
    file_prefix = 'main_'
else:
    file_prefix = function_location[:len('overlay_00_')]

function_start_line = None
function_end_line = None
extract_function_address = None
new_file_address = None
ADDRESS_FIND = '; 0x'
ARM_FUNC_START = '\tarm_func_start '
first_function_start_line = None

def get_line_address(line: str):
    return line[line.index(ADDRESS_FIND) + len(ADDRESS_FIND) : -1]

for i, line in enumerate(original_lines):
    if first_function_start_line is None and line.startswith(ARM_FUNC_START):
        first_function_start_line = i
    if line == f'{ARM_FUNC_START}{function_name}\n':
        function_start_line = i
    elif line.startswith(f'\tarm_func_end {function_name}'):
        function_end_line = i
    
    if function_start_line is not None and extract_function_address is None and ADDRESS_FIND in line:
        extract_function_address = get_line_address(line)
    if function_end_line is not None and ADDRESS_FIND in line:
        new_file_address = get_line_address(line)
        break

if function_start_line is None or function_end_line is None or extract_function_address is None:
    print(f'Failed to find function. Start line {function_start_line}, end line {function_end_line}, extract address {extract_function_address}, new address {new_file_address}.')
    exit(1)

remove_orig_file = first_function_start_line == function_start_line
include_new_asm_file = new_file_address is not None

new_inc_file_name = f"{file_prefix}{new_file_address}.inc"
new_asm_header = f"""\t.include "asm/macros.inc"
\t.include "{new_inc_file_name}"

\t.text
"""
new_asm_name = f'{file_prefix}{new_file_address}.s'

new_asm_lines = original_lines[function_end_line + 1:]
original_asm_lines = original_lines[:function_start_line - 1]

with open(LSF_FILE_PATH, 'r') as lsf_file:
    lsf_lines = lsf_file.readlines()

extract_file_name = f'{file_prefix}{extract_function_address}'

merge_prev_file = None
merge_next_file = None
SRC_LSF_PREFIX = '\tObject src/'
for i, line in enumerate(lsf_lines):
    if line.endswith(f'{function_location}.o\n'):
        if remove_orig_file:
            lsf_lines[i] = ''
            prev_line = lsf_lines[i - 1]
            if prev_line.startswith(SRC_LSF_PREFIX):
                merge_prev_file = prev_line[len(SRC_LSF_PREFIX) : -3]
        if not include_new_asm_file and merge_prev_file is None:
            next_line = lsf_lines[i + 1]
            if next_line.startswith(SRC_LSF_PREFIX):
                merge_next_file = next_line[len(SRC_LSF_PREFIX) : -3]
        if merge_prev_file is None and merge_next_file is None:
            lsf_lines[i] += f'\tObject src/{extract_file_name}.o\n'
        if include_new_asm_file:
            lsf_lines[i] += f'\tObject asm/{file_prefix}{new_file_address}.o\n'
        break
    

BRANCH_LABEL_INSTRUCTION = '\tbl '
BRANCH_INSTRUCTION = '\tb '
WORD_KEY = '.word '
WORD_PLUS_OFFSET = ' + 0x'
def write_inc_file(lines: List[str], file_path: str):
    defined_functions = set()
    used_functions = set()
    for line in lines:
        if line.startswith(ARM_FUNC_START):
            defined_functions.add(line[len(ARM_FUNC_START) : -1])
        elif line.startswith(BRANCH_LABEL_INSTRUCTION):
            used_functions.add(line[len(BRANCH_LABEL_INSTRUCTION) : -1])
        elif line.startswith(BRANCH_INSTRUCTION):
            function = line[len(BRANCH_INSTRUCTION) : -1]
            if function[0] != '_':
                semicolon_index = function.index(' ; ')
                used_functions.add(function[:semicolon_index])
        else:
            word_index = line.find(WORD_KEY)
            if word_index >= 0 and f'{WORD_KEY}0x' not in line:
                word_plus_offset_index = line.find(WORD_PLUS_OFFSET)
                if word_plus_offset_index >= 0:
                    used_functions.add(line[word_index + len(WORD_KEY) : word_plus_offset_index])
                else:
                    used_functions.add(line[word_index + len(WORD_KEY) : -1])

    for function in defined_functions:
        if function in used_functions:
            used_functions.remove(function)

    write_lines = ['#pragma once\n']
    for function in sorted(used_functions):
        write_lines.append(f'.public {function}\n')

    with open(file_path, 'w') as inc_file:
        inc_file.writelines(write_lines)

print('Updating', LSF_FILE_PATH)
with open(LSF_FILE_PATH, 'w') as lsf_file:
    lsf_file.writelines(lsf_lines)

if remove_orig_file:
    print('Removing', original_file_path)
    os.remove(original_file_path)
    print('Removing', original_inc_path)
    os.remove(original_inc_path)
else:
    print('Updating', original_file_path)
    with open(original_file_path, 'w') as original_file:
        original_file.writelines(original_asm_lines)
    print('Updating', original_inc_path)
    write_inc_file(original_asm_lines, original_inc_path)

if include_new_asm_file:
    new_asm_file_path = os.path.join(ASM_FOLDER, new_asm_name)
    print('Creating', new_asm_file_path)
    with open(os.path.join(ASM_FOLDER, new_asm_name), 'w') as new_asm_file:
        new_asm_file.write(new_asm_header)
        new_asm_file.writelines(new_asm_lines)

    new_asm_inc_path = os.path.join(INCLUDE_FOLDER, f'{file_prefix}{new_file_address}.inc')
    print('Creating', new_asm_inc_path)
    write_inc_file(new_asm_lines, new_asm_inc_path)

function_body = f"""{function_header}
{{

}}"""

if merge_prev_file:
    header_file_path = os.path.join(HEADER_FOLDER, f'{merge_prev_file}.h')
    with open(header_file_path, 'r') as header_file:
        header_lines = header_file.readlines()
    for i, line in reversed(list(enumerate(header_lines))):
        if line != '\n' and not line.startswith('#'):
            header_lines[i] += f'{function_header};\n'
            break
    print('Updating', header_file_path)
    with open(header_file_path, 'w') as header_file:
        header_file.writelines(header_lines)

    src_file_path = os.path.join(SRC_FOLDER, f'{merge_prev_file}.c')
    print('Updating', src_file_path)
    with open(src_file_path, 'a') as src_file:
        src_file.write(f'\n{function_body}\n')

elif merge_next_file:
    def add_in_body_start(file_path: str, add_content: str):
        with open(file_path, 'r') as add_file:
            file_lines = add_file.readlines()
        for i, line in enumerate(file_lines):
            if line != '\n' and not line.startswith('#'):
                file_lines[i] = add_content + file_lines[i]
                break
        with open(file_path, 'w') as add_file:
            add_file.writelines(file_lines)

    header_file_path = os.path.join(HEADER_FOLDER, f'{merge_next_file}.h')
    print('Updating', header_file_path)
    add_in_body_start(header_file_path, f'{function_header};\n')

    src_file_path = os.path.join(SRC_FOLDER, f'{merge_next_file}.c')
    print('Updating', src_file_path)
    add_in_body_start(src_file_path, f'{function_body}\n\n')

else:
    header_file_path = os.path.join(HEADER_FOLDER, f'{extract_file_name}.h')
    print('Creating', header_file_path)
    with open(header_file_path, 'w') as new_header_file:
        file_guard = f'PMDSKY_{(file_prefix + extract_function_address).upper()}_H'
        new_header_file.write(f'#ifndef {file_guard}\n#define {file_guard}\n\n')
        new_header_file.write(f'{function_header};\n\n')
        new_header_file.write(f'#endif //{file_guard}\n')

    src_file_path = os.path.join(SRC_FOLDER, f'{extract_file_name}.c')
    print('Creating', src_file_path)
    with open(src_file_path, 'w') as new_src_file:
        new_src_file.write(f'#include "{extract_file_name}.h\n\n{function_body}\n')
