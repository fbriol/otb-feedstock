#!/usr/bin/env bash
set +x
set -e

[[ -d build ]] || mkdir build
cd build

cmake -DCMAKE_PREFIX_PATH=$PREFIX -DCMAKE_INSTALL_PREFIX=$PREFIX -DBUILD_SHARED_LIBS=ON  -DBUILD_EXAMPLES=OFF ..
make -j${CPU_COUNT}
make install
