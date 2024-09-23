#
# Omega Race for the Commander X16 ("OmegaX16")
# Build makefile
#

BUILD_DIR = $(shell `pwd`)/build
SRC_DIR = $(shell `pwd`)/src

all: omega

omega:
	mkdir -p $(BUILD_DIR)
	cl65 -t cx16 -o $(BUILD_DIR)/omegax16.prg $(BUILD_DIR)/omega.s -m $(BUILD_DIR)/omega.map -l $(BUILD_DIR)/omega.lst

clean:
	rm -rf $(BUILD_DIR)
