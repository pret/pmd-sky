from typing import List

ARM_FUNC_START = '\tarm_func_start '
BRANCH_LINK_INSTRUCTION = '\tbl '
BRANCH_LINK_EXCHANGE_INSTRUCTION = '\tblx '
BRANCH_INSTRUCTION = '\tb '
WORD_KEY = '.word '
WORD_PLUS_OFFSET = ' + 0x'
"""
Searches through an ASM file's contents for all external symbols, then populates a .inc file with all the necessary .public definitions.
"""
def write_inc_file(lines: List[str], file_path: str):
    defined_functions = set()
    used_functions = set()
    for line in lines:
        if line.startswith(ARM_FUNC_START):
            defined_functions.add(line[len(ARM_FUNC_START) : -1])
        elif line.startswith(BRANCH_LINK_INSTRUCTION):
            used_functions.add(line[len(BRANCH_LINK_INSTRUCTION) : -1])
        elif line.startswith(BRANCH_INSTRUCTION):
            function = line[len(BRANCH_INSTRUCTION) : -1]
            if function[0] != '_':
                semicolon_index = function.index(' ; ')
                used_functions.add(function[:semicolon_index])
        elif line.startswith(BRANCH_LINK_EXCHANGE_INSTRUCTION):
            function = line[len(BRANCH_LINK_EXCHANGE_INSTRUCTION) : -1]
            if function not in {'fp', 'ip', 'lr', 'sb', 'sl'} and not (
                function.startswith('r') and function[1:].isdigit() # rN
            ):
                used_functions.add(function)
        else:
            word_index = line.find(WORD_KEY)
            if word_index >= 0 and f'{WORD_KEY}0x' not in line:
                word_plus_offset_index = line.find(WORD_PLUS_OFFSET)
                if word_plus_offset_index >= 0:
                    new_word = line[word_index + len(WORD_KEY) : word_plus_offset_index]
                else:
                    new_word = line[word_index + len(WORD_KEY) : -1]

                if new_word[0] < '0' or new_word > '9':
                    used_functions.add(new_word)

    for function in defined_functions:
        if function in used_functions:
            used_functions.remove(function)

    write_lines = ['#pragma once\n']
    for function in sorted(used_functions):
        write_lines.append(f'.public {function}\n')

    with open(file_path, 'w') as inc_file:
        inc_file.writelines(write_lines)
