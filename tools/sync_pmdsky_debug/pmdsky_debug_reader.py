import os
import yaml
from containing_folder import CONTAINING_FOLDER
from typing import Dict
from symbol_details import SymbolDetails

SYMBOLS_FOLDER = 'symbols'
pmdsky_debug_path = None

def get_pmdsky_debug_location() -> str:
    global pmdsky_debug_path
    if not pmdsky_debug_path:
        debug_location_path = os.path.join('tools', CONTAINING_FOLDER, 'pmdsky_debug_location.txt')
        if not os.path.exists(debug_location_path):
            print('Missing file path to pmdsky-debug in pmdsky_debug_location.txt.')
            exit(1)

        with open(debug_location_path, 'r') as debug_location_file:
            pmdsky_debug_path = debug_location_file.read().strip()

        if not os.path.exists(pmdsky_debug_path) or not os.path.exists(os.path.join(pmdsky_debug_path, 'check_and_format.sh')):
            print('pmdsky-debug not found at', pmdsky_debug_path)
            exit(1)
    return pmdsky_debug_path

# In the returned dictionary, outer key = region, inner key = symbol address, value = symbol details.
def read_pmdsky_debug_symbols() -> Dict[str, Dict[int, SymbolDetails]]:
    pmdsky_debug_symbols: Dict[str, Dict[int, SymbolDetails]] = {}

    pmdsky_debug_path = get_pmdsky_debug_location()

    def read_yaml_symbols(file_path: str, symbols: Dict[int, SymbolDetails] = None, address_suffix = '') -> Dict[int, SymbolDetails]:
        if symbols is None:
            symbols = {}
        full_file_path = os.path.join(pmdsky_debug_path, SYMBOLS_FOLDER, file_path)
        with open(full_file_path, 'r') as symbols_file:
            symbols_yaml = yaml.safe_load(symbols_file)

        for function in symbols_yaml[list(symbols_yaml.keys())[0]]['functions']:
            if 'NA' not in function['address']:
                continue
            addresses = function['address'][f'NA{address_suffix}']
            function_name = function['name']
            if isinstance(addresses, list):
                for address in addresses:
                    symbols[address] = SymbolDetails(f'{function_name}__{address:08X}', full_file_path)
            else:
                symbols[addresses] = SymbolDetails(function_name, full_file_path)

        return symbols

    itcm_file = os.path.join('arm9', 'itcm.yml')

    pmdsky_debug_symbols['main'] = read_yaml_symbols('arm9.yml')
    pmdsky_debug_symbols['main'] = read_yaml_symbols(itcm_file, pmdsky_debug_symbols['main'])
    pmdsky_debug_symbols['ITCM'] = read_yaml_symbols(itcm_file, address_suffix='-ITCM')
    for i in range(0, 36):
        overlay_name = f'overlay{i:02d}'
        pmdsky_debug_symbols[str(i)] = read_yaml_symbols(f'{overlay_name}.yml')
        overlay_folder = os.path.join(pmdsky_debug_path, SYMBOLS_FOLDER, overlay_name)
        if os.path.exists(overlay_folder):
            for file in os.listdir(overlay_folder):
                if file.endswith('.yml'):
                    read_yaml_symbols(os.path.join(overlay_name, file), pmdsky_debug_symbols[str(i)])

    return pmdsky_debug_symbols
