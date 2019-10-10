#!/usr/bin/env bash

set -e # Abort on error.

export PYTHON=
export LDFLAGS="$LDFLAGS -L$PREFIX/lib -Wl,-rpath,$PREFIX/lib"
export CFLAGS="$CFLAGS -fPIC -I$PREFIX/include"

CODESUI_SRC_DIR="$SRC_DIR"
mkdir ../build && cd ../build

# Needed for build
export TMPDIR=/tmp/

cmake -D CMAKE_INSTALL_PREFIX=$PREFIX \
      -D CMAKE_MODULE_PATH=$SRC_DIR/cmake \
      $CODESUI_SRC_DIR

make -j $CPU_COUNT

make install
