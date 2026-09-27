
WSLENV ?= no
ifeq ($(WSLENV),no)
  NOWINE = 0
else
  # As of build 17063, WSLENV is defined in both WSL1 and WSL2
  # so we need to use the kernel release to detect between
  # the two.
  UNAME_R := $(shell uname -r)
  ifeq ($(findstring WSL2,$(UNAME_R)),)
    NOWINE = 1
  else
    NOWINE = 0
  endif
endif

ifeq ($(OS),Windows_NT)
  EXE := .exe
  WINE :=
  GREP := grep -P
  SED := sed -r
  SHA1SUM := sha1sum
  MKTEMP := mktemp
else
  EXE :=
  WINE := wine
  UNAME_S := $(shell uname -s)
  ifeq ($(UNAME_S),Darwin)
    GREP := grep -E
    SED := gsed -r
    SHA1SUM := shasum
    MKTEMP := gmktemp
  else
    GREP := grep -P
    SED := sed -r
    SHA1SUM := sha1sum
    MKTEMP := mktemp
  endif
endif

ifeq ($(NOWINE),1)
  WINE :=
  WINPATH := wslpath
else
  WINPATH := winepath
endif

# Win32 runner selection, using wibo when USE_WIBO=1 and regular wine otherwise.
#
#   make install_wibo      # download wibo in tools/wibo/
#   make USE_WIBO=1        # build
#
# WIBO overrides which binary is used; it defaults to tools/wibo/* when present and otherwise to `wibo` on PATH.
#
# Nitro SDK tools are run using NITROWINE. It can be set separately like so:
#
#   make USE_WIBO=1 NITROWINE=wine
#
# if you find that WIBO doesn't work as well with those tools as compared to the Metrowerks compilers.

USE_WIBO ?= 0

ifneq ($(USE_WIBO),0)
  TOOLS_WIBO    := $(TOOLSDIR)/wibo/wibo
  WIBO          ?= $(if $(wildcard $(TOOLS_WIBO)),$(TOOLS_WIBO),wibo)
  # Make the path absolute as long as it's not just "wibo" (from PATH)
  WIBO_CMD      := $(if $(findstring /,$(WIBO)),$(abspath $(WIBO)),$(WIBO))
  WINE          := $(WIBO_CMD)
  WINPATH       := $(WIBO_CMD) path      # use `wibo path` under wibo instead of winepath
endif

NITROWINE ?= $(WINE)
