	.bss
	.global SCRIPT_VARS_VALUES
SCRIPT_VARS_VALUES:
	.space 0x400
	.global DEBUG_SPECIAL_EPISODE_NUMBER
DEBUG_SPECIAL_EPISODE_NUMBER:
	.space 0x4
	.global KAOMADO_STREAM
KAOMADO_STREAM:
	.space 0x48
	.global _022AB4F8
_022AB4F8:
	.space 0x4
	.global PENDING_DUNGEON_ID
PENDING_DUNGEON_ID:
	.space 0x14
	.global _022AB510
_022AB510:
	.space 0x8
	.global _022AB518
_022AB518:
	.space 0x90
	.global _022AB5A8
_022AB5A8:
	.space 0x4
	.global _022AB5AC
_022AB5AC:
	.space 0xE8
	.global PLAY_TIME_SECONDS
PLAY_TIME_SECONDS:
	.space 0x8
	.global _022AB69C
_022AB69C:
	.space 0x27C
	.global TEAM_NAME
TEAM_NAME:
#ifdef JAPAN
	.space 0x8
#else
	.space 0xC
#endif
	.global _022AB924
_022AB924:
	.space 0x8
	.global LEVEL_UP_DATA_MONSTER_ID
LEVEL_UP_DATA_MONSTER_ID:
	.space 0x4
	.global LEVEL_UP_DATA_DECOMPRESS_BUFFER
LEVEL_UP_DATA_DECOMPRESS_BUFFER:
	.space 0x4B0
	.global TEAM_MEMBER_TABLE
TEAM_MEMBER_TABLE:
	.space 0x99A8
	.global _022B5788
_022B5788:
	.space 0x4
	.global _022B578C
_022B578C:
	.space 0x30
	.global _022B57BC
_022B57BC:
	.space 0x4
	.global _022B57C0
_022B57C0:
	.space 0x4C
	.global _022B580C
_022B580C:
	.space 0x104
	.global _022B5910
_022B5910:
	.space 0x1600
	.global _022B6F10
_022B6F10:
	.space 0x400
	.global _022B7310
_022B7310:
	.space 0x10
	.global _022B7320
_022B7320:
	.space 0x10
	.global DRIVER_WORK
DRIVER_WORK:
	.space 0x1
	.global _022B7331
_022B7331:
	.space 0x3
	.global _022B7334
_022B7334:
	.space 0xC
	.global _022B7340
_022B7340:
	.space 0xC
	.global _022B734C
_022B734C:
	.space 0x24
	.global _022B7370
_022B7370:
	.space 0x10
	.global _022B7380
_022B7380:
	.space 0x8
	.global _022B7388
_022B7388:
	.space 0x600
	.global _022B7988
_022B7988:
	.space 0x8
	.global _022B7990
_022B7990:
	.space 0x4
	.global _022B7994
_022B7994:
	.space 0x4
	.global _022B7998
_022B7998:
	.space 0x4
	.global _022B799C
_022B799C:
	.space 0x94
	.global _022B7A30
_022B7A30:
	.space 0xE
	.global _022B7A3E
_022B7A3E:
	.space 0x2E
	.global _022B7A6C
_022B7A6C:
	.space 0x8C4
	.global _022B8330
_022B8330:
	.space 0xD14
	.global _022B9044
_022B9044:
	.space 0xC8
	.global _022B910C
_022B910C:
	.space 0x14
	.global _022B9120
_022B9120:
	.space 0x10
	.global _022B9130
_022B9130:
	.space 0xD8
	.global _022B9208
_022B9208:
	.space 0x2C
	.global _022B9234
_022B9234:
	.space 0xCC
	.global _022B9300
_022B9300:
	.space 0x184
	.global _022B9484
_022B9484:
	.space 0x38
	.global _022B94BC
_022B94BC:
	.space 0xC8
	.global _022B9584
_022B9584:
	.space 0x4
	.global sDispMode
sDispMode: ; 0x022B9588
	.space 0x2
	.global GXi_VRamLockId
GXi_VRamLockId: ; 0x022B958A
	.space 0x2
	.global gGXState
gGXState: ; 0x022B958C
	.space 0x2
	.global _022B958E
_022B958E:
	.space 0x2
	.global _022B9590
_022B9590:
	.space 0x2
	.global _022B9592
_022B9592:
	.space 0x2
	.global _022B9594
_022B9594:
	.space 0x2
	.global _022B9596
_022B9596:
	.space 0x2
	.global _022B9598
_022B9598:
	.space 0x2
	.global _022B959A
_022B959A:
	.space 0x2
	.global _022B959C
_022B959C:
	.space 0x2
	.global _022B959E
_022B959E:
	.space 0x2
	.global _022B95A0
_022B95A0:
	.space 0x2
	.global _022B95A2
_022B95A2:
	.space 0x2
	.global _022B95A4
_022B95A4:
	.space 0x4
	.global sSubBGExtPltt
sSubBGExtPltt: ; 0x022B95A8
	.space 0x1C
	.global sClrImg
sClrImg: ; 0x022B95C4
	.space 0x20
	.global _022B95E4
