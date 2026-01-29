# Makefile for Malloc implementation in C

# Compiler and flags
CC := gcc
CFLAGS := -Wall -Wextra -Wpedantic -std=c11
CFLAGS_DEBUG := $(CFLAGS) -g -O0
CFLAGS_RELEASE := $(CFLAGS) -O2
LDFLAGS :=

# Directories
SRC_DIR := .
BUILD_DIR := build
BIN_DIR := bin

# Target executable
TARGET := $(BIN_DIR)/malloc

# Source files and object files
SOURCES := alloc.c
OBJECTS := $(BUILD_DIR)/alloc.o

# Default target
.PHONY: all
all: $(TARGET)

# Debug build
.PHONY: debug
debug: CFLAGS := $(CFLAGS_DEBUG)
debug: clean $(TARGET)

# Release build
.PHONY: release
release: CFLAGS := $(CFLAGS_RELEASE)
release: clean $(TARGET)

# Build directories
$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

$(BIN_DIR):
	mkdir -p $(BIN_DIR)

# Link executable
$(TARGET): $(OBJECTS) | $(BIN_DIR)
	$(CC) $(LDFLAGS) -o $@ $^

# Compile object files
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c | $(BUILD_DIR)
	$(CC) $(CFLAGS) -c -o $@ $<

# Run the program
.PHONY: run
run: $(TARGET)
	$(TARGET)

# Clean build artifacts
.PHONY: clean
clean:
	rm -rf $(BUILD_DIR) $(BIN_DIR)

# Clean and rebuild
.PHONY: rebuild
rebuild: clean all

# Display help
.PHONY: help
help:
	@echo "Makefile targets:"
	@echo "  all       - Build the project (default)"
	@echo "  debug     - Build with debug symbols and no optimization"
	@echo "  release   - Build optimized release binary"
	@echo "  run       - Build and run the program"
	@echo "  clean     - Remove build artifacts"
	@echo "  rebuild   - Clean and rebuild"
	@echo "  help      - Display this help message"

.PHONY: .SILENT
