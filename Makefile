# The directory in which to place the thesis PDF document after it is built.
OUTPUT_DIR = output

.PHONY: default
default: all install

.PHONY: all clean
all clean:
	(cd doc && make -$(MAKEFLAGS) $@)

.PHONY: install
install:
	if [ ! -d $(OUTPUT_DIR) ]; then mkdir -p $(OUTPUT_DIR); fi
	cp -a doc/main.pdf $(OUTPUT_DIR)/thesis.pdf
