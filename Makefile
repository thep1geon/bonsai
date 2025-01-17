BIN_DIR 		:= ./bin

BOOTLOADER_DIR 	:= ./src/bootloader
KERNEL_DIR 		:= ./src/kernel

all: bootloader

bootloader: $(BOOTLOADER_DIR)
	make -C $(BOOTLOADER_DIR)

run: bootloader
	qemu-system-x86_64 -drive format=raw,file=$(BIN_DIR)/boot.bin

clean:
	rm -rf $(BIN_DIR)/*
