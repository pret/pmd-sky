ifeq ($(GAME_LANGUAGE),NORTH_AMERICA)
NITROFS_FILES_FILE := nitrofs_files.txt
LANGUAGE_SPECIFIC_DIR := US
EU_SPECIFIC_DIR := US
JP_SPECIFIC_DIR := US
else ifeq ($(GAME_LANGUAGE),EUROPE)
NITROFS_FILES_FILE := nitrofs_files_eu.txt
LANGUAGE_SPECIFIC_DIR := EU
EU_SPECIFIC_DIR := EU
JP_SPECIFIC_DIR := US
else ifeq ($(GAME_LANGUAGE),JAPAN)
NITROFS_FILES_FILE := nitrofs_files_jp.txt
LANGUAGE_SPECIFIC_DIR := JP
EU_SPECIFIC_DIR := US
JP_SPECIFIC_DIR := JP
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
ifeq ($(SKIP_COPY_NITROFS),)
	cp -r files/language-specific/$(LANGUAGE_SPECIFIC_DIR)/SCRIPT files/SCRIPT
	cp files/language-specific/$(LANGUAGE_SPECIFIC_DIR)/FONT/banner.bin files/FONT/banner.bin
	cp files/language-specific/$(LANGUAGE_SPECIFIC_DIR)/FONT/banner_c.bin files/FONT/banner_c.bin
	cp files/language-specific/$(LANGUAGE_SPECIFIC_DIR)/FONT/banner_s.bin files/FONT/banner_s.bin
	cp files/language-specific/$(LANGUAGE_SPECIFIC_DIR)/GROUND/s05p02a1.wan files/GROUND/s05p02a1.wan
	cp files/language-specific/$(LANGUAGE_SPECIFIC_DIR)/GROUND/s05p02a3.wan files/GROUND/s05p02a3.wan
	cp files/language-specific/$(LANGUAGE_SPECIFIC_DIR)/GROUND/s05p02b1.wan files/GROUND/s05p02b1.wan
	cp files/language-specific/$(LANGUAGE_SPECIFIC_DIR)/GROUND/s05p02c1.wan files/GROUND/s05p02c1.wan
	cp files/language-specific/$(LANGUAGE_SPECIFIC_DIR)/MAP_BG/bg_list.dat files/MAP_BG/bg_list.dat

	cp files/language-specific/$(EU_SPECIFIC_DIR)/BALANCE/item_p.bin files/BALANCE/item_p.bin
	cp files/language-specific/$(EU_SPECIFIC_DIR)/FONT/staffont.dat files/FONT/staffont.dat
	cp files/language-specific/$(EU_SPECIFIC_DIR)/GROUND/s05p02a2.wan files/GROUND/s05p02a2.wan
	cp files/language-specific/$(EU_SPECIFIC_DIR)/GROUND/v04p03a1.wan files/GROUND/v04p03a1.wan
	cp files/language-specific/$(EU_SPECIFIC_DIR)/MAP_BG/s99p02a.bma files/MAP_BG/s99p02a.bma
	cp files/language-specific/$(EU_SPECIFIC_DIR)/MAP_BG/s99p02a.bpc files/MAP_BG/s99p02a.bpc
	cp files/language-specific/$(EU_SPECIFIC_DIR)/MAP_BG/s99p02a.bpl files/MAP_BG/s99p02a.bpl
	cp files/language-specific/$(EU_SPECIFIC_DIR)/MESSAGE/text_e.str files/MESSAGE/text_e.str

	cp -r files/language-specific/$(JP_SPECIFIC_DIR)/DWC files/DWC
	cp files/language-specific/$(JP_SPECIFIC_DIR)/BALANCE/st_i2n_j.bin files/BALANCE/st_i2n_j.bin
	cp files/language-specific/$(JP_SPECIFIC_DIR)/BALANCE/st_m2n_j.bin files/BALANCE/st_m2n_j.bin
	cp files/language-specific/$(JP_SPECIFIC_DIR)/BALANCE/st_n2m_j.bin files/BALANCE/st_n2m_j.bin
	cp files/language-specific/$(JP_SPECIFIC_DIR)/DUNGEON/dungeon.bin files/DUNGEON/dungeon.bin
	cp files/language-specific/$(JP_SPECIFIC_DIR)/FONT/kanji.dat files/FONT/kanji.dat
	cp files/language-specific/$(JP_SPECIFIC_DIR)/FONT/markfont.dat files/FONT/markfont.dat
	cp files/language-specific/$(JP_SPECIFIC_DIR)/FONT/w_icon.wan files/FONT/w_icon.wan
	cp files/language-specific/$(JP_SPECIFIC_DIR)/GROUND/s05p03a2.wan files/GROUND/s05p03a2.wan
	cp files/language-specific/$(JP_SPECIFIC_DIR)/GROUND/s08p01a1.wan files/GROUND/s08p01a1.wan
	cp files/language-specific/$(JP_SPECIFIC_DIR)/MAP_BG/s11p02c.bma files/MAP_BG/s11p02c.bma
	cp files/language-specific/$(JP_SPECIFIC_DIR)/MAP_BG/s11p02c.bpc files/MAP_BG/s11p02c.bpc
	cp files/language-specific/$(JP_SPECIFIC_DIR)/MAP_BG/s11p02c.bpl files/MAP_BG/s11p02c.bpl
	cp files/language-specific/$(JP_SPECIFIC_DIR)/MAP_BG/s13p01a.bma files/MAP_BG/s13p01a.bma
	cp files/language-specific/$(JP_SPECIFIC_DIR)/MAP_BG/s13p01a.bpc files/MAP_BG/s13p01a.bpc
	cp files/language-specific/$(JP_SPECIFIC_DIR)/MAP_BG/s13p01a.bpl files/MAP_BG/s13p01a.bpl
	cp files/language-specific/$(JP_SPECIFIC_DIR)/MAP_BG/s13p01b.bpl files/MAP_BG/s13p01b.bpl
	cp files/language-specific/$(JP_SPECIFIC_DIR)/MAP_BG/s99p03a.bma files/MAP_BG/s99p03a.bma
	cp files/language-specific/$(JP_SPECIFIC_DIR)/MAP_BG/s99p03a.bpc files/MAP_BG/s99p03a.bpc
	cp files/language-specific/$(JP_SPECIFIC_DIR)/MAP_BG/s99p03a.bpl files/MAP_BG/s99p03a.bpl
	cp files/language-specific/$(JP_SPECIFIC_DIR)/MONSTER/m_attack.bin files/MONSTER/m_attack.bin
	cp files/language-specific/$(JP_SPECIFIC_DIR)/MONSTER/m_ground.bin files/MONSTER/m_ground.bin
	cp files/language-specific/$(JP_SPECIFIC_DIR)/SYSTEM/165.srl files/SYSTEM/165.srl
	cp files/language-specific/$(JP_SPECIFIC_DIR)/SYSTEM/166.srl files/SYSTEM/166.srl
	cp files/language-specific/$(JP_SPECIFIC_DIR)/SYSTEM/167.srl files/SYSTEM/167.srl
	cp files/language-specific/$(JP_SPECIFIC_DIR)/SYSTEM/168.srl files/SYSTEM/168.srl
	cp files/language-specific/$(JP_SPECIFIC_DIR)/SYSTEM/169.srl files/SYSTEM/169.srl
	cp files/language-specific/$(JP_SPECIFIC_DIR)/SYSTEM/170.srl files/SYSTEM/170.srl
