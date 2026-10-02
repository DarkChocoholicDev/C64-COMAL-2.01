ACME     = "$(ACMEPath)\acme.exe"
CARTCONV = "$(VICEPath)\cartconv.exe"

ROOT_DIR   = ..\..\..
BUILD_DIR  = VS\C64-Comal80\C64-Comal80\build
CORE_BIN   = $(BUILD_DIR)\comal80_core.bin
CORE_SYMS  = $(BUILD_DIR)\comal80_core.sym
EXT_BIN    = $(BUILD_DIR)\comal80_ext.bin
BIN        = $(BUILD_DIR)\comal80_Com.bin
CRT        = $(BUILD_DIR)\Comal80_Com.crt

all: $(CRT)

$(ROOT_DIR)\build:
	if not exist "$(ROOT_DIR)\build" mkdir "$(ROOT_DIR)\build"

$(CORE_BIN): $(ROOT_DIR)\code\comal_main_Com.asm $(ROOT_DIR)\build
	cd /d "$(ROOT_DIR)" && $(ACME) -f plain -l "$(CORE_SYMS)" -o "$(CORE_BIN)" "code\comal_main_Com.asm"

$(EXT_BIN): $(ROOT_DIR)\code\comal_ext_Com.asm $(ROOT_DIR)\build
	cd /d "$(ROOT_DIR)" && $(ACME) -f plain -o "$(EXT_BIN)" "code\comal_ext_Com.asm"

$(BIN): $(CORE_BIN) $(EXT_BIN)
	cd /d "$(ROOT_DIR)" && copy /b "$(CORE_BIN)"+"$(EXT_BIN)" "$(BIN)" >nul

$(CRT): $(BIN)
	cd /d "$(ROOT_DIR)" && $(CARTCONV) -i "$(BIN)" -t comal -n "COMAL-80" -o "$(CRT)"

clean:
	cd /d "$(ROOT_DIR)" && if exist "$(BIN)" del /q "$(BIN)"
	cd /d "$(ROOT_DIR)" && if exist "$(CRT)" del /q "$(CRT)"

rebuild: clean all