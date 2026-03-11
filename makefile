# directorios y compilador configurables
CXX      := g++
CXXFLAGS := -std=c++11 -O2 -Wall
SRC_DIR  := src
BIN_DIR  := bin

# lista de fuentes y ejecutables correspondientes
SOURCES  := $(wildcard $(SRC_DIR)/*.cpp)
PROGRAMS := $(patsubst $(SRC_DIR)/%.cpp,$(BIN_DIR)/%,$(SOURCES))

### reglas principales
all: $(PROGRAMS)

# cada programa se construye a partir de la fuente homónima
$(BIN_DIR)/%: $(SRC_DIR)/%.cpp | $(BIN_DIR)
	$(CXX) $(CXXFLAGS) $< -o $@

# asegurarnos de que el directorio de bin existe
$(BIN_DIR):
	mkdir -p $(BIN_DIR)

.PHONY: all clean

clean:
	rm -rf $(BIN_DIR)/*

# fin del makefile

