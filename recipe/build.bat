@echo on
@setlocal EnableDelayedExpansion

cmake -B build -S %SRC_DIR% -G Ninja ^
      -D CMAKE_BUILD_TYPE=Release ^
      %CMAKE_ARGS%
if errorlevel 1 exit 1

cmake --build build -j %CPU_COUNT%
if errorlevel 1 exit 1

cmake --install build
if errorlevel 1 exit 1
