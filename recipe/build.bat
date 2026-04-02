@echo on
@setlocal EnableDelayedExpansion

cmake -B build -S %SRC_DIR% -G Ninja ^
      -D CMAKE_BUILD_TYPE=Release ^
      -D _WIN32=1 ^
      -D CMAKE_CXX_STANDARD=17 ^
      -D CMAKE_CXX_EXTENSIONS=OFF ^
      -D CMAKE_CXX_FLAGS="/Zc:__cplusplus /permissive-" ^
      %CMAKE_ARGS%
if errorlevel 1 exit 1

cmake --build build -j %CPU_COUNT%
if errorlevel 1 exit 1

cmake --install build
if errorlevel 1 exit 1
