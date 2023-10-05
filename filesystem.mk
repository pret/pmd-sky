ifeq ($(GAME_LANGUAGE),NORTH_AMERICA)
NITROFS_FILES_FILE := nitrofs_files.txt
LANGUAGE_SPECIFIC_DIR := NA
else ifeq ($(GAME_LANGUAGE),EUROPE)
NITROFS_FILES_FILE := nitrofs_files_eu.txt
LANGUAGE_SPECIFIC_DIR := EU
endif
# Tail is used to exclude the starting "NITROFS_FILES=".
NITROFS_FILES := $(tail -c +15 ${NITROFS_FILES_FILE})

$(DIFF_ARCS):
	cp $< $@

NARCS := $(filter %.narc,$(NITROFS_FILES) $(SRC_ARCS))
NAIXS := $(NARCS:%.narc=%.naix)

CSV2BINFLAGS := -i $(WORK_DIR)/include --naix

ifeq ($(NODEP),)
%.narc: csvdep = $(addprefix $(WORK_DIR)/include/,$(filter-out bool,$(shell cut -d: -f3 $(MANIFEST) | sort -u)))
else
%.narc: csvdep :=
endif

# This rule must come after the above includes
# and serves to enforce build order.
$(SCRIPT_BINS): $(FIRST_MSG_H_GEN)

$(filter-out $(DIFF_ARCS) $(FS_RULE_OVERRIDES),$(NITROFS_FILES)): ;

# This must come after the above includes
include graphics_files_rules.mk

NTR_FILE_EXT := bin NCGR NCLR NCER NSCR NSBMD NSBCA NSBTA

%.narc: NARC_DEPS = $(foreach ext,$(NTR_FILE_EXT),$(wildcard $*/*.$ext))
%.narc: $(NARC_DEPS)
	$(KNARC) -d $* -p $@ -i

%.naix: %.narc ;

.PHONY: filesystem clean-filesystem clean-fs

filesystem: $(NITROFS_FILES) clean-language-specific-files
	cp -r files/language-specific/$(LANGUAGE_SPECIFIC_DIR)/SCRIPT files/SCRIPT
	cp files/language-specific/$(LANGUAGE_SPECIFIC_DIR)/BALANCE/item_p.bin files/BALANCE/item_p.bin
	cp files/language-specific/$(LANGUAGE_SPECIFIC_DIR)/FONT/banner.bin files/FONT/banner.bin
	cp files/language-specific/$(LANGUAGE_SPECIFIC_DIR)/FONT/banner_c.bin files/FONT/banner_c.bin
	cp files/language-specific/$(LANGUAGE_SPECIFIC_DIR)/FONT/banner_s.bin files/FONT/banner_s.bin
	cp files/language-specific/$(LANGUAGE_SPECIFIC_DIR)/FONT/staffont.dat files/FONT/staffont.dat
	cp files/language-specific/$(LANGUAGE_SPECIFIC_DIR)/GROUND/s05p02a1.wan files/GROUND/s05p02a1.wan
	cp files/language-specific/$(LANGUAGE_SPECIFIC_DIR)/GROUND/s05p02a2.wan files/GROUND/s05p02a2.wan
	cp files/language-specific/$(LANGUAGE_SPECIFIC_DIR)/GROUND/s05p02a3.wan files/GROUND/s05p02a3.wan
	cp files/language-specific/$(LANGUAGE_SPECIFIC_DIR)/GROUND/s05p02b1.wan files/GROUND/s05p02b1.wan
	cp files/language-specific/$(LANGUAGE_SPECIFIC_DIR)/GROUND/s05p02c1.wan files/GROUND/s05p02c1.wan
	cp files/language-specific/$(LANGUAGE_SPECIFIC_DIR)/GROUND/v04p03a1.wan files/GROUND/v04p03a1.wan
	cp files/language-specific/$(LANGUAGE_SPECIFIC_DIR)/MAP_BG/bg_list.dat files/MAP_BG/bg_list.dat
	cp files/language-specific/$(LANGUAGE_SPECIFIC_DIR)/MAP_BG/s99p02a.bma files/MAP_BG/s99p02a.bma
	cp files/language-specific/$(LANGUAGE_SPECIFIC_DIR)/MAP_BG/s99p02a.bpc files/MAP_BG/s99p02a.bpc
	cp files/language-specific/$(LANGUAGE_SPECIFIC_DIR)/MAP_BG/s99p02a.bpl files/MAP_BG/s99p02a.bpl
	cp files/language-specific/$(LANGUAGE_SPECIFIC_DIR)/MESSAGE/text_e.str files/MESSAGE/text_e.str
ifeq ($(COMPARE),1)
	$(SHA1SUM) --quiet -c $(WORK_DIR)/$(buildname)/filesystem.sha1
endif

clean-fs: clean-filesystem
clean-filesystem: clean-language-specific-files
	$(RM) $(DIFF_ARCS) $(NAIXS)
	$(RM) -r $(FS_CLEAN_TARGETS)

clean-language-specific-files:
	$(RM) -r files/SCRIPT
	$(RM) files/BALANCE/item_p.bin
	$(RM) files/FONT/banner.bin
	$(RM) files/FONT/banner_c.bin
	$(RM) files/FONT/banner_s.bin
	$(RM) files/FONT/staffont.dat
	$(RM) files/GROUND/s05p02a1.wan
	$(RM) files/GROUND/s05p02a2.wan
	$(RM) files/GROUND/s05p02a3.wan
	$(RM) files/GROUND/s05p02b1.wan
	$(RM) files/GROUND/s05p02c1.wan
	$(RM) files/GROUND/v04p03a1.wan
	$(RM) files/MAP_BG/bg_list.dat
	$(RM) files/MAP_BG/s99p02a.bma
	$(RM) files/MAP_BG/s99p02a.bpc
	$(RM) files/MAP_BG/s99p02a.bpl
	$(RM) files/MESSAGE/text_e.str
