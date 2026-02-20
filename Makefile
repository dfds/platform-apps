base_dir := apps
charts_with_makefiles := $(shell find $(base_dir) -name 'Makefile' -printf "%h\n")

all: $(charts_with_makefiles)

$(charts_with_makefiles):
	@$(MAKE) -C $@

.PHONY: all $(charts_with_makefiles)