#!/usr/bin/env bash

set +x
set -e # Abort on error

[[ -d build ]] || mkdir build
cd build

cmake -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_CXX_FLAGS="-std=c++14" \
      -DCMAKE_PREFIX_PATH=$PREFIX \
      -DCMAKE_INSTALL_PREFIX=$PREFIX \
      -DBUILD_TESTING=OFF \
      -DOTB_USE_6S=ON \
      -DOTB_USE_CURL=ON \
      -DOTB_USE_GLEW=OFF \
      -DOTB_USE_GLFW=OFF \
      -DOTB_USE_GLUT=OFF \
      -DOTB_USE_GSL=ON \
      -DOTB_USE_LIBKML=ON \
      -DOTB_USE_LIBSVM=ON \
      -DOTB_USE_MPI=OFF \
      -DOTB_USE_MUPARSER=ON \
      -DOTB_USE_MUPARSERX=ON \
      -DOTB_USE_OPENCV=ON \
      -DOTB_USE_OPENGL=OFF \
      -DOTB_USE_QT=OFF \
      -DOTB_USE_QWT=OFF \
      -DOTB_USE_SHARK=ON \
      -DOTB_USE_SIFTFAST=ON \
      -DOTB_USE_SPTW=OFF \
      -DOTB_WRAP_PYTHON=ON \
      -DOTB_USE_OPENMP=ON \
      -DOTB_USE_SSE_FLAGS=ON \
      ..

make -j${CPU_COUNT}
make install

ACTIVATE_DIR=$PREFIX/etc/conda/activate.d
DEACTIVATE_DIR=$PREFIX/etc/conda/deactivate.d
mkdir -p $ACTIVATE_DIR
mkdir -p $DEACTIVATE_DIR

cp $RECIPE_DIR/scripts/activate.sh $ACTIVATE_DIR/otb-activate.sh
cp $RECIPE_DIR/scripts/deactivate.sh $DEACTIVATE_DIR/otb-deactivate.sh
