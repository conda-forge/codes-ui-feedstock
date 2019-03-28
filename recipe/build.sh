#!/usr/bin/env bash

set -e # Abort on error.

if [[ $(uname) == Darwin ]]; then
    export LIBRARY_SEARCH_VAR=DYLD_FALLBACK_LIBRARY_PATH
elif [[ $(uname) == Linux ]]; then
    export LIBRARY_SEARCH_VAR=LD_LIBRARY_PATH
fi

export PYTHON=
export LDFLAGS="$LDFLAGS -L$PREFIX/lib -Wl,-rpath,$PREFIX/lib"
export CFLAGS="$CFLAGS -fPIC -I$PREFIX/include"

CODESUI_SRC_DIR="$SRC_DIR/metview/src/codes_ui"
mkdir ../build && cd ../build

# Needed for build
export TMPDIR=/tmp/

cmake -D CMAKE_INSTALL_PREFIX=$PREFIX \
      -D CMAKE_MODULE_PATH=$SRC_DIR/cmake \
      $CODESUI_SRC_DIR

make -j $CPU_COUNT

make install
