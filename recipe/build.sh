#!/usr/bin/env bash

set -o xtrace -o nounset -o pipefail -o errexit

cmake -B build -S ${SRC_DIR} -G Ninja \
    -D CMAKE_BUILD_TYPE=Release \
    ${CMAKE_ARGS}

cmake --build build -j ${CPU_COUNT}
cmake --install build
