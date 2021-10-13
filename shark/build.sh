#!/usr/bin/env bash
set +x
set -e

mkdir build
cd build

cmake \
    -DCMAKE_PREFIX_PATH=$PREFIX \
    -DCMAKE_INSTALL_PREFIX=$PREFIX \
    -DBUILD_SHARED_LIBS=ON \
    -DBUILD_EXAMPLES=OFF \
    -DBUILD_TESTING=OFF \
    -DENABLE_CBLAS=ON \
    -DENABLE_OPENMP=ON \
    ..
make -j${CPU_COUNT}
make install
