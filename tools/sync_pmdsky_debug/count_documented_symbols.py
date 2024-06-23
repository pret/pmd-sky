import re
from typing import Dict
from xmap_reader import read_xmap_symbols

UNDOCUMENTED_SYMBOL_MATCHER = re.compile(r'_[0-9A-F]{8}$')

xmap_symbols = read_xmap_symbols()

def get_fraction_and_percent(documented_count, total_count):
    return f'{documented_count}/{total_count} ({documented_count / total_count:.4%})'

class SymbolCount:
    num_documented_data_symbols: int = 0
    total_data_symbols: int = 0
    num_documented_symbols: int = 0
    total_symbols: int = 0

    def print_counts(self):
        if self.total_data_symbols != self.total_symbols:
            print(f'Total:     {get_fraction_and_percent(self.num_documented_symbols, self.total_symbols)}')
            print(f'Functions: {get_fraction_and_percent(self.num_documented_symbols - self.num_documented_data_symbols, self.total_symbols - self.total_data_symbols)}')
        print(f'Data:      {get_fraction_and_percent(self.num_documented_data_symbols, self.total_data_symbols)}')
        print()

symbol_counts: Dict[str, SymbolCount] = {}
for overlay, symbols in xmap_symbols['us'].items():
    if overlay == 'ram':
        continue

    symbol_count = SymbolCount()
    symbol_counts[overlay] = symbol_count

    symbol_count.total_symbols = len(symbols)

    for symbol in symbols.values():
        if not UNDOCUMENTED_SYMBOL_MATCHER.search(symbol.name) and 'UNKNOWN' not in symbol.name:
            symbol_count.num_documented_symbols += 1
            if symbol.is_data:
                symbol_count.num_documented_data_symbols += 1
        if symbol.is_data:
            symbol_count.total_data_symbols += 1

    if symbol_count.total_symbols > 0:
        if overlay == 'main':
            overlay = 'ARM9'
        elif overlay == 'arm7':
            overlay = 'ARM7'
        else:
            overlay = f'Overlay {overlay}'
        print(overlay)
        symbol_count.print_counts()

all_symbol_count = SymbolCount()
all_symbol_count.num_documented_data_symbols = sum([count.num_documented_data_symbols for count in symbol_counts.values()])
all_symbol_count.num_documented_symbols = sum([count.num_documented_symbols for count in symbol_counts.values()])
all_symbol_count.total_data_symbols = sum([count.total_data_symbols for count in symbol_counts.values()])
all_symbol_count.total_symbols = sum([count.total_symbols for count in symbol_counts.values()])

all_symbol_count.print_counts()