mkdir ..\build
cd ..\build

set TMPDIR=%LOCALAPPDATA%\Temp

:: replace backslash with forward slash to avoid an 'Invalid character escape' error.
set CMAKE_MODULE_PATH=%SRC_DIR%\cmake
set CMAKE_MODULE_PATH=%CMAKE_MODULE_PATH:\=/%

cmake -G "NMake Makefiles" ^
      -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
      -D CMAKE_MODULE_PATH=%CMAKE_MODULE_PATH% ^
      -D CMAKE_BUILD_TYPE=Release ^
      %SRC_DIR%
if errorlevel 1 exit 1

nmake
if errorlevel 1 exit 1

nmake install
if errorlevel 1 exit 1