_022B95E4:
	.space 0x4
	.global _022B95E8
_022B95E8:
	.space 0x4
	.global _022B95EC
_022B95EC:
	.space 0x28
	.global _022B9614
_022B9614:
	.space 0x4
	.global _022B9618
_022B9618:
	.space 0x4
	.global _022B961C
_022B961C:
	.space 0x28
	.global _022B9644
_022B9644:
	.space 0x4
	.global THREAD_INFO_STRUCT
THREAD_INFO_STRUCT:
	.space 0xC
	.global _022B9654
_022B9654:
	.space 0x18
	.global _022B966C
_022B966C:
	.space 0x4
	.global _022B9670
_022B9670:
	.space 0xC
	.global _022B967C
_022B967C:
	.space 0xC0
	.global _022B973C
_022B973C:
	.space 0x188
	.global _022B98C4
_022B98C4:
	.space 0x8
	.global _022B98CC
_022B98CC:
	.space 0x24
	.global _022B98F0
_022B98F0:
	.space 0x4
	.global _022B98F4
_022B98F4:
	.space 0x4
	.global _022B98F8
_022B98F8:
	.space 0x24
	.global _022B991C
_022B991C:
	.space 0x80
	.global _022B999C
_022B999C:
	.space 0x4
	.global _022B99A0
_022B99A0:
	.space 0x8
	.global _022B99A8
_022B99A8:
	.space 0x8
	.global _022B99B0
_022B99B0:
	.space 0xC
	.global _022B99BC
_022B99BC:
	.space 0x14
	.global _022B99D0
_022B99D0:
	.space 0x4
	.global _022B99D4
_022B99D4:
	.space 0x4
	.global _022B99D8
_022B99D8:
	.space 0x14
	.global _022B99EC
_022B99EC:
	.space 0x4
	.global _022B99F0
_022B99F0:
#ifdef JAPAN
	.space 0x18
#else
	.space 0x30
#endif
	.global _022B9A20
_022B9A20:
	.space 0x24
	.global _022B9A44
_022B9A44:
	.space 0x3C
	.global _022B9A80
_022B9A80:
	.space 0x280
	.global _022B9D00
_022B9D00:
	.space 0xD20
	.global _022BAA20
_022BAA20:
	.space 0xAC8
	.global _022BB4E8
_022BB4E8:
	.space 0x18
	.global _022BB500
_022BB500:
	.space 0x60
	.global _022BB560
_022BB560:
	.space 0x4
	.global _022BB564
_022BB564:
	.space 0x4
	.global _022BB568
_022BB568:
	.space 0x80
	.global _022BB5E8
_022BB5E8:
	.space 0x4
	.global _022BB5EC
_022BB5EC:
	.space 0xC
	.global _022BB5F8
_022BB5F8:
	.space 0x4
	.global _022BB5FC
_022BB5FC:
	.space 0x8
	.global _022BB604
_022BB604:
	.space 0x8
	.global _022BB60C
_022BB60C:
	.space 0x8
	.global _022BB614
_022BB614:
	.space 0x5C
	.global _022BB670
_022BB670:
	.space 0x1C
	.global _022BB68C
_022BB68C:
	.space 0x20
	.global _022BB6AC
_022BB6AC:
	.space 0xC
	.global _022BB6B8
_022BB6B8:
	.space 0xC
	.global _022BB6C4
_022BB6C4:
	.space 0x4
	.global _022BB6C8
_022BB6C8:
	.space 0x10
	.global _022BB6D8
_022BB6D8:
	.space 0x18
	.global _022BB6F0
_022BB6F0:
	.space 0x4
	.global _022BB6F4
_022BB6F4:
	.space 0x24
	.global _022BB718
_022BB718:
	.space 0xC
	.global _022BB724
_022BB724:
	.space 0x3C
	.global _022BB760
_022BB760:
	.space 0x20
	.global _022BB780
_022BB780:
	.space 0x60
	.global _022BB7E0
_022BB7E0:
	.space 0x620
	.global _022BBE00
_022BBE00:
	.space 0x20
	.global _022BBE20
_022BBE20:
	.space 0x220
	.global _022BC040
_022BC040:
	.space 0x8
	.global _022BC048
_022BC048:
	.space 0x4
	.global _022BC04C
_022BC04C:
	.space 0x14
	.global _022BC060
_022BC060:
	.space 0x20
	.global _022BC080
_022BC080:
	.space 0x4
	.global _022BC084
_022BC084:
	.space 0xBC
	.global _022BC140
_022BC140:
	.space 0xE8
	.global _022BC228
_022BC228:
	.space 0x4
	.global _022BC22C
_022BC22C:
	.space 0x424
	.global _022BC650
_022BC650:
	.space 0x24
	.global _022BC674
_022BC674:
	.space 0x24
	.global _022BC698
_022BC698:
	.space 0xD8
	.global _022BC770
_022BC770:
	.space 0x100
	.global _022BC870
_022BC870:
	.space 0x100
	.global _022BC970
_022BC970:
	.space 0x100
	.global _022BCA70
_022BCA70:
	.space 0x4
	.global _022BCA74
_022BCA74:
	.space 0xC
