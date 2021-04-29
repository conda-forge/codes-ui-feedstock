#!/usr/bin/env bash

set -e # Abort on error.

export PYTHON=
export LDFLAGS="$LDFLAGS -L$PREFIX/lib -Wl,-rpath,$PREFIX/lib"
export CFLAGS="$CFLAGS -fPIC -I$PREFIX/include"

if [[ $(uname) == Linux ]]; then
  # workaround for https://github.com/conda-forge/qt-feedstock/issues/123
  sed -i 's|_qt5gui_find_extra_libs(EGL.*)|_qt5gui_find_extra_libs(EGL "EGL" "" "")|g' $PREFIX/lib/cmake/Qt5Gui/Qt5GuiConfigExtras.cmake
  sed -i 's|_qt5gui_find_extra_libs(OPENGL.*)|_qt5gui_find_extra_libs(OPENGL "GL" "" "")|g' $PREFIX/lib/cmake/Qt5Gui/Qt5GuiConfigExtras.cmake
fi


CODESUI_SRC_DIR="$SRC_DIR"
mkdir ../build && cd ../build

# Needed for build
export TMPDIR=/tmp/

cmake -D CMAKE_INSTALL_PREFIX=$PREFIX \
      -D CMAKE_BUILD_TYPE=Release \
      -D CMAKE_MODULE_PATH=$SRC_DIR/cmake \
      $CODESUI_SRC_DIR

make -j $CPU_COUNT

make install
