#!/usr/bin/env bash

set -eu -o pipefail

mkdir -p $PREFIX/bin
mkdir -p $PREFIX/lib

mkdir -p build
cd build
cmake -DCMAKE_BUILD_TYPE=RELEASE -DCONDA_BUILD=TRUE -DCMAKE_OSX_DEPLOYMENT_TARGET=10.9 -DCMAKE_INSTALL_PREFIX:PATH=$PREFIX -DBOOST_ROOT=$PREFIX -DBoost_NO_SYSTEM_PATHS=TRUE ..
make install CFLAGS="-L${PREFIX}/lib -I${PREFIX}/include"
