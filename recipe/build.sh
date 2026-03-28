#!/usr/bin/env bash

set -e # Abort on error.

# Needed for build
export TMPDIR=/tmp/

cmake -B build -S ${SRC_DIR} \
    --debug-find-pkg=Threads \
    -D CMAKE_BUILD_TYPE=Release \
    ${CMAKE_ARGS}

    # -D CMAKE_MODULE_PATH=$SRC_DIR/cmake \
cmake --build build -j ${CPU_COUNT}
cmake --install build
