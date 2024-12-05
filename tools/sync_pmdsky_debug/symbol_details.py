from dataclasses import dataclass, field
from typing import List

# Some symbol names in the decomp do not match pmdsky-debug because of naming convention differences.
# Map these symbol names between the two projects to avoid changes when syncing the projects.
NONMATCHING_SYMBOLS_ARM9 = {
    '_secure': 'SECURE',
    '_start_AutoloadDoneCallback': 'StartAutoloadDoneCallback',
    '_start_ModuleParams': 'START_MODULE_PARAMS',
    'CRYPTO_RC4Init': 'Crypto_RC4Init',
    'disableBankForX_': 'DisableBankForX',
    'FX_AtanIdxTable_': 'FX_ATAN_IDX_TABLE',
    'G2x_ChangeBlendBrightness_': 'G2x_ChangeBlendBrightness',
    'G2x_SetBlendAlpha_': 'G2x_SetBlendAlpha',
    'G2x_SetBlendBrightness_': 'G2x_SetBlendBrightness',
    'G3i_LookAt_': 'G3i_LookAt',
    'G3i_OrthoW_': 'G3i_OrthoW',
    'gGXState': 'ENABLED_VRAM_BANKS',
    'GX_BeginLoadBGExtPltt': 'GX_BeginLoadBgExtPltt',
    'GX_BeginLoadOBJExtPltt': 'GX_BeginLoadObjExtPltt',
    'GX_DisableBankForARM7': 'GX_DisableBankForArm7',
    'GX_DisableBankForBG': 'GX_DisableBankForBg',
    'GX_DisableBankForBGExtPltt': 'GX_DisableBankForBgExtPltt',
    'GX_DisableBankForLCDC': 'GX_DisableBankForLcdc',
    'GX_DisableBankForOBJ': 'GX_DisableBankForObj',
    'GX_DisableBankForOBJExtPltt': 'GX_DisableBankForObjExtPltt',
    'GX_DisableBankForSubBG': 'GX_DisableBankForSubBg',
    'GX_DisableBankForSubBGExtPltt': 'GX_DisableBankForSubBgExtPltt',
    'GX_DisableBankForSubOBJ': 'GX_DisableBankForSubObj',
    'GX_DisableBankForSubOBJExtPltt': 'GX_DisableBankForSubObjExtPltt',
    'GX_EndLoadBGExtPltt': 'GX_EndLoadBgExtPltt',
    'GX_EndLoadOBJExtPltt': 'GX_EndLoadObjExtPltt',
    'GX_InitGXState': 'GX_InitGxState',
    'GX_LoadBG0Char': 'GX_LoadBg0Char',
    'GX_LoadBG0Scr': 'GX_LoadBg0Scr',
    'GX_LoadBG1Char': 'GX_LoadBg1Char',
    'GX_LoadBG1Scr': 'GX_LoadBg1Scr',
    'GX_LoadBG2Char': 'GX_LoadBg2Char',
    'GX_LoadBG2Scr': 'GX_LoadBg2Scr',
    'GX_LoadBG3Char': 'GX_LoadBg3Char',
    'GX_LoadBG3Scr': 'GX_LoadBg3Scr',
    'GX_LoadBGPltt': 'GX_LoadBgPltt',
    'GX_LoadOAM': 'GX_LoadOam',
    'GX_LoadOBJ': 'GX_LoadObj',
    'GX_LoadOBJPltt': 'GX_LoadObjPltt',
    'GX_ResetBankForBGExtPltt': 'GX_ResetBankForBgExtPltt',
    'GX_ResetBankForOBJExtPltt': 'GX_ResetBankForObjExtPltt',
    'GX_ResetBankForSubBGExtPltt': 'GX_ResetBankForSubBgExtPltt',
    'GX_ResetBankForSubOBJExtPltt': 'GX_ResetBankForSubObjExtPltt',
    'GX_SetBankForARM7': 'GX_SetBankForArm7',
    'GX_SetBankForBG': 'GX_SetBankForBg',
    'GX_SetBankForBGExtPltt': 'GX_SetBankForBgExtPltt',
    'GX_SetBankForLCDC': 'GX_SetBankForLcdc',
    'GX_SetBankForOBJ': 'GX_SetBankForObj',
    'GX_SetBankForOBJExtPltt': 'GX_SetBankForObjExtPltt',
    'GX_SetBankForSubBG': 'GX_SetBankForSubBg',
    'GX_SetBankForSubBGExtPltt': 'GX_SetBankForSubBgExtPltt',
    'GX_SetBankForSubOBJ': 'GX_SetBankForSubObj',
    'GX_SetBankForSubOBJExtPltt': 'GX_SetBankForSubObjExtPltt',
    'GX_VRAMCNT_SetLCDC_': 'EnableVramBanksInSetDontSave',
    'GXi_DmaId': 'GXI_DMA_ID',
    'GXi_NopClearFifo128_': 'GXi_NopClearFifo128',
    'GXi_VRamLockId': 'GXI_VRAM_LOCK_ID',
    'GXS_BeginLoadBGExtPltt': 'Gxs_BeginLoadBgExtPltt',
    'GXS_BeginLoadOBJExtPltt': 'Gxs_BeginLoadObjExtPltt',
    'GXS_EndLoadBGExtPltt': 'Gxs_EndLoadBgExtPltt',
    'GXS_EndLoadOBJExtPltt': 'Gxs_EndLoadObjExtPltt',
    'GXS_LoadBG0Char': 'Gxs_LoadBg0Char',
    'GXS_LoadBG1Char': 'Gxs_LoadBg1Char',
    'GXS_LoadBG1Scr': 'Gxs_LoadBg1Scr',
    'GXS_LoadBGPltt': 'Gxs_LoadBgPltt',
    'GXS_LoadOAM': 'Gxs_LoadOam',
    'GXS_LoadOBJ': 'Gxs_LoadObj',
    'GXS_LoadOBJPltt': 'Gxs_LoadObjPltt',
    'GXS_SetGraphicsMode': 'Gxs_SetGraphicsMode',
    'GXx_SetMasterBrightness_': 'GXx_SetMasterBrightness',
    'INITi_CpuClear32': 'InitI_CpuClear32',
    'MTX_LookAt': 'Mtx_LookAt',
    'MTX_OrthoW': 'Mtx_OrthoW',
    'resetBankForX_': 'EnableVramBanksInSet',
    'sClrImg': 'CLR_IMG',
    'sDispMode': 'DISP_MODE',
    'sIsDispOn': 'IS_DISP_ON',
    'sSubBGExtPltt': 'SUB_BG_EXT_PLTT',
    'sTexPlttStartAddrTable': 'TEX_PLTT_START_ADDR_TABLE',
    'sTexStartAddrTable': 'TEX_START_ADDR_TABLE',
    'SVC_CpuSet': 'Svc_CpuSet',
    'SVC_SoftReset': 'Svc_SoftReset',
    'SVC_WaitByLoop': 'Svc_WaitByLoop',
    'VEC_CrossProduct': 'Vec_CrossProduct',
    'VEC_Distance': 'Vec_Distance',
    'VEC_DotProduct': 'Vec_DotProduct',
    'VEC_Normalize': 'Vec_Normalize',
}

NONMATCHING_SYMBOLS_ARM7 = {
    '_start': '_start_arm7',
    '_start_AutoloadDoneCallback': 'StartAutoloadDoneCallbackArm7',
    'do_autoload': 'do_autoload_arm7',
}

WRAM_OFFSET = 0x1477E18

ITCM_RAM_START_ADDRESSES = {
    'NA': 0x20B3380,
    'EU': 0x20B3CC0,
    'JP': 0x20B4BE0
}

@dataclass
class SymbolDetails:
    name: str
    file_path: str
    is_data: bool
    aliases: List[str] = field(default_factory=list)

    def get_all_names(self) -> List[str]:
        all_names = [self.name]
        all_names.extend(self.aliases)
        return all_names