endif

ifeq ($(COMPARE),1)
	$(SHA1SUM) --quiet -c $(WORK_DIR)/$(buildname)/filesystem.sha1
endif

clean-fs: clean-filesystem
clean-filesystem: clean-language-specific-files
	$(RM) $(DIFF_ARCS) $(NAIXS)
	$(RM) -r $(FS_CLEAN_TARGETS)

clean-language-specific-files:
ifeq ($(SKIP_COPY_NITROFS),)
	$(RM) -r files/DWC
	$(RM) -r files/SCRIPT
	$(RM) files/BALANCE/item_p.bin
	$(RM) files/BALANCE/st_i2n_j.bin
	$(RM) files/BALANCE/st_m2n_j.bin
	$(RM) files/BALANCE/st_n2m_j.bin
	$(RM) files/DUNGEON/dungeon.bin
	$(RM) files/FONT/banner.bin
	$(RM) files/FONT/banner_c.bin
	$(RM) files/FONT/banner_s.bin
	$(RM) files/FONT/kanji.dat
	$(RM) files/FONT/markfont.dat
	$(RM) files/FONT/staffont.dat
	$(RM) files/FONT/w_icon.wan
	$(RM) files/GROUND/s05p02a1.wan
	$(RM) files/GROUND/s05p02a2.wan
	$(RM) files/GROUND/s05p02a3.wan
	$(RM) files/GROUND/s05p02b1.wan
	$(RM) files/GROUND/s05p02c1.wan
	$(RM) files/GROUND/s05p03a2.wan
	$(RM) files/GROUND/s08p01a1.wan
	$(RM) files/GROUND/v04p03a1.wan
	$(RM) files/MAP_BG/bg_list.dat
	$(RM) files/MAP_BG/s11p02c.bma
	$(RM) files/MAP_BG/s11p02c.bpc
	$(RM) files/MAP_BG/s11p02c.bpl
	$(RM) files/MAP_BG/s13p01a.bma
	$(RM) files/MAP_BG/s13p01a.bpc
	$(RM) files/MAP_BG/s13p01a.bpl
	$(RM) files/MAP_BG/s13p01b.bpl
	$(RM) files/MAP_BG/s99p02a.bma
	$(RM) files/MAP_BG/s99p02a.bpc
	$(RM) files/MAP_BG/s99p02a.bpl
	$(RM) files/MAP_BG/s99p03a.bma
	$(RM) files/MAP_BG/s99p03a.bpc
	$(RM) files/MAP_BG/s99p03a.bpl
	$(RM) files/MESSAGE/text_e.str
	$(RM) files/MONSTER/m_attack.bin
	$(RM) files/MONSTER/m_ground.bin
	$(RM) files/SYSTEM/165.srl
	$(RM) files/SYSTEM/166.srl
	$(RM) files/SYSTEM/167.srl
	$(RM) files/SYSTEM/168.srl
	$(RM) files/SYSTEM/169.srl
	$(RM) files/SYSTEM/170.srl
endif
