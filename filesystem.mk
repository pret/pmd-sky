NITROFS_FILES_FILE := nitrofs_files.txt
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
filesystem: $(NITROFS_FILES)
ifeq ($(COMPARE),1)
	$(SHA1SUM) --quiet -c $(WORK_DIR)/$(buildname)/filesystem.sha1
endif

clean-fs: clean-filesystem
clean-filesystem:
	$(RM) $(DIFF_ARCS) $(NAIXS)
	$(RM) -r $(FS_CLEAN_TARGETS)
