GAME_REMASTER      ?= 0
GAME_LANGUAGE      ?= NORTH_AMERICA
NONMATCHING        ?= FALSE

buildname     := pmdsky
shortname     := sky
TITLE_NAME    := POKEDUN SORA
GAME_CODE     := C2S

ifneq ($(GAME_REMASTER),0)
buildname := $(buildname).rev$(GAME_REMASTER)
endif

ifeq ($(GAME_LANGUAGE),NORTH_AMERICA)
buildname := $(buildname).us
GAME_CODE := $(GAME_CODE)E
else ifeq ($(GAME_LANGUAGE),EUROPE)
buildname := $(buildname).eu
GAME_CODE := $(GAME_CODE)P
else ifeq ($(GAME_LANGUAGE),JAPAN)
buildname := $(buildname).jp
GAME_CODE := $(GAME_CODE)J
else
$(error Unsupported game language: $(GAME_LANGUAGE))
endif

BUILD_DIR         := build/$(buildname)
NEFNAME           := main

GF_DEFINES  := -DGAME_REMASTER=$(GAME_REMASTER) -D$(GAME_LANGUAGE)
ifeq ($(NO_GF_ASSERT),)
GF_DEFINES  += -DPM_KEEP_ASSERTS
endif
ifeq ($(NONMATCHING),TRUE)
GF_DEFINES  += -DNONMATCHING
endif
GLB_DEFINES := -DSDK_ARM9 -DSDK_CODE_ARM -DSDK_FINALROM
DEFINES = $(GF_DEFINES) $(GLB_DEFINES)

# Secure CRC
ifeq ($(buildname),pmdsky.us)
SECURE_CRC := 0x96A1
else ifeq ($(buildname),pmdsky.eu)
SECURE_CRC := 0x8EBE
else ifeq ($(buildname),pmdsky.jp)
SECURE_CRC := 0x74E4
endif

ifndef SECURE_CRC
$(error Unsupported ROM: $(GAME_LANGUAGE))
endif

SUPPORTED_ROMS   := pmdsky.us pmdsky.eu pmdsky.jp
ifneq ($(filter $(buildname),$(SUPPORTED_ROMS)),$(buildname))
$(error $(buildname) is not supported, choose from: $(SUPPORTED_ROMS))
endif
