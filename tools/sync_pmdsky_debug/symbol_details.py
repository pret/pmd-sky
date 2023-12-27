from dataclasses import dataclass

MIXED_CASE_SYMBOLS_ARM9 = {
    '_s32_div_f': '__divsi3',
    '_u32_div_f': '__udivsi3',
    '_secure': 'SECURE',
    '_start_AutoloadDoneCallback': 'StartAutoloadDoneCallback',
    '_start_ModuleParams': 'START_MODULE_PARAMS',
    'SVC_CpuSet': 'Svc_CpuSet',
    'SVC_SoftReset': 'Svc_SoftReset',
    'SVC_WaitByLoop': 'Svc_WaitByLoop',
}

MIXED_CASE_SYMBOLS_ARM7 = {
    '_start': '_start_arm7',
    '_start_AutoloadDoneCallback': 'StartAutoloadDoneCallbackArm7',
    'do_autoload': 'do_autoload_arm7',
}

WRAM_OFFSET = 0x1477E18

@dataclass
class SymbolDetails:
    name: str
    file_path: str
    is_data: bool
