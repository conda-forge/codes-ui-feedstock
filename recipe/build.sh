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

BASE_DIR="$(pwd)"
SRC_DIR=$BASE_DIR/metview/src/codes_ui
BUILD_DIR=$BASE_DIR/../build
mkdir $BUILD_DIR
cd $BUILD_DIR

# Needed for build
export TMPDIR=/tmp/

cmake $SRC_DIR \
    -DCMAKE_INSTALL_PREFIX=$PREFIX \
    -DCMAKE_MODULE_PATH=$BASE_DIR/cmake

make -j $CPU_COUNT
eval ${LIBRARY_SEARCH_VAR}=$PREFIX/lib

make install
