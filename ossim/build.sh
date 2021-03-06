#!/usr/bin/env bash
set +x
set -e

mkdir build
cd build

cmake -DCMAKE_PREFIX_PATH=$PREFIX -DCMAKE_INSTALL_PREFIX=$PREFIX \
      -DBUILD_OSSIM_MPI_SUPPORT=OFF \
      -DBUILD_OSSIM_FREETYPE_SUPPORT=ON \
      -DBUILD_OSSIM_APPS=OFF \
      -DBUILD_OSSIM_TEST_APPS=OFF \
      -DBUILD_OSSIM_FRAMEWORKS=OFF \
      -DINSTALL_ARCHIVE_DIR=lib \
      -DINSTALL_LIBRARY_DIRNG=lib
..
make -j${CPU_COUNT}
make install
