mkdir ../build
cd ../build

set TMPDIR=%LOCALAPPDATA%\Temp

cmake -G "NMake Makefiles" ^
      -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
      -D CMAKE_MODULE_PATH=%SRC_DIR%/cmake ^
      -D CMAKE_BUILD_TYPE=Release ^
      %SRC_DIR%/metview/src/codes_ui
if errorlevel 1 exit 1

nmake
if errorlevel 1 exit 1

nmake install
if errorlevel 1 exit 1
