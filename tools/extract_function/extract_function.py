import os
import sys

from write_inc_file import write_inc_file

# Use this script to extract a function out of assembly and create a blank C function as a placeholder.
# If the function is in the middle, the assembly file is split in two. If the function is at either end, it is added to the next/previous source file.
# This is intended for use after decompiling a function, so that you can place the decompiled C code in the placeholder after running the script.
# Since this script updates files, it's recommended to have no uncommitted changes when running this script, in case something goes wrong and needs a revert.
# Example usage (auto-generated file name): python extract_function.py overlay_29_0234EC38 "u8 ov29_0234FCA8(u8 arg0)"
# Example usage (custom file name): python extract_function.py overlay_29_0234EC38 "u8 ov29_0234FCA8(u8 arg0)" my_new_file

if len(sys.argv) < 3 or len(sys.argv) > 5:
    print('Usage: python extract_function.py <asm_file> <function_header> <extract_file_name> <nonmatching>')
    exit(1)

_, function_location, function_header = sys.argv[0:3]
extract_file_name = None
if len(sys.argv) >= 4 and len(sys.argv[3]) > 0:
    extract_file_name = sys.argv[3]

nonmatching = len(sys.argv) >= 5 and sys.argv[4] == 'nonmatching'

if function_location.endswith('.s'):
    function_location = function_location[:-2]
if function_location.startswith('./asm/'):
    function_location = function_location[6:]
if function_header.endswith(';'):
    function_header = function_header[:-1]

is_itcm = function_location.startswith('itcm')

# Extract the function name from the function header argument.
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
    if file_prefix[-1] != '_':
        file_prefix += '_'

function_start_line = None
function_end_line = None
extract_function_address = None
new_file_address = None
ADDRESS_FIND = '; 0x'
ARM_FUNC_START = '\tarm_func_start '
first_function_start_line = None

def get_line_address(line: str):
    return line[line.index(ADDRESS_FIND) + len(ADDRESS_FIND) : -1]

# Find the start and end of the function within the ASM file.
for i, line in enumerate(original_lines):
    if first_function_start_line is None and line.startswith(ARM_FUNC_START):
        first_function_start_line = i
    if line.strip() == f'{ARM_FUNC_START}{function_name}'.strip():
        function_start_line = i
    elif line.strip() == f'arm_func_end {function_name}'.strip():
        function_end_line = i

    if function_start_line is not None and extract_function_address is None and ADDRESS_FIND in line:
        extract_function_address = get_line_address(line)
    if function_end_line is not None and ADDRESS_FIND in line:
        new_file_address = get_line_address(line)
        break

if function_start_line is None or function_end_line is None or extract_function_address is None:
    print(f'Failed to find function. Start line {function_start_line}, end line {function_end_line}, extract address {extract_function_address}, new address {new_file_address}.')
    exit(1)

new_asm_base_name = f"{file_prefix}{new_file_address}"

remove_orig_file = first_function_start_line == function_start_line
include_new_asm_file = new_file_address is not None

new_inc_file_name = f"{new_asm_base_name}.inc"
section_name = 'text'
if is_itcm:
    section_name = 'itcm,4,1,4'
new_asm_header = f"""\t.include "asm/macros.inc"
\t.include "{new_inc_file_name}"

\t.{section_name}
"""
new_asm_name = f'{new_asm_base_name}.s'

new_asm_lines = original_lines[function_end_line + 1:]
if nonmatching:
    original_asm_lines = original_lines[:function_end_line + 1]
    original_asm_lines.append('#endif\n')
    original_asm_lines[function_start_line] = '#ifndef NONMATCHING\n' + original_asm_lines[function_start_line]
else:
    original_asm_lines = original_lines[:function_start_line - 1]

with open(LSF_FILE_PATH, 'r') as lsf_file:
    lsf_lines = lsf_file.readlines()

if extract_file_name is None:
    extract_file_name = f'{file_prefix}{extract_function_address}'

# If needed, add the extracted function's new .o file to main.lsf.
merge_prev_file = None
merge_next_file = None
lsf_suffix = ''
if is_itcm:
    lsf_suffix = ' (.itcm)'
SRC_LSF_PREFIX = '\tObject src/'
for i, line in enumerate(lsf_lines):
    if line.endswith(f'{function_location}.o{lsf_suffix}\n'):
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
            lsf_lines[i] += f'\tObject src/{extract_file_name}.o{lsf_suffix}\n'
        if include_new_asm_file:
            lsf_lines[i] += f'\tObject asm/{new_asm_base_name}.o{lsf_suffix}\n'
        break

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

    new_asm_inc_path = os.path.join(INCLUDE_FOLDER, f'{new_asm_base_name}.inc')
    print('Creating', new_asm_inc_path)
    write_inc_file(new_asm_lines, new_asm_inc_path)

function_body = f"""{function_header}
{{

}}"""
if nonmatching:
    function_body = f"""#ifdef NONMATCHING
{function_body}
#endif"""

# Add the extracted function to a .h and .c file.
# If there is an existing C file adjacent to the extracted function, add the function to that file.
# Otherwise, make a new set of files.
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
        file_guard = f'PMDSKY_{extract_file_name.upper()}_H'
        new_header_file.write(f'#ifndef {file_guard}\n#define {file_guard}\n\n')
        new_header_file.write(f'{function_header};\n\n')
        new_header_file.write(f'#endif //{file_guard}\n')

    src_file_path = os.path.join(SRC_FOLDER, f'{extract_file_name}.c')
    print('Creating', src_file_path)
    with open(src_file_path, 'w') as new_src_file:
        new_src_file.write(f'#include "{extract_file_name}.h\"\n\n{function_body}\n')
