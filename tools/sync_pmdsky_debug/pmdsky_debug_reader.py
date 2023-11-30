import os
import yaml
from typing import Dict, List

from containing_folder import CONTAINING_FOLDER
from symbol_details import SymbolDetails

SYMBOLS_FOLDER = 'symbols'
pmdsky_debug_path = None

LANGUAGE_KEYS_PMDSKY_DEBUG_TO_XMAP = {
    'NA': 'us',
    'EU': 'eu',
}

LANGUAGE_KEYS_XMAP_TO_PMDSKY_DEBUG = {value: key for key, value in LANGUAGE_KEYS_PMDSKY_DEBUG_TO_XMAP.items()}

# Symbols with duplicate addresses that should be ignored.
SYMBOL_BLACKLIST = set([
    'EXCLUSIVE_ITEM_STAT_BOOST_DATA',
    'GAME_STATE_VALUES',
])

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

"""
Dictionary format:
{
    <language>: {
        <codeRegion>: {
            <symbolAddress>: {
                Symbol details
            }
        }
    }
}
"""
def read_pmdsky_debug_symbols() -> Dict[str, Dict[str, Dict[int, SymbolDetails]]]:
    pmdsky_debug_symbols: Dict[str, Dict[str, Dict[int, SymbolDetails]]] = {}
    for language in LANGUAGE_KEYS_PMDSKY_DEBUG_TO_XMAP:
        pmdsky_debug_symbols[LANGUAGE_KEYS_PMDSKY_DEBUG_TO_XMAP[language]] = {}

    pmdsky_debug_path = get_pmdsky_debug_location()

    def read_yaml_symbols(file_path: str, symbols_key: str, address_suffix = '') -> Dict[int, SymbolDetails]:
        full_file_path = os.path.join(pmdsky_debug_path, SYMBOLS_FOLDER, file_path)
        with open(full_file_path, 'r') as symbols_file:
            symbols_yaml: Dict[str, any] = yaml.safe_load(symbols_file)

        def read_symbols_from_array(array_key: str, is_data: bool):
            for symbol in symbols_yaml[list(symbols_yaml.keys())[0]][array_key]:
                for language in symbol['address'].keys():
                    if not language.endswith(address_suffix):
                        continue
                    base_language: str = language.replace(address_suffix, '')
                    if base_language not in LANGUAGE_KEYS_PMDSKY_DEBUG_TO_XMAP:
                        continue

                    language_symbols = pmdsky_debug_symbols[LANGUAGE_KEYS_PMDSKY_DEBUG_TO_XMAP[base_language]]
                    if symbols_key not in language_symbols:
                        language_symbols[symbols_key] = {}
                    symbols = language_symbols[symbols_key]

                    addresses: int | List[int] = symbol['address'][language]
                    symbol_name: str = symbol['name']
                    if symbol_name in SYMBOL_BLACKLIST:
                        continue

                    def add_symbol_address(address: int, symbol_details: SymbolDetails):
                        if address in symbols:
                            print(f'Warning: Duplicate symbols found for address {hex(address)}: {symbols[address].name}, {symbol_details.name}')
                        symbols[address] = symbol_details

                    if isinstance(addresses, list):
                        if len(addresses) > 1:
                            for address in addresses:
                                add_symbol_address(address, SymbolDetails(f'{symbol_name}__{address:08X}', full_file_path, is_data))
                        else:
                            add_symbol_address(addresses[0], SymbolDetails(symbol_name, full_file_path, is_data))
                    else:
                        add_symbol_address(addresses, SymbolDetails(symbol_name, full_file_path, is_data))

        read_symbols_from_array('functions', False)
        read_symbols_from_array('data', True)

    itcm_file = os.path.join('arm9', 'itcm.yml')

    read_yaml_symbols('arm9.yml', 'main')
    read_yaml_symbols(itcm_file, 'main')
    read_yaml_symbols(itcm_file, 'ITCM', address_suffix='-ITCM')
    read_yaml_symbols('arm7.yml', 'arm7')
    for i in range(0, 36):
        overlay_name = f'overlay{i:02d}'
        read_yaml_symbols(f'{overlay_name}.yml', str(i))
        overlay_folder = os.path.join(pmdsky_debug_path, SYMBOLS_FOLDER, overlay_name)
        if os.path.exists(overlay_folder):
            for file in os.listdir(overlay_folder):
                if file.endswith('.yml'):
                    read_yaml_symbols(os.path.join(overlay_name, file), str(i))

    return pmdsky_debug_symbols
