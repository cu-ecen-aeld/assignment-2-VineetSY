CC=gcc
TARGET = writer
CROSS_COMPILE ?=
SRC = $(TARGET).c
OBJ = $(TARGET).o

# Default target
all: $(TARGET) fileresult.txt

$(TARGET): $(OBJ)
	$(CROSS_COMPILE)$(CC) -o $@ $^

$(OBJ): $(SRC)
	$(CROSS_COMPILE)$(CC) -c $< -o $@

fileresult.txt: $(TARGET)
ifneq ($(CROSS_COMPILE),)
	file writer > ../assignment-autotest/test/assignment2/fileresult.txt
endif

clean:
	rm -rf $(TARGET) $(OBJ)
