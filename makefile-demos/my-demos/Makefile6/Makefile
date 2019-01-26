# Makefile version 1
#CC := g++
#FLAGS := -std=c++11 -w

#bin/main.exe : build/main.o build/support.o
#	@mkdir -p bin
#	$(CC) $(FLAGS) -I./include build/support.o build/main.o -o $@

#build/support.o : src/support.cpp
#	@mkdir -p build
#	$(CC) $(FLAGS) -I./include -c src/support.cpp -o $@

#build/main.o : src/main.cpp
#	@mkdir -p build
#	$(CC) $(FLAGS) -I./include -c src/main.cpp -o $@

#clean:
#	@rm -rf build
#	@rm -rf bin



# Makefile version 2
#CC := g++
#FLAGS := -std=c++11 -w
#INC_DIR := include
#SRC_DIR := src
#BUILD_DIR := build
#BIN_DIR := bin
#INCLUDE := -I./$(INC_DIR)

#$(BIN_DIR)/main.exe : $(BUILD_DIR)/support.o $(BUILD_DIR)/main.o
#	@mkdir -p $(BIN_DIR)
#	$(CC) $(FLAGS) $(INCLUDE) $(BUILD_DIR)/support.o $(BUILD_DIR)/main.o -o $@

#$(BUILD_DIR)/support.o : $(SRC_DIR)/support.cpp
#	@mkdir -p $(BUILD_DIR)
#	$(CC) $(FLAGS) $(INCLUDE) -c $(SRC_DIR)/support.cpp -o $@

#$(BUILD_DIR)/main.o : $(SRC_DIR)/main.cpp
#	@mkdir -p $(BUILD_DIR)
#	$(CC) $(FLAGS) $(INCLUDE) -c $(SRC_DIR)/main.cpp -o $@

#clean:  
#	@rm -rf $(BUILD_DIR)
#	@rm -rf $(BIN_DIR)



# Makefile version 3
CC := g++
FLAGS := -std=c++11 -w
INC_DIR := include
SRC_DIR := src
BUILD_DIR := build
BIN_DIR := bin
INCLUDE := -I./$(INC_DIR)

# $^表示依赖文件的集合，用空格分隔
$(BIN_DIR)/main.exe : $(BUILD_DIR)/support.o $(BUILD_DIR)/main.o
	@mkdir -p $(BIN_DIR)
	$(CC) $(FLAGS) $(INCLUDE) $^ -o $@

# $<表示第一个依赖文件
$(BUILD_DIR)/%.o : $(SRC_DIR)/%.cpp
	@mkdir -p $(BUILD_DIR)
	$(CC) $(FLAGS) $(INCLUDE) -c $< -o $@

clean:  
	@rm -rf $(BUILD_DIR)
	@rm -rf $(BIN_DIR)
